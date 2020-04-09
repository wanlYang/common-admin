package com.xieke.admin.service;

import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.UserQueryParam;
import org.apache.ibatis.type.Alias;

import java.util.List;
public interface CustomerService {


    List<Customer> getAllCustomer();

    Boolean saveCustomer(Customer customer);

    List<Customer> getAll();

    List<Customer> getAllCustomer(Integer page, Integer limit, String name,String phone);

    Integer getAllCount();

    Boolean editCustomer(Customer customer);

    Boolean del(Integer[] idArr);

    /**
     * 修改客户状态为会员
     * @param id
     * @param state
     */
    Integer updateState(int id, int state);

    Result login(String phone, String password);

    Customer getCustomerByPhone(String phone);

    Integer updatePassword(Customer customer);
}
