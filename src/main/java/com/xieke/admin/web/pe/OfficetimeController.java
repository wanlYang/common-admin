package com.xieke.admin.web.pe;

import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.Officetime;
import com.xieke.admin.service.pe.OfficetimeServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/officetime")
public class OfficetimeController {

    @Resource
    private OfficetimeServer officetimeServer;


    @RequestMapping("/list")
    public String list(){ return "/officetime/list"; }
    @RequestMapping("/add")
    public String add(){ return "/officetime/add"; }
    @RequestMapping("/edit")
    public String edit(){ return "/officetime/edit"; }


    @ResponseBody
    @RequestMapping("/select")
    public Result selectOfficetime(Integer limit,Integer page,Officetime officetime){
        List<Officetime> officetimes = officetimeServer.selectOfficetime(page,limit,officetime);
        Integer counts = officetimeServer.countOfficetime();
        Result result = new Result();
        result.setMessage("搜索成功！");
        result.setStatus(200);
        result.setCount(counts);
        result.setData(officetimes);
        return result;
    }

    @ResponseBody
    @RequestMapping("/select/all")
    public Result selectOfficetimeAll(){
        List<Officetime> officetimes = officetimeServer.selectOfficetimeAll();
        Integer counts = officetimeServer.countOfficetime();
        Result result = new Result();
        result.setMessage("搜索成功！");
        result.setStatus(200);
        result.setCount(counts);
        result.setData(officetimes);
        return result;
    }

    @ResponseBody
    @RequestMapping("/update")
    public Result updateOfficetime(Officetime officetime){
        Integer officetimes = officetimeServer.updateOfficetime(officetime);
        Result result = new Result();
        result.setMessage("修改成功！");
        result.setStatus(200);
        result.setData(officetimes);
        return result;
    }

    @ResponseBody
    @RequestMapping("/insert")
    public Result insertOfficetime(Officetime officetime){
        Integer officetimes = officetimeServer.insertOfficetime(officetime);
        Result result = new Result();
        result.setMessage("添加成功！");
        result.setStatus(200);
        result.setData(officetimes);
        return result;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result deleteOfficetime(Officetime officetime){
        Integer officetimes = officetimeServer.delOfficetime(officetime);
        Result result = new Result();
        result.setMessage("删除成功！");
        result.setStatus(200);
        result.setData(officetimes);
        return result;
    }




}
