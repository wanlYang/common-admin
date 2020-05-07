package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.Member;

import java.util.Date;
import java.util.List;

public interface MemberService {


    List<Member> list(Integer page, Integer limit, Integer status, Integer startTime, Integer endTime);

    Integer count(Integer status, String startTime, String endTime);
}
