package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Member;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberMapper {


    List<Member> list(@Param("start") int start, @Param("limit") Integer limit, @Param("status") Integer status, @Param("startTime") Integer startTime, @Param("endTime") Integer endTime);

    Integer count(@Param("status") Integer status, @Param("startTime") String startTime, @Param("endTime") String endTime);
}
