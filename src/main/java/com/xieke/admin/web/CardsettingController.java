package com.xieke.admin.web;

import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.Cardsetting;
import com.xieke.admin.service.CardsettingService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/cardsetting")
@Controller
public class CardsettingController {

    @Autowired
    private CardsettingService cardsettingService;

    @RequestMapping("/list")
    public String list(){
        return "/cardsetting/list";
    }

    @RequestMapping("/info")
    public String info(){
        return "/cardsetting/info";
    }

    @RequestMapping("/change")
    public String change(){
        return "/cardsetting/change";
    }



    @RequestMapping("/select")
    @ResponseBody
    public ResultInfo selectAllCardsetting(){
        List<Cardsetting> cardsettings = cardsettingService.selectAllCardsteting();
        int count = cardsettingService.countCardsetting();
        if(cardsettings!=null){
            return new ResultInfo<>(cardsettings,count);
        }else{
            return new ResultInfo<>("查询失败");
        }
    }
    @RequestMapping("/insert")
    @ResponseBody
    public ResultInfo insertFromsource(Cardsetting cardsetting,String like1,String like2,String like3,String like4,String like5,String like6,String like7) {
        String dayscan = "";
        if (StringUtils.isNotBlank(like1)){
            if (like1.equals("on")) {
                dayscan += "周一、";
            }
        }
        if (StringUtils.isNotBlank(like2)) {
            if (like2.equals("on")) {
                dayscan += "周二、";
            }
        }
        if (StringUtils.isNotBlank(like3)) {
            if (like3.equals("on")) {
                dayscan += "周三、";
            }
        }
        if (StringUtils.isNotBlank(like4)) {
            if (like4.equals("on")){
                dayscan+="周四、";
            }
        }
        if (StringUtils.isNotBlank(like5)) {
            if (like5.equals("on")){
                dayscan+="周五、";
            }
        }

        if (StringUtils.isNotBlank(like6)) {
            if (like6.equals("on")) {
                dayscan += "周六、";
            }
        }
        if (StringUtils.isNotBlank(like7)) {
            if (like7.equals("on")) {
                dayscan += "周天、";
            }
        }

        if (cardsetting.getEndTime()==null){
            cardsetting.setEndTime(new Date());
        }
        if (cardsetting.getStartTime()==null){
            cardsetting.setStartTime(new Date());
        }
        cardsetting.setDaysCan(dayscan);  //拼接可用时间
        Date createTime = new Date();
        cardsetting.setCreateTime(createTime);
        boolean x=cardsettingService.insertCardsetting(cardsetting);
        if(x){
            return new ResultInfo<>(x);
        }else{
            return new ResultInfo<>("添加失败");
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultInfo updateFromsorce(Cardsetting cardsetting,String like1,String like2,String like3,String like4,String like5,String like6,String like7){
        String dayscan = "";
        if (StringUtils.isNotBlank(like1)){
            if (like1.equals("on")) {
                dayscan += "周一、";
            }
        }
        if (StringUtils.isNotBlank(like2)) {
            if (like2.equals("on")) {
                dayscan += "周二、";
            }
        }
        if (StringUtils.isNotBlank(like3)) {
            if (like3.equals("on")) {
                dayscan += "周三、";
            }
        }
        if (StringUtils.isNotBlank(like4)) {
            if (like4.equals("on")){
                dayscan+="周四、";
            }
        }
        if (StringUtils.isNotBlank(like5)) {
            if (like5.equals("on")){
                dayscan+="周五、";
            }
        }

        if (StringUtils.isNotBlank(like6)) {
            if (like6.equals("on")) {
                dayscan += "周六、";
            }
        }
        if (StringUtils.isNotBlank(like7)) {
            if (like7.equals("on")) {
                dayscan += "周天、";
            }
        }

        if (cardsetting.getEndTime()==null){
            cardsetting.setEndTime(new Date());
        }
        if (cardsetting.getStartTime()==null){
            cardsetting.setStartTime(new Date());
        }
        cardsetting.setDaysCan(dayscan);  //拼接可用时间

        Date createTime = new Date();
        cardsetting.setCreateTime(createTime);
        boolean x=cardsettingService.updateCardsetting(cardsetting);
        if(x){
            return new ResultInfo<>(x);
        }else{
            return new ResultInfo<>("修改失败");
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResultInfo deletePaytype(Integer[] idArr){
        ResultInfo resu=new ResultInfo<>();
        for (int id:idArr ) {
            boolean x = cardsettingService.deleteCardsetting(id);
            if(x){
                resu.setData(x);
            }else{
                resu.setMsg("删除失败");
            }
        }
        return resu;
    }
    @RequestMapping("/validity")
    @ResponseBody
    public ResultInfo get(Integer id){
        Cardsetting validity = cardsettingService.get(id);
        if(validity != null){
            return new ResultInfo<>(validity);
        }else{
            return new ResultInfo<>("获取失败");
        }
    }



}
