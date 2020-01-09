package com.xieke.admin.web;

import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.*;
import com.xieke.admin.mapper.CustomerMapper;
import com.xieke.admin.service.CustomerService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 客户信息控制类
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController{

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerMapper customerMapper;


    @RequestMapping("/*")
    public void toHtml(){

    }

    @RequestMapping("/select/list")
    public String selectList(){
        return "/customer/select_list";
    }

    /**
     * 获取客户信息列表
     * @return
     */
    @RequestMapping("/listData")
    @RequiresPermissions("customer:view")
    public @ResponseBody
    Result listData(Integer page,Integer limit,String name,String phone) {
        List<Customer> customers = customerService.getAllCustomer(page,limit,name,phone);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(customerMapper.countByParam(name,phone));
        result.setData(customers);
        return result;
    }

    @SysLog("保存客户信息操作")
    @RequestMapping("/add/submit")
    @RequiresPermissions("customer:add")
    public @ResponseBody
    ResultInfo<Boolean> save(Customer customer) {

        return new ResultInfo<>(customerService.saveCustomer(customer));
    }

    @SysLog("编辑客户信息操作")
    @RequestMapping("/edit/submit")
    @RequiresPermissions("customer:edit")
    public @ResponseBody
    Result edit(Customer customer) {
        Result result = new Result();
        if (customer.getIntro().getId() == customer.getId()){
            result.setStatus(-1);
            result.setMessage("介绍人异常,不可和本客户一致!");
            result.setCount(0);
            result.setData(0);
            return result;
        }

        Boolean aBoolean = customerService.editCustomer(customer);
        if (aBoolean){
            result.setStatus(200);
            result.setMessage("编辑成功@!");
            result.setCount(0);
            result.setData(0);
            return result;
        }else{
            result.setStatus(-1);
            result.setMessage("编辑失败@!");
            return result;
        }
    }

    @SysLog("删除客户信息操作")
    @RequestMapping("/del/submit")
    @RequiresPermissions("customer:del")
    public @ResponseBody
    Result del(Integer[] idArr) {
        Result result = new Result();
        Boolean flag = customerService.del(idArr);
        if (flag){
            result.setStatus(200);
            result.setMessage("删除成功@!");
            result.setCount(idArr.length);
            result.setData(idArr);
            return result;
        }
        result.setStatus(-1);
        result.setMessage("删除失败@!");
        result.setCount(idArr.length);
        result.setData(idArr);
        return result;
    }
    /**
     * 添加客户页面获取介绍人
     * @return
     */
    @RequestMapping(value = "/list/get", method = RequestMethod.POST)
    @ResponseBody
    public Result getAllList() {
        Result result = new Result();
        List<Customer> customers = customerService.getAll();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(customers.size());
        result.setData(customers);
        return result;
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//可以为空
    }


}
