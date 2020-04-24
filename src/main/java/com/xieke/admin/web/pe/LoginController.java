package com.xieke.admin.web.pe;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.aliyuncs.exceptions.ClientException;
import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.*;
import com.xieke.admin.service.CustomerService;
import com.xieke.admin.service.pe.ContractService;
import com.xieke.admin.service.pe.OfficeService;
import com.xieke.admin.service.pe.OrderService;
import com.xieke.admin.service.pe.ShoppingService;
import com.xieke.admin.util.MessageUtil;
import com.xieke.admin.util.SortListUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

import static com.xieke.admin.util.TimeSplit.getIntervalTimeList;
import static com.xieke.admin.web.pe.OfficeController.belongCalendar;

/**
 * 会员端控制器
 */
@Controller
@RequestMapping("/public")
public class LoginController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private ContractService contractService;
    @Autowired
    private OfficeService officeService;
    @Autowired
    private ShoppingService shoppingService;
    @Autowired
    private OrderService orderService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    //登录
    @ResponseBody
    @RequestMapping(value = "/login/submit", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String login(String phone, String password, @RequestParam(value = "callback", required = false) final String callback) {
        if (phone == null || phone == "" || password == null || password == "") {
            Result result = new Result();
            result.setMessage("参数异常！");
            result.setStatus(-1);
            return callback(callback, result);
        }
        System.out.println(phone + "+" + password);
        Result login = customerService.login(phone, password);
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(login, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(login, SerializerFeature.DisableCircularReferenceDetect);
    }

    //忘记密码
    @ResponseBody
    @RequestMapping(value = "/forget", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String forget(HttpSession session, String phone, String code, String password, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        Customer customer = customerService.getCustomerByPhone(phone);
        if (customer == null) {
            result.setStatus(-4);
            result.setMessage("手机号不存在!");
            return callback(callback, result);
        }
        if (session.getAttribute("code") == null || session.getAttribute("code") == "") {
            result.setStatus(-1);
            result.setMessage("验证码异常!");
            return callback(callback, result);
        } else if (code == null || code == "") {
            result.setStatus(-2);
            result.setMessage("验证码异常!");
            return callback(callback, result);
        } else if (!String.valueOf(session.getAttribute("code")).equals(code)) {
            result.setStatus(-3);
            result.setMessage("验证码错误!");
            return callback(callback, result);
        }

        customer.setPassword(password);
        Integer row = customerService.updatePassword(customer);
        if (row > 0) {
            result.setStatus(200);
            result.setMessage("密码修改成功!");
            return callback(callback, result);
        }
        return callback(callback, result);
    }

    //获取用户信息
    @ResponseBody
    @RequestMapping(value = "/customer/info", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String getCustomerInfo(String phone, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        Customer customer = customerService.getCustomerByPhone(phone);
        if (customer != null) {
            result.setStatus(200);
            result.setMessage("获取成功！");
            result.setData(customer);
            return callback(callback, result);
        } else {
            result.setStatus(-1);
            result.setMessage("获取失败！");
            result.setData(customer);
            return callback(callback, result);
        }
    }

    //通过用户id查询所拥有的卡
    @ResponseBody
    @RequestMapping(value = "/contract/info", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String getCustomerContract(String id, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        if (id == null || id == "") {
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        List<PrivateContract> privateContracts = contractService.getContractByCustomerId(id);
        result.setMessage("获取成功");
        result.setStatus(200);
        result.setData(privateContracts);
        return callback(callback, result);
    }

    //点击卡片时的接口
    @ResponseBody
    @RequestMapping(value = "/contract/info/one", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String getContract(String id, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        if (id == null || id == "") {
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        PrivateContract privateContract = contractService.findById(id);
        result.setMessage("获取成功");
        result.setStatus(200);
        result.setData(privateContract);
        return callback(callback, result);
    }

    /**
     * 给时间加上几个小时
     * @param time 当前时间 格式：yyyy-MM-dd HH:mm:ss
     * @param X 需要加的时间
     * @return
     */
    public static String addDateMinut(String time, int X){
        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
        Date date = null;
        try {
            date = format.parse(time);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if (date == null)
            return "";
        System.out.println("front:" + format.format(date)); //显示输入的日期
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MINUTE, X);// 24小时制
        date = cal.getTime();
        System.out.println("after:" + format.format(date));  //显示更新后的日期
        cal = null;
        return format.format(date);

    }
    //查找当前时间(thisTime)有空闲的教练
    @ResponseBody
    @RequestMapping(value = "/time", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String dateTime(Date thisTime, String id, @RequestParam(value = "callback", required = false) final String callback) throws ParseException {
        boolean x;
        Map<String, Integer> map = new HashMap<>();
        Result result = new Result();
        if (!StringUtils.isNotBlank(id)) {
            result.setData(null);
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        List<Alltimes> alltimesList = new ArrayList<>();
        List<String> allTimes = new ArrayList<>();
        List<String> allOrdersTime = new ArrayList<>();
        List<String> allShoppingTime = new ArrayList<>();
        SimpleDateFormat ist_ = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat ist = new SimpleDateFormat("HH:mm:ss");
        PrivateContract privateContract = contractService.findById(id);
        List<Shopping> shopping = shoppingService.findByContractId(id);
        for (Shopping shopping_ : shopping) {
            if (shopping_.isValid()) {
                result.setStatus(-1);
                result.setMessage("购物车有未完成的订单！");
                result.setData(null);
                result.setCount(0);
                return callback(callback, result);
            }
        }
        List<Shopping> shoppings = shoppingService.findByCoachId(privateContract.getCoach().getId(),thisTime);
        for (Shopping s: shoppings) {
            allShoppingTime.add(s.getStarttime());
            allShoppingTime.add(addDateMinut(s.getStarttime(),30));
        }

        List<Order> orders = orderService.findByCoachId(privateContract.getCoach().getId(),thisTime);
        for (Order o:orders) {
            allOrdersTime.add(o.getStarttime());
            allOrdersTime.add(addDateMinut(o.getStarttime(),30));//如果课时是60分钟则需要加上本段代码,若为30分钟则可去掉
            //allOrdersTime.add(o.getEndtime());
        }

        if (privateContract == null) {
            result.setData(null);
            result.setStatus(-1);
            result.setMessage("参数异常！");
            return callback(callback, result);
        }
        if (privateContract.getIsFreeClass() == 0) {
            Office office = officeService.getOfficeByCoachId(privateContract.getCoach().getId());
            //教练未排班表导致排班 office 为空 报错
            if (office == null){
                result.setData(null);
                result.setStatus(-1);
                result.setMessage("出现异常!教练可能未排班!");
                return callback(callback, result);
            }
            x = belongCalendar(thisTime, office.getStarttime(), office.getEndtime());
            if (x) {
                //当前教练上班时间按每半小时拆分
                List<String> qwe = getIntervalTimeList(ist.format(office.getOfficetime().getStarttime()), ist.format(office.getOfficetime().getEndtime()), 30);
                for (String i : qwe) {
                    allTimes.add(i);
                }
            }
        }
        for (String str : allTimes) {
            int i = 1;
            if (map.get(str) != null) {
                i = map.get(str) + 1;
            }
            map.put(str, i);
        }
        for (String s : map.keySet()) {    //遍历Key值
            if (allOrdersTime.contains(s) || allShoppingTime.contains(s)){
                String st = ist_.format(thisTime);
                Alltimes alltimes = new Alltimes();
                alltimes.setChoiceDate(st);
                alltimes.setCount(map.get(s));
                alltimes.setTimes(s);
                alltimes.setCssClass("notdo");
                alltimesList.add(alltimes);
            }else{
                String st = ist_.format(thisTime);
                Alltimes alltimes = new Alltimes();
                alltimes.setChoiceDate(st);
                alltimes.setCount(map.get(s));
                alltimes.setTimes(s);
                alltimes.setCssClass("cando");
                alltimesList.add(alltimes);
            }
        }
        SortListUtil.sort(alltimesList, "times", SortListUtil.ASC); //通过times字段，将alltimesList进行排序
        result.setData(alltimesList);
        result.setStatus(200);
        result.setMessage("获取成功！");
        return callback(callback, result);

    }
    public static String dateToStrLong(Date dateDate) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(dateDate);
        return dateString;
    }

    public static String getTimeShort() {
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
        Date currentTime = new Date();
        String dateString = formatter.format(currentTime);
        return dateString;
    }

    //添加购物车
    @ResponseBody
    @RequestMapping(value = "/shopping", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String addShopp(String id, Date thisday, String starttime, String endtime, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        String now = dateToStrLong(new Date());
        String thisday_ = dateToStrLong(thisday);
        if(thisday_.compareTo(now) < 0){
            result.setStatus(-1);
            result.setMessage("请重新选择时间！");
            result.setData(null);
            result.setCount(0);
            return callback(callback, result);
        }
        if(thisday_.compareTo(now) == 0){
            if (starttime.compareTo(getTimeShort()) < 0){
                result.setStatus(-1);
                result.setMessage("请重新选择时间！");
                result.setData(null);
                result.setCount(0);
                return callback(callback, result);
            }
        }

        PrivateContract contracts = contractService.findById(id);
        Customer customer = customerService.getCustomerByPhone(contracts.getCustomer().getPhone());
        List<Shopping> shoppings = shoppingService.findByCustomerId(String.valueOf(customer.getId()));
        for (Shopping shopping : shoppings) {
            if (shopping.isValid()) {
                result.setStatus(-1);
                result.setMessage("购物车有未完成的订单！");
                result.setData(null);
                result.setCount(0);
                return callback(callback, result);
            }
        }
        Shopping shopping = new Shopping();
        shopping.setNowtime(new Date(new Date().getTime() + 120000));  //当前时间延长两分钟添加
        shopping.setCoach(contracts.getCoach());
        shopping.setCustomer(contracts.getCustomer());
        shopping.setContract(contracts);
        shopping.setStarttime(starttime);
        shopping.setEndtime(endtime);
        shopping.setThisday(thisday);
        int row = shoppingService.insert(shopping);
        result.setStatus(200);
        result.setMessage("购物车添加成功！");
        result.setData(shopping);
        result.setCount(row);
        return callback(callback, result);
    }

    //删除购物车
    @ResponseBody
    @RequestMapping(value = "/shopp/del", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String delshopp(String id, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        int row = shoppingService.delShoppById(id);
        result.setStatus(200);
        result.setMessage("删除成功！");
        result.setCount(row);
        return callback(callback, result);

    }

    public static int getTimeDelta(Date date1,Date date2){
        long timeDelta=(date1.getTime()-date2.getTime())/1000;//单位是秒
        int secondsDelta=timeDelta>0?(int)timeDelta:(int)Math.abs(timeDelta);
        return secondsDelta;
    }
    //最终确认订单
    @ResponseBody
    @RequestMapping(value = "/shopp/submit", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String addOrder(String id, String shoppingId, @RequestParam(value = "callback", required = false) final String callback) throws ParseException {
        Result result = new Result();
        if (!StringUtils.isNotBlank(id)||!StringUtils.isNotBlank(shoppingId)){
            result.setStatus(-1);
            result.setMessage("ID参数为空!");
            return callback(callback, result);
        }
        PrivateContract contracts = contractService.findById(id);
        Shopping shopping = shoppingService.findById(shoppingId);
        if (contracts == null || shopping == null){
            result.setStatus(-1);
            result.setMessage("参数异常!或者购物车课程已经失效!");
            return callback(callback, result);
        }
        if (!shopping.isValid()) {
            result.setStatus(-1);
            result.setMessage("课程已失效，请重新选择！");
            return callback(callback, result);
        }
        Order order = new Order();
        order.setCoach(contracts.getCoach());
        order.setCustomer(contracts.getCustomer());
        order.setStarttime(shopping.getStarttime());
        order.setEndtime(shopping.getEndtime());
        order.setContract(contracts);
        order.setStatus(0);
        order.setThisday(shopping.getThisday());
        // 订单号
        String orderNo = UUID.randomUUID().toString().replaceAll("-", "");
        order.setOrderKey(String.format("order-%s", orderNo));
        List<Order> allByCustomerId = orderService.findAllByCustomerId(String.valueOf(contracts.getCustomer().getId()));
        if (allByCustomerId.size() >= 2){
            result.setStatus(-1);
            result.setMessage("最多可以约两节课！");
            return callback(callback, result);
        }
        int row = orderService.insertOrder(order);
        shoppingService.delShoppById(shoppingId);
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        SimpleDateFormat ds = new SimpleDateFormat("yyyy/MM/dd ");
        Date startTime = df.parse(ds.format(order.getThisday()) +order.getStarttime());
        int timeDelta = getTimeDelta(startTime, new Date());
        redisTemplate.opsForValue().set(String.format("order-%s", orderNo),
                orderNo, timeDelta, TimeUnit.SECONDS);
        result.setStatus(200);
        result.setMessage("预约成功！");
        result.setData(order);
        result.setCount(row);
        return callback(callback, result);

    }
    //取消订单
    @ResponseBody
    @RequestMapping(value = "/order/cancel", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String cancel(String id, @RequestParam(value = "callback", required = false) final String callback) throws ParseException {
        Result result = new Result();
        Order order = orderService.findById(id);
        if (order == null){
            result.setStatus(-1);
            result.setMessage("参数异常！");
            result.setCount(0);
            return callback(callback, result);
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        SimpleDateFormat ds = new SimpleDateFormat("yyyy/MM/dd ");
        Date startTime = df.parse(ds.format(order.getThisday()) +order.getStarttime());
        int timeDelta = getTimeDelta(startTime, new Date());
        int hour = timeDelta/3600;
        if (hour>6){
            Integer row = orderService.cancel(id);
            result.setStatus(200);
            result.setMessage("取消成功！");
            result.setCount(row);
            return callback(callback, result);
        }
        String totalTimeStr = timeDelta/3600 + "时" + (timeDelta%3600)/60 + "分" + (timeDelta%3600)%60 + "秒";
        result.setStatus(-1);
        result.setMessage("取消失败！距离开课时间还有:" + totalTimeStr +",提前6小时之前可以取消课程!");
        result.setCount(0);
        return callback(callback, result);

    }
    //获取当前购物车信息
    @ResponseBody
    @RequestMapping(value = "/shopp/get", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String getShopping(String id, String starttime, String endtime, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        List<Shopping> shopping = shoppingService.findByCustomerId(id);
        result.setStatus(200);
        result.setMessage("获取成功！");
        result.setData(shopping);
        result.setCount(1);
        return callback(callback, result);
    }

    //获取当前客户预约信息
    @ResponseBody
    @RequestMapping(value = "/order/get", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String getOrderList(String id, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        List<Order> orders = orderService.findAllByCustomerId(id);
        result.setStatus(200);
        result.setMessage("获取成功！");
        result.setData(orders);
        result.setCount(orders.size());
        return callback(callback, result);
    }
    //JSONP方法
    public String callback(String callback, Result result) {
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect);
    }

    //获取验证码
    @ResponseBody
    @RequestMapping(value = "/code", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String Code(String phone, HttpSession session, @RequestParam(value = "callback", required = false) final String callback) {
        int newcode = MessageUtil.getNewcode();
        Customer customer = customerService.getCustomerByPhone(phone);
        Result result = new Result();
        if (customer == null) {
            result.setStatus(-4);
            result.setMessage("手机号不存在!");
            return callback(callback, result);
        }
        session.setAttribute("code", newcode);
        System.out.println(newcode);
        try {
            MessageUtil.sendSms(phone, newcode);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        result.setMessage("发送成功！");
        result.setStatus(200);
        return callback(callback, result);
    }




}
