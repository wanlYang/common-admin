package com.xieke.admin.web;


import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Fromsource;
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
    @RequestMapping("/list")
    public String list() {
        return "/fromsource/list";
    }


    @RequestMapping("/select")
    public Map<String, Object> selectAllFromsource() {
        List<Fromsource> fromsources = fromsourceService.selectAllFromsource();
        if (fromsources != null) {
            map.put("查询成功", fromsources);
        } else {
            map.put("查询失败", "未查询待任何信息");
        }
        return map;
    }
    @RequestMapping("/insert")
    public Map<String, Object> insertFromsource(Fromsource fromsource) {
        int x = fromsourceService.insertFromsource(fromsource);
        if (x > 0) {
            map.put("查询成功", x);
        } else {
            map.put("查询失败", x);
        }
        return map;
    }
    @RequestMapping("/update")
    public Map<String, Object> updateFromsorce(Fromsource fromsource) {
        int x = fromsourceService.updateFromsorce(fromsource);
        if (x > 0) {
            map.put("修改成功", x);
        } else {
            map.put("查询失败", x);
        }
        return map;
    }
    @RequestMapping("/delete")
    public Map<String, Object> deleteFromsorce(Fromsource fromsource) {
        int x = fromsourceService.deleteFromsorce(fromsource);
        if (x > 0) {
            map.put("修改成功", x);
        } else {
            map.put("查询失败", x);
        }
        return map;
    }
    @RequestMapping("/get/tree")
    public @ResponseBody
    List<Fromsource> getTree() {
        return fromsourceService.getFromSourceTree();
    }
}
