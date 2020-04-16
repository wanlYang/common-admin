package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    int insertOrder(Order order);

    Order findByContractId(String id);

    List<Order> findAllByCustomerId(String id);

    List<Order> findByCoachId(int id);
}
