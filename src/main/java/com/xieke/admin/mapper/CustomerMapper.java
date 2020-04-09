package com.xieke.admin.mapper;

import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Fromsource;
import com.xieke.admin.entity.UserQueryParam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CustomerMapper {

    Customer findById(Integer id);

    List<Customer> getAll();

    /**
     * 添加
     * @param customer
     * @return
     */
    Integer insert(Customer customer);

    List<Customer> findAllListByPage(@Param("start") Integer start, @Param("limit") Integer limit,@Param("name") String name,@Param("phone") String phone);

    Integer count();

    Integer countByParam(@Param("name") String name,@Param("phone") String phone);

    /**
     * 更新客户信息
     * @param customer
     * @return
     */
    Integer update(Customer customer);

    /**
     * 删除客户信息
     * @param id
     * @return
     */
    Integer del(Integer id);

    Integer updateState(@Param("id") int id, @Param("state") int state);

    Customer login(@Param("phone") String phone, @Param("password") String password);

    Customer findByPhone(String phone);

    Integer updatePassword(Customer customer);
}
