package com.xieke.admin.web.pe;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.Coach;
import com.xieke.admin.entity.pe.PrivateContract;
import com.xieke.admin.service.pe.CoachService;
import com.xieke.admin.service.pe.ContractService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 教练端控制器
 */
@Controller
@RequestMapping("/coach/public")
public class CoachPublicController {

    @Autowired
    private CoachService coachService;

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
    public String appointment( String phone, @RequestParam(value = "callback", required = false) final String callback){
        Result result = new Result();


        return callback(callback,result);
    }



    public String callback(String callback, Result result) {
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect);
    }

}
