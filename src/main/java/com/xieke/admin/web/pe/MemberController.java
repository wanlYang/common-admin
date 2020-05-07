package com.xieke.admin.web.pe;

import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.Member;
import com.xieke.admin.service.pe.MemberService;
import com.xieke.admin.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping("/list")
    public String add(){
        return "/member/list";
    }

    @RequestMapping("/list/data")
    @ResponseBody
    public Result selectAll(Integer page, Integer limit, Integer status, String startTime,String endTime){

        if (status == null || status == 0){
            status = 1;
        }
        Result result = new Result();
        List<Member> memberList = null;
        Integer count = 0;
        if (StringUtils.isNotBlank(startTime)&& org.apache.commons.lang3.StringUtils.isNotBlank(endTime)){
            memberList = memberService.list(page,limit,status,Integer.valueOf(startTime),Integer.valueOf(endTime));
            count = memberService.count( status, startTime, endTime);
            result.setStatus(200);
            result.setMessage("获取成功!");
            result.setCount(count);
            result.setData(memberList);
            return result;
        }
        memberList = memberService.list(page,limit,status,null,null);
        count = memberService.count( status, null, null);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(count);
        result.setData(memberList);
        return result;
    }

}
