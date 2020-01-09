package com.xieke.admin.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.aliyuncs.exceptions.ClientException;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.*;
import com.xieke.admin.service.AcuserService;
import com.xieke.admin.service.CouponsService;
import com.xieke.admin.util.CookieUtil;
import com.xieke.admin.util.MessageUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/activity/management")
public class AcuserController {

    @Resource
    protected AcuserService acuserService;


    @Autowired
    private CouponsService couponsService;

    @RequestMapping("/userlist")
    public String list(){
        return "/activity/list";
    }
    @RequestMapping("/add")
    public String add(){
        return "/activity/add";
    }
    @RequestMapping("/inside")
    public String inside(){
        return "/activity/inside";
    }

    @RequestMapping("/inside/select")
    public ModelAndView insideSelect(ModelAndView modelAndView){
        List<Acuser> acusers = acuserService.selectWinnerAcuser();
        modelAndView.addObject("acusers",acusers);
        modelAndView.setViewName("/activity/inside_select");
        return modelAndView;
    }
    @RequestMapping("/examine")
    public String examine(){
        return "/activity/examine";
    }

    @RequestMapping("/login")
    public String login(HttpSession session){
        Acuser acuser = (Acuser) session.getAttribute("user");
        if (acuser != null){
            return "redirect:/activity/management/index";
        }
        return "/activity/login/index";
    }

    @RequestMapping("/index")
    public ModelAndView index(ModelAndView modelAndView,HttpSession session){
        Acuser acuser = (Acuser) session.getAttribute("user");
        if (acuser == null){
            modelAndView.addObject("message","重新登录!");
            modelAndView.addObject("ifHref",true);
            modelAndView.setViewName("/error/error");
            return modelAndView;
        }
        couponsService.insert(acuser.getId());
        List<UserCou> userCous = couponsService.selectUserCouByUserId(String.valueOf(acuser.getId()));
        modelAndView.addObject("userCous",userCous);
        modelAndView.setViewName("/activity/coupons/index");
        return modelAndView;
    }


    /*@Resource
    protected CouponsService couponsService;

    @RequestMapping("/Coupons")
    @ResponseBody
    public ResultInfo selectAllCoupons(){

        List<Acuser> coupons = couponsService.selectAllCoupons();
        if(coupons!=null){
            return new ResultInfo<>(coupons);
        }else{
            return new ResultInfo<>("查询失败");
        }
    }*/

    /**
     * 后台获取全部list
     * @param limit
     * @param page
     * @param name
     * @param phone
     * @return
     */
    @RequestMapping("/userlist/data")
    @ResponseBody
    public Result selectAllAcuser(int limit, int page, String name, String phone){
        Result result = new Result();
        List<Acuser> acusers = acuserService.selectAllAcuser(limit,page,name,phone);
        int count = acuserService.countAcuser(name,phone);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(count);
        result.setData(acusers);
        return result;
    }

    /**
     * 获取当天用户以及未中奖用户
     * @param response
     * @param limit
     * @param page
     * @param name
     * @param phone
     * @param callback
     * @return
     */
    @RequestMapping(value="/userlist/data/jsonp", method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String selectAllAcuserByJsonp(HttpServletResponse response,int limit, int page, String name, String phone, @RequestParam(value = "callback",required = false) final String callback){
        Result result = new Result();
        List<Acuser> acusers = acuserService.selectUsableAcuser(limit,page,name,phone);
        int count = acuserService.countUsableAcuser(name,phone);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(count);
        result.setData(acusers);
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Method", "*");
        response.setCharacterEncoding("utf-8");
        response.addHeader("Access-Control-Allow-Headers","Content-Type");
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect);
    }

    /**
     * 获取设定中奖用户
     * @param
     * @return
     */
    @RequestMapping(value = "/get/inside", method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String getWinner(HttpServletResponse response,@RequestParam(value = "callback",required = false) final String callback){
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Method", "*");
        response.setCharacterEncoding("utf-8");
        response.addHeader("Access-Control-Allow-Headers","Content-Type");
        Result result = new Result();
        List<Acuser> acusers = acuserService.selectWinnerAcuser();
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(acusers.size());
        result.setData(acusers);
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect);
    }

    /**
     * 添加中奖人
     * @param gift
     * @return
     */
    @RequestMapping(value = "/add/gift",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String addGift(Gift gift,HttpServletResponse response,@RequestParam(value = "callback",required = false) final String callback){
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Method", "*");
        response.setCharacterEncoding("utf-8");
        response.addHeader("Access-Control-Allow-Headers","Content-Type");
        Result result = new Result();
        Integer b = acuserService.insertGift(gift);
        result.setStatus(200);
        result.setMessage("添加成功!");
        result.setCount(1);
        result.setData(b);
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect);
    }

