package com.xieke.admin.service;

import com.xieke.admin.entity.Paytype;

import java.util.List;

public interface PaytypeService {
    List<Paytype> selectAllPaytype(int limit,int page);

    boolean insertPaytype(Paytype paytype);

    boolean deletePaytype(int id);

    boolean updatePaytype(Paytype paytype);

    int countPaytype();

    List<Paytype> selectAllPaytype();

    Paytype findById(Integer paytypeId);
}
