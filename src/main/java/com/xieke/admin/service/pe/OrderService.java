package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.Order;

import java.util.Date;
import java.util.List;

public interface OrderService {
    int insertOrder(Order order);

    List<Order> findByContractId(String id);

    List<Order> findAllByCustomerId(String id);

    List<Order> findByCoachId(int id, Date thisTime);

    List<Order> findCompletedByCoachId(int id);

    List<Order> findReservedByCoachId(int id);
}