    /**
     * 录入设定用户
     * @param acuser
     * @return
     */
    @RequestMapping("/inside/submit")
    @ResponseBody
    public Result insideSubmit(Acuser acuser){
        Result result = new Result();
        Integer b = acuserService.insertWinnerAcuser(acuser);
        result.setStatus(200);
        result.setMessage("添加成功!");
        result.setCount(1);
        result.setData(b);
        return result;
    }

    /**
     * 删除设定中奖用户
     * @param
     * @return
     */
    @RequestMapping(value = "/del/inside",method = RequestMethod.GET,produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public String delWinner(HttpServletResponse response,@RequestParam(value = "callback",required = false) final String callback){
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Method", "*");
        response.setCharacterEncoding("utf-8");
        response.addHeader("Access-Control-Allow-Headers","Content-Type");
        Result result = new Result();
        Integer row = acuserService.delWinnerAcuser();
        result.setStatus(200);
        result.setMessage("删除成功!");
        result.setCount(row);
        result.setData(row);
        if (StringUtils.isNotBlank(callback)) {
            return callback + "(" + JSON.toJSONString(result, SerializerFeature.DisableCircularReferenceDetect) + ");";
        }
        return JSON.toJSONString(result,SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping("/get/user/cou")
    @ResponseBody
    public Result getUserCou(String userId){
        Result result = new Result();
        List<UserCou> userCous = couponsService.selectUserCouByUserId(userId);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(userCous.size());
        result.setData(userCous);
        return result;
    }

    @RequestMapping("/examine/submit")
    @ResponseBody
    public Result examineSubmit(String id,String coupons) throws ClientException {
        return couponsService.examine(id,coupons);
    }
    @RequestMapping("/examine/reverse/submit")
    @ResponseBody
    public Result examineReverseSubmit(String userId){
        return couponsService.reverse(userId);
    }



    @RequestMapping("/get/coupon")
    @ResponseBody
    public Result getCoupon(String userId,String couponId){
        Result result = new Result();
        UserCou coupons = couponsService.findUserAndCou(userId,couponId);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(1);
        result.setData(coupons);
        return result;
    }

    @RequestMapping("/login/submit")
    @ResponseBody
    public Result loginSubmit(Acuser acuser, String code, HttpSession session, HttpServletResponse response, HttpServletRequest request){
        Result result = new Result();
        if (session.getAttribute("code") == null ||  session.getAttribute("code") == ""){
            result.setStatus(-1);
            result.setMessage("验证码异常!");
            result.setCount(0);
            result.setData(null);
            return result;
        }
        
        if (code == null ||  code == ""){
            result.setStatus(-1);
            result.setMessage("验证码异常!");
            result.setCount(0);
            result.setData(null);
            return result;
        }

        Integer code_ = (Integer) session.getAttribute("code");

        if (!String.valueOf(code_).equals(code)){
            result.setStatus(-1);
            result.setMessage("验证码错误!");
            result.setCount(0);
            result.setData(null);

            return result;
        }
        Acuser acuser_ = acuserService.findByPhone(acuser.getPhone());
        if (acuser_ == null){
            acuserService.insertAcuser(acuser);
            Acuser acusers = acuserService.findByPhone(acuser.getPhone());
            session.setAttribute("user",acusers);
            result.setStatus(200);
            result.setMessage("登陆成功!");
            result.setCount(1);
            result.setData(acuser_);
            session.removeAttribute("code");
            CookieUtil.addCookie(response,"loginCookiePhone",acuser.getPhone(),60*60*24*7,true);
            return result;
        }
        session.setAttribute("user",acuser_);
        CookieUtil.addCookie(response,"loginCookiePhone",acuser.getPhone(),60*60*24*7,true);
        session.setMaxInactiveInterval(-1);
        result.setStatus(200);
        result.setMessage("登陆成功!");
        result.setCount(1);
        result.setData(acuser_);
        session.removeAttribute("code");
        return result;
    }

    /**
     * 后台录入用户
     * @param acuser
     * @return
     */
    @RequestMapping("/add/submit")
    @ResponseBody
    public Result addSubmit(Acuser acuser){
        Result result = new Result();
        Integer b = acuserService.insertAcuser(acuser);
        result.setStatus(200);
        result.setMessage("添加成功!");
        result.setCount(1);
        result.setData(b);
        return result;
    }






    //获取验证码
    @RequestMapping("/code")
    @ResponseBody
    public ResultInfo Code(String phone,HttpSession session){
        int newcode = MessageUtil.getNewcode();
        session.setAttribute("code",newcode);
        System.out.println("get" + session.getAttribute("code"));
        try {
            MessageUtil.sendSms(phone,newcode);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return new ResultInfo<>("验证码已发送");
    }

}
