package com.xieke.admin.web;


import com.xieke.admin.entity.Integral;
import com.xieke.admin.entity.Result;
import com.xieke.admin.service.IntegralService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/integral")
public class IntegralController {

    @Resource
    protected IntegralService integralService;

    private Map<String,Object> map=new HashMap<String, Object>();

    @RequestMapping("/select")
    public Map<String, Object> selectAllIntegral(){
        List<Integral> integral = integralService.selectAllIntegral();
        if(integral!=null){
            map.put("查询成功",integral);
        }else{
            map.put("查询失败","未查询待任何信息");
        }
        return map;
    }

    @RequestMapping("/select/get/num")
    public Result select(String num){
        Integral integral = integralService.getByClubCardNum(num);
        return new Result(200,"获取成功!",0,integral);
    }
    @RequestMapping("/insert")
    public Map<String, Object> insertIntegral(Integral integral){
        int x=integralService.insertIntegral(integral);
        if(x>0){
            map.put("查询成功",x);
        }else{
            map.put("查询失败",x);
        }
        return map;
    }

    @RequestMapping("/update")
    public Map<String,Object> updateIntegral(Integral integral){
        int x=integralService.updateIntegral(integral);
        if(x>0){
            map.put("修改成功",x);
        }else{
            map.put("查询失败",x);
        }
        return map;
    }

    @RequestMapping("/delete")
    public Map<String,Object> deleteIntegral(int id){
        int x = integralService.deleteIntegral(id);
        if(x>0){
            map.put("修改成功",x);
        }else{
            map.put("查询失败",x);
        }
        return map;
    }

}
