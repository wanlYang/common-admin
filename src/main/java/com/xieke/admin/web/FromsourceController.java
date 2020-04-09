package com.xieke.admin.web;


import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Fromsource;
import com.xieke.admin.entity.Result;
import com.xieke.admin.service.FromsourceService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/fromsource")
@Controller
public class FromsourceController {

    @Resource
    protected FromsourceService fromsourceService;
    private Map<String, Object> map = new HashMap<String, Object>();

    @RequestMapping("/add")
    public String add() {
        return "/fromsource/add";
    }
    @RequestMapping("/edit")
    public String edit() {
        return "/fromsource/edit";
    }
    @RequestMapping("/list")
    public String list() {
        return "/fromsource/list";
    }


    @RequestMapping("/select")
    @ResponseBody
    public ResultInfo<List<Fromsource>> selectAllFromsource() {
        return new ResultInfo<>(fromsourceService.selectAllFromsource());
    }

    @RequestMapping("/select/all")
    @ResponseBody
    public Result selectAllFromsourceAll() {
        Result result = new Result();
        result.setStatus(200);
        result.setData(fromsourceService.selectAllFromsource());
        result.setMessage("获取成功");
        result.setCount(fromsourceService.selectAllFromsource().size());
        return result;
    }
    @RequestMapping("/add/submit")
    @ResponseBody
    public Result insertFromsource(Fromsource fromsource) {
        int x = fromsourceService.insertFromsource(fromsource);
        Result result = new Result();
        result.setStatus(200);
        result.setData(x);
        result.setMessage("添加成功");
        result.setCount(x);
        return result;
    }

    @RequestMapping("/edit/submit")
    @ResponseBody
    public Result edit(Fromsource fromsource) {
        int x = fromsourceService.updateFromsorce(fromsource);
        Result result = new Result();
        result.setStatus(200);
        result.setData(x);
        result.setMessage("添加成功");
        result.setCount(x);
        return result;
    }

    @RequestMapping("/del")
    @ResponseBody
    public Result deleteFromsorce(Integer id) {
        int x = fromsourceService.deleteFromsorce(id);
        if (x == 0){
            Result result = new Result();
            result.setStatus(-1);
            result.setData(x);
            result.setMessage("删除失败！包含子项！");
            result.setCount(x);
            return result;
        }
        Result result = new Result();
        result.setStatus(200);
        result.setData(x);
        result.setMessage("删除成功");
        result.setCount(x);
        return result;
    }
    @RequestMapping("/get/tree")
    public @ResponseBody
    List<Fromsource> getTree() {
        return fromsourceService.getFromSourceTree();
    }
}
