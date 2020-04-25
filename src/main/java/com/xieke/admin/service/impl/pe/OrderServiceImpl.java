package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.Order;
import com.xieke.admin.mapper.pe.OrderMapper;
import com.xieke.admin.service.pe.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
    public List<Order> findByContractId(String id) {
        return orderMapper.findByContractId(id);
    }

    @Override
    public List<Order> findAllByCustomerId(String id) {
        return orderMapper.findAllByCustomerId(id);
    }

    @Override
    public List<Order> findByCoachId(int id, Date thisTime) {
        return orderMapper.findByCoachId(id,thisTime);
    }

    @Override
    public List<Order> findCompletedByCoachId(int id) {


        return orderMapper.findCompletedByCoachId(id);
    }

    @Override
    public List<Order> findReservedByCoachId(int id) {


        return orderMapper.findReservedByCoachId(id);
    }

    @Override
    public Order findByOrderKey(String key) {


        return orderMapper.findByOrderKey(key);
    }

    @Override
    public Integer updateOrderStatus(String key, int i) {

        return orderMapper.updateOrderStatus(key,i);
    }

    @Override
    public Order findById(String id) {


        return orderMapper.findById(id);
    }

    @Override
    public Integer cancel(String id) {


        return orderMapper.cancel(id);
    }

    @Override
    public Integer memberManual(String id) {


        return orderMapper.memberManual(id);
    }

    @Override
    public Integer coachRegister(String id) {
        return orderMapper.coachRegister(id);
    }
}
