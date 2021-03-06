package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.Shopping;

import java.util.Date;
import java.util.List;

public interface ShoppingService {
    int insert(Shopping shopping);

    Shopping findById(String id);

    List<Shopping> findByContractId(String id);

    List<Shopping> findByCustomerId(String id);

    int delShoppById(String id);

    List<Shopping> findByCoachId(int id, Date thisTime);
}
