package com.xieke.admin.mapper;

import com.xieke.admin.entity.Integral;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface IntegralMapper {
    List<Integral> selectAllIntegral();

    int insertIntegral(Integral integral);

    int updateIntegral(Integral integral);

    int deleteIntegral(int id);

    Integral findByClubCardNum(String menmbercardNumber);

    Integer deleteIntegralByClubCardNum(String clubCardNum);
}
