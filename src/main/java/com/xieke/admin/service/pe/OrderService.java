package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.Order;

import java.util.List;

public interface OrderService {
    int insertOrder(Order order);

    Order findByContractId(String id);

    List<Order> findAllByCustomerId(String id);

    List<Order> findByCoachId(int id);
}
