package com.xieke.admin.web;

import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.entity.*;
import com.xieke.admin.mapper.FirstmoneyMapper;
import com.xieke.admin.service.FirstmoneyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/first/money")
public class FirstmoneyController {

    @Resource
    private FirstmoneyService firstmoneyService;

    @Autowired
    private FirstmoneyMapper firstmoneyMapper;


    private Map<String,Object> map=new HashMap<String, Object>();

    @RequestMapping("/list")
    @RequiresPermissions("first:view")
    public String list(){
        return "/firstmoney/list";
    }

    @RequestMapping("/select/list")
    public String selectList(){
        return "/firstmoney/select_list";
    }

    @RequestMapping("/add")
    public String add(){
        return "/firstmoney/add";
    }
    @RequestMapping("/edit")
    public String edit(){
        return "/firstmoney/edit";
    }


    @RequestMapping("/list/data")

    public @ResponseBody
    Result listData(Integer page, Integer limit, String name, String phone) {
        List<Firstmoney> firstmoney = firstmoneyService.getAll(page,limit,name,phone);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(firstmoneyMapper.countByParam(name,phone));
        result.setData(firstmoney);
        return result;
    }
    @RequestMapping("/list/data/other")

    public @ResponseBody
    Result listDataOther(Integer page, Integer limit, String name, String phone,String customer_id) {
        List<Firstmoney> firstmoney = firstmoneyService.getAll(page,limit,name,phone,customer_id);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(firstmoneyMapper.countByParamByCustomerId(name,phone,customer_id));
        result.setData(firstmoney);
        return result;
    }

    @RequestMapping(value = "/add/submit",method = RequestMethod.POST)
    @ResponseBody
    public Result insertFirstmoney(Firstmoney firstmoney){
        System.out.println(firstmoney);
        Integer row = firstmoneyService.insertFirstmoney(firstmoney);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("添加成功@!");
        result.setCount(row);
        result.setData(row);
        return result;
    }

    @RequestMapping(value = "/edit/submit",method = RequestMethod.POST)
    @ResponseBody
    public Result editFirstmoney(Firstmoney firstmoney){
        Integer row = firstmoneyService.updateFirstmoney(firstmoney);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("编辑成功@!");
        result.setCount(row);
        result.setData(row);
        return result;
    }

    @RequestMapping("/printview/page")
    @SysLog("打印定金信息")
    @RequiresPermissions("first:printview")
    public ModelAndView printview(ModelAndView modelAndView, String number) throws Exception {
        //String s = jiemi.aesDecrypt(clubcardNum);
        modelAndView.setViewName("/firstmoney/contract/index");
        Firstmoney firstmoney = firstmoneyService.getFirstMoneyInfo(number);
        if (firstmoney == null){
            modelAndView.addObject("message","数据异常!");
            modelAndView.setViewName("/error/error");
            return modelAndView;
        }
        modelAndView.addObject("firstmoney",firstmoney);
        return modelAndView;
    }
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Map<String,Object> deleteFirstmoney(int id){
        int x = firstmoneyService.deleteFirstmoney(id);
        if(x>0){
            map.put("修改成功",x);
        }else{
            map.put("查询失败",x);
        }
        return map;
    }

}
