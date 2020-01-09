package com.xieke.admin.web;

import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.Paytype;
import com.xieke.admin.service.PaytypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/paytype")
public class PaytypeController {

    @Resource
    protected PaytypeService paytypeService;

    private Map<String,Object> map=new HashMap<String, Object>();

    @RequestMapping("/list")
    public String list(){
        return "/paytype/list";
    }

    @RequestMapping("/info")
    public String info(){
        return "/paytype/info";
    }

    @RequestMapping("/change")
    public String update(){
        return "/paytype/change";
    }


    @RequestMapping("/select")
    @ResponseBody
    public ResultInfo selectAllPaytype(int limit,int page){

        List<Paytype> payType = paytypeService.selectAllPaytype(limit,page);
        int count = paytypeService.countPaytype();
        if(payType!=null){
            return new ResultInfo<>(payType,count);
        }else{
            return new ResultInfo<>("查询失败");
      }
    }

    @RequestMapping("/select/all")
    @ResponseBody
    public ResultInfo select(){
        List<Paytype> payType = paytypeService.selectAllPaytype();
        int count = paytypeService.countPaytype();
        if(payType!=null){
            return new ResultInfo<>(payType,count);
        }else{
            return new ResultInfo<>("查询失败");
        }
    }

    @RequestMapping("/insert")
    @ResponseBody
    public ResultInfo insertPaytype(Paytype paytype){
        Date createTime = new Date();
        paytype.setCreateTime(createTime);
        boolean x=paytypeService.insertPaytype(paytype);
        if(x){
            return new ResultInfo<>(x);
        }else{
            return new ResultInfo<>(x);
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultInfo updatePaytype(Paytype paytype){
        Date createTime = new Date();
        paytype.setCreateTime(createTime);
        boolean x=paytypeService.updatePaytype(paytype);
        if(x){
            return new ResultInfo<>(x);
        }else{
            return new ResultInfo<>(x);
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ResultInfo deletePaytype(Integer[] idArr){
        for (int id:idArr ) {
            boolean x = paytypeService.deletePaytype(id);
            if(x){
                return new ResultInfo<>(x);
            }else{
                return new ResultInfo<>(x);
            }
        }
         return new ResultInfo<>(true);
    }

}
