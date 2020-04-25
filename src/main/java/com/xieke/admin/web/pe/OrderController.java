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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    /**
     * 管理员签课
     * @return
     */
    @RequestMapping("/signing")
    @ResponseBody
    public Result signing(String id) throws ParseException {
        Result result = new Result();
        Order order = orderService.findById(id);
        if (order == null) {
            result.setStatus(-1);
            result.setMessage("参数异常!");
            return result;
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        SimpleDateFormat ds = new SimpleDateFormat("yyyy/MM/dd ");
        Date startTime = df.parse(ds.format(order.getThisday()) + order.getEndtime());
        int timeDelta = LoginController.getTimeDeltaNegative(startTime, new Date());
        int minute = (timeDelta % 3600) / 60;
        //下课后可以点击签课!
        if (0 >= minute) {
            Integer row = orderService.signing(id);
            result.setStatus(200);
            result.setMessage("签课成功！");
            result.setCount(row);
            return result;
        } else {
            String totalTimeStr = timeDelta/(3600*24) + "天" + timeDelta/3600 + "时" + (timeDelta%3600)/60 + "分" + (timeDelta%3600)%60 + "秒";
            result.setStatus(-1);
            result.setMessage("签课失败!距离下课还有"+totalTimeStr);
            result.setCount(0);
            return result;
        }
    }

}
