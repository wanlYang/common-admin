package com.xieke.admin.web.pe;

import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.Course;
import com.xieke.admin.entity.pe.Order;
import com.xieke.admin.entity.pe.PrivateContract;
import com.xieke.admin.service.pe.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 订单管理
 */
@RequestMapping("/order/booking")
@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;


    @RequestMapping("/list")
    public String getOrderList(){

        return "/pe/order_list";

    }

    @RequestMapping("/list/data")
    @ResponseBody
    public Result selectAll(Integer page, Integer limit,String name,String phone){
        Result result = new Result();
        List<Order> orders = orderService.findAll(page,limit,name,phone);
        int count = orderService.count(name,phone);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(count);
        result.setData(orders);
        return result;
    }

}
