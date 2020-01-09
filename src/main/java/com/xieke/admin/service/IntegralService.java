package com.xieke.admin.service;

import com.xieke.admin.entity.Integral;

import java.util.List;

public interface IntegralService {
    List<Integral> selectAllIntegral();

    int insertIntegral(Integral integral);

    int updateIntegral(Integral integral);

    int deleteIntegral(int id);

    Integral getByClubCardNum(String menmbercardNumber);

    Integer deleteIntegralByClubCardNum(String clubCardNum);

}
