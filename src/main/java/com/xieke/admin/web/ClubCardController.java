package com.xieke.admin.web;

import com.xieke.admin.annotation.SysLog;
import com.xieke.admin.entity.ClubCardPaytype;
import com.xieke.admin.entity.Clubcard;
import com.xieke.admin.entity.Integral;
import com.xieke.admin.entity.Result;
import com.xieke.admin.mapper.ClubCardMapper;
import com.xieke.admin.service.ClubCardPaytypeService;
import com.xieke.admin.service.ClubCardService;
import com.xieke.admin.service.IntegralService;
import com.xieke.admin.service.PaytypeService;
import com.xieke.admin.util.jiemi;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/clubcard")
public class ClubCardController extends BaseController{

    @Autowired
    private ClubCardService clubCardService;

    @Autowired
    private ClubCardPaytypeService clubCardPaytypeService;

    @Autowired
    private IntegralService integralService;

    @Autowired
    private ClubCardMapper clubCardMapper;

    @RequestMapping("/*")
    public void toHtml(){

    }
    /**
     * 获取客户会员卡信息列表
     * @return
     */
    @RequestMapping("/listData")
    @RequiresPermissions("clubcard:view")
    public @ResponseBody
    Result listData(Integer page, Integer limit,String name,String phone) {
        List<Clubcard> clubcards = clubCardService.getAllClubCard(page,limit,name,phone);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(clubCardMapper.countByParam(name,phone));
        result.setData(clubcards);
        return result;
    }

    @RequestMapping("/paytypes")
    public @ResponseBody
    Result getPayTypeS(String id) {
        List<ClubCardPaytype> clubCardPaytypes = clubCardPaytypeService.findByClubCardId(Integer.parseInt(id));
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(clubCardPaytypes.size());
        result.setData(clubCardPaytypes);
        return result;
    }

    /**
     * 添加会员卡
     * @return
     */
    @RequestMapping("/add/submit")
    @SysLog("添加会员卡信息")
    @RequiresPermissions("clubcard:add")
    public @ResponseBody
    Result add(Clubcard clubcard, @RequestParam("paytypeIds[]")Integer[] paytypeIds, @RequestParam("paytypeMonies[]")Double[] paytypeMonies, Integer integral,String firstmoneyId) {
        return clubCardService.createClubCard(clubcard,paytypeIds,paytypeMonies,integral,firstmoneyId);
    }

    @RequestMapping("/edit/submit")
    @SysLog("编辑会员卡信息")
    @RequiresPermissions("clubcard:edit")
    public @ResponseBody
    Result edit(Clubcard clubcard) {
        return clubCardService.updateClubCard(clubcard);
    }

    @RequestMapping("/del/submit")
    @SysLog("删除会员卡信息")
    @RequiresPermissions("clubcard:del")
    public @ResponseBody
    Result del(String id) {
        return clubCardService.delClubCard(id);
    }

    @RequestMapping("/printview/page")
    @SysLog("打印会员卡信息")
    @RequiresPermissions("clubcard:printview")
    public ModelAndView printview(ModelAndView modelAndView,String clubcardNum) throws Exception {
        //String s = jiemi.aesDecrypt(clubcardNum);
        modelAndView.setViewName("/clubcard/contract/index");
        Clubcard clubcard = clubCardService.getClubCardInfo(clubcardNum);
        if (clubcard == null){
            modelAndView.addObject("message","数据异常!");
            modelAndView.setViewName("/error/error");
            return modelAndView;
        }
        List<ClubCardPaytype> clubCardPaytypes = clubCardPaytypeService.findByClubCardId(clubcard.getId());
        Integral integral = integralService.getByClubCardNum(clubcard.getMenmbercardNumber());
        modelAndView.addObject("clubCardIntegral",integral);
        modelAndView.addObject("clubCardInfo",clubcard);
        modelAndView.addObject("clubCardPayTypeInfo",clubCardPaytypes);
        return modelAndView;
    }

    /**
     * 会员卡刷卡管理
     * @return
     */
    @SysLog("刷卡")
    @RequestMapping("/check")
    public @ResponseBody
    Result check(String icCardIn) {
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("成功@!");
        result.setCount(0);
        result.setData(0);
        return result;
    }

    @SysLog("会员卡审核")
    @RequestMapping("/examine/page")
    @RequiresPermissions("clubcard:examine")
    public ModelAndView  examinePage(ModelAndView modelAndView,String clubcardNum){
        modelAndView.setViewName("/clubcard/examine");
        Clubcard clubcard = clubCardService.getClubCardInfo(clubcardNum);
        if (clubcard == null){
            modelAndView.addObject("message","数据异常!");
            modelAndView.setViewName("/error/error");
            return modelAndView;
        }
        List<ClubCardPaytype> clubCardPaytypes = clubCardPaytypeService.findByClubCardId(clubcard.getId());
        Integral integral = integralService.getByClubCardNum(clubcard.getMenmbercardNumber());
        modelAndView.addObject("clubCardIntegral",integral);
        modelAndView.addObject("clubCardInfo",clubcard);
        modelAndView.addObject("clubCardPayTypeInfo",clubCardPaytypes);
        return modelAndView;
    }

    /**
     * 审核
     * @param id
     * @return
     */
    @SysLog("审核")
    @RequestMapping("/examine")
    public @ResponseBody
    Result examine(String id) {
        Integer row = clubCardService.examine(id);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("审核成功@!");
        result.setCount(row);
        result.setData(row);
        return result;
    }

    /**
     * 延期
     * @param id
     * @return
     */
    @SysLog("延期")
    @RequestMapping("/delay/submit")
    public @ResponseBody
    Result delay(String id, Date endTime) {
        Integer row = clubCardService.delay(id,endTime);
        if (row > 0){
            Result result = new Result();
            result.setStatus(200);
            result.setMessage("延期成功@!");
            result.setCount(row);
            result.setData(row);
            return result;
        }
        Result result = new Result();
        result.setStatus(-1);
        result.setMessage("延期失败@!");
        result.setCount(row);
        result.setData(row);
        return result;
    }
}
