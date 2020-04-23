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
import com.xieke.admin.util.SortListUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.xieke.admin.util.TimeSplit.getIntervalTimeList;
import static com.xieke.admin.web.pe.OfficeController.belongCalendar;

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

    /**
     * 查找当前时间(thisTime)有空闲的教练
     * @param thisTime
     * @param id
     * @param callback
     * @return
     * @throws ParseException
     */
    @ResponseBody
    @RequestMapping(value = "/time", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String dateTime(Date thisTime, String id, @RequestParam(value = "callback", required = false) final String callback) throws ParseException {
        boolean x;
        Map<String, Integer> map = new HashMap<>();
        Result result = new Result();
        if (!StringUtils.isNotBlank(id)) {
            result.setData(null);
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        List<Alltimes> alltimesList = new ArrayList<>();
        List<String> allTimes = new ArrayList<>();
        List<Office> thisTimeList = new ArrayList<>();
        SimpleDateFormat ist_ = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat ist = new SimpleDateFormat("HH:mm:ss");
        PrivateContract privateContract = contractService.findById(id);
        List<Shopping> shopping = shoppingService.findByContractId(id);
        List<Order> orders = orderService.findByContractId(id);
        if (privateContract == null) {
            result.setData(null);
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        if (privateContract.getIsFreeClass() == 0) {
            Office office = officeService.getOfficeByCoachId(privateContract.getCoach().getId());
            //教练未排班表导致排班 office 为空 报错
            if (office == null){
                result.setData(null);
                result.setStatus(-1);
                result.setMessage("出现异常!教练可能未排班!");
                return callback(callback, result);
            }
            x = belongCalendar(thisTime, office.getStarttime(), office.getEndtime());
            if (x) {
                thisTimeList.add(office);
                //当前教练上班时间按每半小时拆分
                List<String> qwe = getIntervalTimeList(ist.format(office.getOfficetime().getStarttime()), ist.format(office.getOfficetime().getEndtime()), 30);
                for (String i : qwe) {
                    allTimes.add(i);
                }
            }
        } else {
            List<Office> offices = officeService.selectOffice(); //查找所有教练的所有信息
            //判断当前时间正常上班的教练
            for (Office oftime : offices) {
                x = belongCalendar(thisTime, oftime.getStarttime(), oftime.getEndtime());
                if (x) {
                    thisTimeList.add(oftime);
                    //当前教练上班时间按每半小时拆分
                    List<String> qwe = getIntervalTimeList(ist.format(oftime.getOfficetime().getStarttime()), ist.format(oftime.getOfficetime().getEndtime()), 30);
                    for (String i : qwe) {
                        allTimes.add(i);
                    }
                }
            }
        }
        for (String str : allTimes) {
            int i = 1;
            if (map.get(str) != null) {
                i = map.get(str) + 1;
            }
            map.put(str, i);
        }

        for (String s : map.keySet()) {    //遍历Key值
            boolean a, b;
            boolean sameDay;
            boolean sameDayOrder;
            if (shopping == null || shopping.size() == 0) {
                a = false;
                sameDay = false;

            } else {
                a = belongCalendar(ist.parse(s), ist.parse(shopping.get(0).getStarttime()), ist.parse(shopping.get(0).getEndtime()));
                sameDay = DateUtils.isSameDay(thisTime, shopping.get(0).getThisday());
            }
            if (orders == null || orders.size() == 0) {
                b = false;
                sameDayOrder = false;
            } else {
                b = belongCalendar(ist.parse(s), ist.parse(orders.get(0).getStarttime()), ist.parse(orders.get(0).getEndtime()));
                sameDayOrder = DateUtils.isSameDay(thisTime, orders.get(0).getThisday());
            }


            if (map.get(s) > 0 && !a && !b && !sameDay && !sameDayOrder) {
                String st = ist_.format(thisTime);
                Alltimes alltimes = new Alltimes();
                alltimes.setChoiceDate(st);
                alltimes.setCount(map.get(s));
                alltimes.setTimes(s);
                alltimes.setCssClass("cando");
                alltimesList.add(alltimes);
            } else {
                String st = ist_.format(thisTime);
                Alltimes alltimes = new Alltimes();
                alltimes.setChoiceDate(st);
                alltimes.setCount(map.get(s));
                alltimes.setTimes(s);
                alltimes.setCssClass("notdo");
                alltimesList.add(alltimes);
            }
        }
        SortListUtil.sort(alltimesList, "times", SortListUtil.ASC); //通过times字段，将alltimesList进行排序
        result.setData(alltimesList);
        result.setStatus(200);
        result.setMessage("获取成功！");
        return callback(callback, result);

    }
    /**
     * 教练端时间安排,根据具体时间安排信息
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/time/arrange", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String time(String phone,Date time, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();
        boolean x;
        Map<String, Integer> map = new HashMap<>();
        if (!StringUtils.isNotBlank(phone)) {
            result.setData(null);
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        List<Alltimes> alltimesList = new ArrayList<>();
        List<String> allTimes = new ArrayList<>();
        List<Office> thisTimeList = new ArrayList<>();
        SimpleDateFormat ist_ = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat ist = new SimpleDateFormat("HH:mm:ss");
        Coach coach = coachService.findCoachByPhone(phone);
        if (coach == null) {
            result.setData(null);
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        Office office = officeService.getOfficeByCoachId(coach.getId());
        //教练未排班表导致排班 office 为空 报错
        if (office == null){
            result.setData(null);
            result.setStatus(-1);
            result.setMessage("出现异常!教练可能未排班!");
            return callback(callback, result);
        }
        x = belongCalendar(time, office.getStarttime(), office.getEndtime());
        if (x) {
            thisTimeList.add(office);
            //当前教练上班时间按每半小时拆分
            List<String> qwe = getIntervalTimeList(ist.format(office.getOfficetime().getStarttime()), ist.format(office.getOfficetime().getEndtime()), 30);
            for (String i : qwe) {
                allTimes.add(i);
            }
        }
        for (String str : allTimes) {
            int i = 1;
            if (map.get(str) != null) {
                i = map.get(str) + 1;
            }
            map.put(str, i);
        }
        for (String s : map.keySet()) {    //遍历Key值
            if (map.get(s) > 0) {
                String st = ist_.format(time);
                Alltimes alltimes = new Alltimes();
                alltimes.setChoiceDate(st);
                alltimes.setCount(map.get(s));
                alltimes.setTimes(s);
                alltimes.setCssClass("cando");
                alltimesList.add(alltimes);
            } else {
                String st = ist_.format(time);
                Alltimes alltimes = new Alltimes();
                alltimes.setChoiceDate(st);
                alltimes.setCount(map.get(s));
                alltimes.setTimes(s);
                alltimes.setCssClass("notdo");
                alltimesList.add(alltimes);
            }
        }
        SortListUtil.sort(alltimesList, "times", SortListUtil.ASC); //通过times字段，将alltimesList进行排序
        result.setData(alltimesList);
        result.setMessage("获取成功!");
        result.setStatus(200);
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
