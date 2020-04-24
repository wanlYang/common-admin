package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface OrderMapper {
    int insertOrder(Order order);

    List<Order> findByContractId(String id);

    List<Order> findAllByCustomerId(String id);

    List<Order> findByCoachId(@Param("id") int id, @Param("thisTime") Date thisTime);

    List<Order> findCompletedByCoachId(int id);

    List<Order> findReservedByCoachId(int id);

    Order findByOrderKey(String key);

    Integer updateOrderStatus(@Param("key") String key, @Param("i") int i);

    Order findById(String id);

    Integer cancel(String id);

    Integer memberManual(String id);
}
