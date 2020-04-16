package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.Order;
import com.xieke.admin.mapper.pe.OrderMapper;
import com.xieke.admin.service.pe.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int insertOrder(Order order) {
        return orderMapper.insertOrder(order);
    }

    @Override
    public Order findByContractId(String id) {
        return orderMapper.findByContractId(id);
    }

    @Override
    public List<Order> findAllByCustomerId(String id) {
        return orderMapper.findAllByCustomerId(id);
    }

    @Override
    public List<Order> findByCoachId(int id) {
        return orderMapper.findByCoachId(id);
    }
}
