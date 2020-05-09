package com.xieke.admin.web.pe;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
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
import com.xieke.admin.util.HttpUtil;
import com.xieke.admin.util.MessageUtil;
import com.xieke.admin.util.SortListUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

    //登录get
    @ResponseBody
    @RequestMapping(value = "/jssdk", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String get(String url_,@RequestParam(value = "callback", required = false) final String callback) {

        Result result = new Result();

        String access_token = redisTemplate.opsForValue().get("access_token");

        String jsapi_ticket = redisTemplate.opsForValue().get("ticket");
        if (access_token == null || "".equals(access_token)){
            String url="https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + "wx316b85a873e9e9d3" + "&secret=" +"7ce13309ef9afbdeafbf3cf22d2a0722";
            String results_assess = HttpUtil.sendGet(url);
            JSONObject object_assess=JSON.parseObject(results_assess);
            access_token = object_assess.getString("access_token");//这就是access_token
            redisTemplate.opsForValue().set("access_token",
                    access_token, 7200, TimeUnit.SECONDS);
        }

        if (jsapi_ticket == null || "".equals(jsapi_ticket)) {
            String get_jsapi_ticket = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + access_token + "&type=jsapi&offset_type=1";
            String results_ticket = HttpUtil.sendGet(get_jsapi_ticket);
            JSONObject object_ticket = JSON.parseObject(results_ticket);
            jsapi_ticket = object_ticket.getString("ticket");//这就是ticket
            redisTemplate.opsForValue().set("ticket",
                    jsapi_ticket, 7200, TimeUnit.SECONDS);
        }
        //获取signature
        String noncestr = UUID.randomUUID().toString();
        String timestamp = Long.toString(System.currentTimeMillis() / 1000);
        //String url_two="http://mp.weixin.qq.com";
        String str = "jsapi_ticket=" + jsapi_ticket +
                "&noncestr=" + noncestr +
                "&timestamp=" + timestamp +
                "&url=" + decodeURIComponent(url_);
        //sha1加密

        String signature = SHA1(str);
        System.out.println("noncestr=" + noncestr);
        System.out.println("timestamp=" + timestamp);
        System.out.println("signature=" + signature);

        Map<String,String> list = new HashMap<>();
        list.put("noncestr",noncestr);
        list.put("timestamp",timestamp);
        list.put("signature",signature);
        result.setData(list);
        result.setMessage("获取成功!");
        result.setStatus(200);
        return callback(callback, result);
    }
    public static String decodeURIComponent(String encodedURI) {

        char actualChar;



        StringBuffer buffer = new StringBuffer();



        int bytePattern, sumb = 0;



        for (int i = 0, more = -1; i < encodedURI.length(); i++) {

            actualChar = encodedURI.charAt(i);



            switch (actualChar) {

                case '%': {

                    actualChar = encodedURI.charAt(++i);

                    int hb = (Character.isDigit(actualChar) ? actualChar - '0'

                            : 10 + Character.toLowerCase(actualChar) - 'a') & 0xF;

                    actualChar = encodedURI.charAt(++i);

                    int lb = (Character.isDigit(actualChar) ? actualChar - '0'

                            : 10 + Character.toLowerCase(actualChar) - 'a') & 0xF;

                    bytePattern = (hb << 4) | lb;

                    break;

                }

                case '+': {

                    bytePattern = ' ';

                    break;

                }

                default: {

                    bytePattern = actualChar;

                }

            }



            if ((bytePattern & 0xc0) == 0x80) { // 10xxxxxx

                sumb = (sumb << 6) | (bytePattern & 0x3f);

                if (--more == 0)

                    buffer.append((char) sumb);

            } else if ((bytePattern & 0x80) == 0x00) { // 0xxxxxxx

                buffer.append((char) bytePattern);

            } else if ((bytePattern & 0xe0) == 0xc0) { // 110xxxxx

                sumb = bytePattern & 0x1f;

                more = 1;

            } else if ((bytePattern & 0xf0) == 0xe0) { // 1110xxxx

                sumb = bytePattern & 0x0f;

                more = 2;

            } else if ((bytePattern & 0xf8) == 0xf0) { // 11110xxx

                sumb = bytePattern & 0x07;

                more = 3;

            } else if ((bytePattern & 0xfc) == 0xf8) { // 111110xx

                sumb = bytePattern & 0x03;

                more = 4;

            } else { // 1111110x

                sumb = bytePattern & 0x01;

                more = 5;

            }

        }

        return buffer.toString();

    }
    public static String SHA1(String str) {
        try {
            MessageDigest digest = java.security.MessageDigest
                    .getInstance("SHA-1"); //如果是SHA加密只需要将"SHA-1"改成"SHA"即可
            digest.update(str.getBytes());
            byte messageDigest[] = digest.digest();
            // Create Hex String
            StringBuffer hexStr = new StringBuffer();
            // 字节数组转换为 十六进制 数
            for (int i = 0; i < messageDigest.length; i++) {
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexStr.append(0);
                }
                hexStr.append(shaHex);
            }
            return hexStr.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    //登录
    @ResponseBody
    @RequestMapping(value = "/login/submit", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String login(String phone, String password, @RequestParam(value = "callback", required = false) final String callback) {
        if (phone == null || phone.equals("") || password == null || password.equals("")) {
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
        } else if (code == null || code.equals("")) {
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
        } else {
            result.setStatus(-1);
            result.setMessage("获取失败！");
            result.setData(null);
        }
        return callback(callback, result);
    }

    //通过用户id查询所拥有的卡
    @ResponseBody
    @RequestMapping(value = "/contract/info", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String getCustomerContract(String id, @RequestParam(value = "callback", required = false) final String callback) {
        Result result = new Result();
        if (id == null || id.equals("")) {
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
        if (id == null || id.equals("")) {
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

        List<Order> orders = orderService.findByCoachIdForTime(privateContract.getCoach().getId(),thisTime);
        for (Order o:orders) {
            allOrdersTime.add(o.getStarttime());
            allOrdersTime.add(addDateMinut(o.getStarttime(),30));//如果课时是60分钟则需要加上本段代码,若为30分钟则可去掉
            //allOrdersTime.add(o.getEndtime());
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
                allTimes.addAll(qwe);
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
        return formatter.format(dateDate);
    }

    public static String getTimeShort() {
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
        Date currentTime = new Date();
        return formatter.format(currentTime);
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
        return timeDelta>0?(int)timeDelta:(int)Math.abs(timeDelta);
    }

    public static int getTimeDeltaNegative(Date date1,Date date2){
        long timeDelta=(date1.getTime()-date2.getTime())/1000;//单位是秒
        return (int)timeDelta;
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
        List<Order> allByCustomerId = orderService.findAllByCustomerIdForAddOrder(String.valueOf(contracts.getCustomer().getId()));
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

    /**
     * 会员手动点击下课!
     * @param id
     * @param callback
     * @return
     * @throws ParseException
     */
    @ResponseBody
    @RequestMapping(value = "/order/classover", method = RequestMethod.GET, produces = {"application/json;charset=UTF-8"})
    public String attendClass(String id, @RequestParam(value = "callback", required = false) final String callback) throws ParseException {
        Result result = new Result();
        Order order = orderService.findById(id);
        if (order == null){
            result.setStatus(-1);
            result.setMessage("参数异常！");
            result.setCount(0);
            return callback(callback, result);
        }
        if (order.getStatus() == 6){
            result.setStatus(-1);
            result.setMessage("已经发送下课请求！");
            result.setCount(0);
            return callback(callback, result);
        }

        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        SimpleDateFormat ds = new SimpleDateFormat("yyyy/MM/dd ");
        Date startTime = df.parse(ds.format(order.getThisday()) +order.getEndtime());
        int timeDelta = getTimeDeltaNegative(startTime, new Date());
        int minute = timeDelta/60;
        //下课后15分钟内可以点击下课!
        if (0>=minute&&minute>=-15){
            if (order.getStatus() == 8){
                Integer row = orderService.memberManual(id);
                result.setStatus(200);
                result.setMessage("下课成功！");
                result.setCount(row);
            }else{
                result.setStatus(-1);
                result.setMessage("下课失败！教练可能为登记入场信息!");
                result.setCount(0);
            }
            return callback(callback, result);
        }else if(minute<=-15){
            result.setStatus(-1);
            result.setMessage("下课失败!下课时间已经结束!请下课后15分钟内点击下课签课!");
            result.setCount(0);
            return callback(callback, result);
        }else{
            result.setStatus(-1);
            result.setMessage("下课失败!请下课后点击此按钮登记!");
            result.setCount(0);
            return callback(callback, result);
        }
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
        if (order.getStatus() == 5){
            result.setStatus(-1);
            result.setMessage("已取消！");
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
            redisTemplate.delete(order.getOrderKey());
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
