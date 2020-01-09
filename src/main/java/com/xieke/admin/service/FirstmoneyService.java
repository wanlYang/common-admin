package com.xieke.admin.service;

import com.xieke.admin.entity.Firstmoney;

import java.util.List;

public interface FirstmoneyService {
    List<Firstmoney> selectAllFirstmoney();

    int insertFirstmoney(Firstmoney firstmoney);

    int updateFirstmoney(Firstmoney firstmoney);

    int deleteFirstmoney(int id);

    List<Firstmoney> getAll(Integer page, Integer limit, String name, String phone);

    Firstmoney getFirstMoneyInfo(String number);

    List<Firstmoney> getAll(Integer page, Integer limit, String name, String phone, String customer_id);

    Firstmoney getFirstMoneyInfoByCustId(String firstmoneyId);
}
