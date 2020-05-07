package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.Member;
import com.xieke.admin.mapper.pe.MemberMapper;
import com.xieke.admin.service.pe.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;


    @Override
    public List<Member> list(Integer page, Integer limit, Integer status, Integer startTime, Integer endTime) {



        return memberMapper.list((page - 1) * limit, limit,status,startTime,endTime);
    }

    @Override
    public Integer count(Integer status, String startTime, String endTime) {


        return memberMapper.count(status,startTime,endTime);
    }
}
