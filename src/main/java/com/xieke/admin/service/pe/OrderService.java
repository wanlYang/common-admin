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

    Order findByOrderKey(String key);

    Integer updateOrderStatus(String key, int i);

    Order findById(String id);

    Integer cancel(String id);

    Integer memberManual(String id);

    Integer coachRegister(String id);

    List<Order> findAll(Integer page, Integer limit, String name, String phone);

    int count(String name, String phone);

    List<Order> findAllByCustomerIdForAddOrder(String id);

    List<Order> findByCoachIdForTime(int id, Date thisTime);

    Integer signing(String id);
}
