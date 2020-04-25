package com.xieke.admin.web.pe;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.aliyuncs.exceptions.ClientException;
import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.*;
import com.xieke.admin.service.CustomerService;
import com.xieke.admin.service.pe.*;
import com.xieke.admin.util.MessageUtil;

import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.Serializable;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 教练端控制器
 */
@Controller
@RequestMapping("/coach/public")
@RestController
public class CoachPublicController implements Serializable {

    @Autowired
    private CoachService coachService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ContractService contractService;


    @Autowired
    private OfficeService officeService;
    @Autowired
    private ShoppingService shoppingService;

    /**
     * 教练手动登记来场会员信息!
     * @param id
     * @param callback
     * @return
     * @throws ParseException
     */
    @ResponseBody
    @RequestMapping(value = "/order/register", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String attendClass(String id, @RequestParam(value = "callback", required = false) final String callback) throws ParseException {
        Result result = new Result();
        Order order = orderService.findById(id);
        if (order == null){
            result.setStatus(-1);
            result.setMessage("参数异常！");
            result.setCount(0);
            return callback(callback, result);
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        SimpleDateFormat ds = new SimpleDateFormat("yyyy/MM/dd ");
        Date startTime = df.parse(ds.format(order.getThisday()) +order.getStarttime());
        int timeDelta = LoginController.getTimeDeltaNegative(startTime, new Date());
        int minute = (timeDelta%3600)/60;
        //还有15分钟上课时可以点击登记!
        if (15>=minute&& minute >= 0){
            Integer row = orderService.coachRegister(id);
            result.setStatus(200);
            result.setMessage("登记成功！");
            result.setCount(row);
            return callback(callback, result);
        }else if(minute >= 15){
            String totalTimeStr = timeDelta/(3600*24) + "天" + timeDelta/3600 + "时" + (timeDelta%3600)/60 + "分" + (timeDelta%3600)%60 + "秒";
            result.setStatus(-1);
            result.setMessage("登记失败！距离开课时间还有:" + totalTimeStr +",请提前15分钟入场登记,并提醒会员上课!");
            result.setCount(0);
            return callback(callback, result);
        }else if (minute <= 0){
            result.setStatus(-1);
            result.setMessage("登记失败！课程已经开始!");
            result.setCount(0);
            return callback(callback, result);
        }else{
            result.setStatus(-1);
            result.setMessage("数据异常!");
            result.setCount(0);
            return callback(callback, result);
        }
    }


    /**
     * 教练端登录方法
     * @param session
     * @param phone
     * @param password
     * @param callback
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String login(HttpSession session, String phone, String password, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        Coach coach = coachService.login(phone,password);
        if (coach == null){
            result.setStatus(-1);
            result.setMessage("账号或密码错误!");
            return callback(callback,result);
        }
        result.setStatus(200);
        result.setMessage("登陆成功!");
        result.setData(coach);
        session.setAttribute("coach",coach);
        return callback(callback,result);
    }
    /**
     * 教练端首页接口数据
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String coachIndex( String phone, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        //获取教练信息
        Coach coach = coachService.findCoachByPhone(phone);
        if (coach == null ){
            result.setStatus(-1);
            result.setMessage("教练信息异常!请重新登录");
            return callback(callback,result);
        }
        //获取教练会员信息
        List<PrivateContract> privateContracts = contractService.findContractByCoachId(coach.getId());
        Map<String,Object> data = new HashMap<>();
        data.put("coach",coach);
        data.put("contract",privateContracts);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setData(data);
        return callback(callback,result);
    }

    /**
     * 教练端首页搜索会员接口数据
     * @param phone
     * @param callback
     * @return
     */


    @RequestMapping(value = "/search/customer", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String coachSearch( String string,String phone, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        if(!StringUtils.isNotBlank(string)){
            result.setStatus(-1);
            result.setMessage("参数异常!");
            return callback(callback,result);
        }
        //获取教练信息
        Coach coach = coachService.findCoachByPhone(phone);
        if (coach == null ){
            result.setStatus(-1);
            result.setMessage("教练信息异常!请重新登录");
            return callback(callback,result);
        }
        List<PrivateContract> privateContracts = null;
        if (com.xieke.admin.util.StringUtils.isNumLegal(string)){
            privateContracts = contractService.findContractByCoachIdAndPhoneSearch(coach.getId(),string);
        }else{
            privateContracts = contractService.findContractByCoachIdAndNameSearch(coach.getId(),string);
        }
        Map<String,Object> data = new HashMap<>();
        data.put("coach",coach);
        data.put("contract",privateContracts);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setData(data);
        return callback(callback,result);
    }

    /**
     * 教练端获取预约信息
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/appointment/info", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String appointment(String phone, Date startTime, Date endTime, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        Coach coachByPhone = coachService.findCoachByPhone(phone);
        if (coachByPhone == null){
            result.setStatus(-1);
            result.setMessage("获取失败!");
            return callback(callback,result);
        }
        List<Order> orders = orderService.findReservedByCoachId(coachByPhone.getId());
        List<Order> orders1 = new ArrayList<>();
        for (Order order:orders) {
            boolean b = OfficeController.belongCalendar(order.getThisday(), startTime, endTime);
            if (b){
                orders1.add(order);
            }
        }
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setData(orders1);
        result.setCount(orders1.size());
        return callback(callback,result);
    }

    /**
     * 教练端获取已完成的预约信息
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/appointment/info/completed", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String appointmentCompleted(String phone, Date startTime, Date endTime, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        Coach coachByPhone = coachService.findCoachByPhone(phone);
        if (coachByPhone == null){
            result.setStatus(-1);
            result.setMessage("获取失败!");
            return callback(callback,result);
        }
        List<Order> orders = orderService.findCompletedByCoachId(coachByPhone.getId());
        List<Order> orders1 = new ArrayList<>();
        for (Order order:orders) {
            boolean b = OfficeController.belongCalendar(order.getThisday(), startTime, endTime);
            if (b){
                orders1.add(order);
            }
        }
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setData(orders1);
        result.setCount(orders1.size());
        return callback(callback,result);
    }

    /**
     * 教练端教练修改密码
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/change/pass", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String changePassword(String phone, String newPassword,String oldPassword, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        Coach coach = coachService.findCoachByPhone(phone);
        if (coach == null || !StringUtils.isNotBlank(newPassword) || !StringUtils.isNotBlank(oldPassword)){
            result.setStatus(-1);
            result.setMessage("获取教练信息异常!");
            return callback(callback,result);
        }
        if (!oldPassword.equals(coach.getPassword())){
            result.setStatus(-1);
            result.setMessage("原密码输入不一致!");
            return callback(callback,result);
        }
        Integer row = coachService.updatePassword(phone,newPassword);
        if (row > 0){
            result.setStatus(200);
            result.setMessage("修改成功!");
            return callback(callback,result);
        }else{
            result.setStatus(-1);
            result.setMessage("修改失败!");
            return callback(callback,result);
        }
    }
    /**
     * 教练端获取客户详情信息
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/customer/info", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String customerDetail(String phone, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        if (!StringUtils.isNotBlank(phone)){
            result.setMessage("参数异常!");
            result.setStatus(-1);
            return callback(callback,result);
        }

        Customer customer = customerService.getCustomerByPhone(phone);
        if (customer == null){
            result.setMessage("获取会员信息异常!");
            result.setStatus(-1);
            return callback(callback,result);
        }

        result.setMessage("获取成功!");
        result.setStatus(200);
        result.setData(customer);
        return callback(callback,result);

    }

    /**
     * 教练端获取客户私教信息
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/customer/coach/info", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String customerCoach(String phone, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        if (!StringUtils.isNotBlank(phone)){
            result.setMessage("参数异常!");
            result.setStatus(-1);
            return callback(callback,result);
        }

        Customer customer = customerService.getCustomerByPhone(phone);
        if (customer == null){
            result.setMessage("获取会员信息异常!");
            result.setStatus(-1);
            return callback(callback,result);
        }
        List<PrivateContract> contracts = contractService.getContractByCustomerId(String.valueOf(customer.getId()));
        result.setMessage("获取成功!");
        result.setStatus(200);
        result.setData(contracts);
        result.setCount(contracts.size());
        return callback(callback,result);
    }



    @ResponseBody
    @RequestMapping(value = "/forget", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String forget(HttpSession session, String phone, String code, String password, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        Coach coach = coachService.findCoachByPhone(phone);
        if (coach == null) {
            result.setStatus(-4);
            result.setMessage("手机号不存在!");
            return callback(callback, result);
        }
        if (session.getAttribute("coachcode") == null || session.getAttribute("coachcode") == "") {
            result.setStatus(-1);
            result.setMessage("验证码异常!");
            return callback(callback, result);
        } else if (code == null || code == "") {
            result.setStatus(-2);
            result.setMessage("验证码异常!");
            return callback(callback, result);
        } else if (!String.valueOf(session.getAttribute("coachcode")).equals(code)) {
            result.setStatus(-3);
            result.setMessage("验证码错误!");
            return callback(callback, result);
        }

        coach.setPassword(password);
        Integer row = coachService.updatePassword(coach.getPhone(),coach.getPassword());
        if (row > 0) {
            result.setStatus(200);
            result.setMessage("密码修改成功!");
            return callback(callback, result);
        }
        return callback(callback, result);
    }

    public String callback(String callback, Result result) {
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping(value = "/code", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String Code(String phone, HttpSession session, @RequestParam(value = "callback", required = false) final String callback) {
        int newcode = MessageUtil.getNewcode();
        Customer customer = customerService.getCustomerByPhone(phone);
        Result result = new Result();
        if (customer == null) {
            result.setStatus(-4);
            result.setMessage("手机号不存在!");
            return callback(callback, result);
        }
        session.setAttribute("coachcode", newcode);
        System.out.println(newcode);
        try {
            MessageUtil.sendSms(phone, newcode);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        result.setMessage("发送成功！");
        result.setStatus(200);
        return callback(callback, result);
    }

    public static void main(String[] args) {





    }

}
