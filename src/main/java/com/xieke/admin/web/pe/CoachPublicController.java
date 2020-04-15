package com.xieke.admin.web.pe;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.Coach;
import com.xieke.admin.entity.pe.PrivateContract;
import com.xieke.admin.service.CustomerService;
import com.xieke.admin.service.pe.CoachService;
import com.xieke.admin.service.pe.ContractService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private ContractService contractService;


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
     * 教练端获取预约信息
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value = "/appointment/info", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String appointment(String phone, Date startTime, Date endTime, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();


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


    public String callback(String callback, Result result) {
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect);
    }

}
