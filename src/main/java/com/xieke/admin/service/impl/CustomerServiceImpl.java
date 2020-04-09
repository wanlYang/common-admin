package com.xieke.admin.service.impl;

import com.xieke.admin.entity.Customer;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.UserQueryParam;
import com.xieke.admin.mapper.CustomerMapper;
import com.xieke.admin.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Resource
    private CustomerMapper customerMapper;


    @Override
    public List<Customer> getAllCustomer() {


        return customerMapper.getAll();
    }

    @Override
    public Boolean saveCustomer(Customer customer) {
        customer.setPassword("1");
        Integer row = customerMapper.insert(customer);

        return row > 0;
    }

    @Override
    public List<Customer> getAll() {


        return customerMapper.getAll();
    }

    @Override
    public List<Customer> getAllCustomer(Integer page, Integer limit, String name,String phone) {
        List<Customer> customers = null;
        if (page != null && limit != null) {
            customers = this.customerMapper.findAllListByPage((page - 1) * limit, limit,name,phone);
        }
        return customers;
    }

    @Override
    public Integer getAllCount() {

        return customerMapper.count();
    }

    /**
     * 编辑客户信息
     * @param customer
     * @return
     */
    @Override
    public Boolean editCustomer(Customer customer) {
        Integer row = customerMapper.update(customer);

        return row > 0;
    }

    /**
     * 删除信息
     * @param idArr
     * @return
     */
    @Override
    public Boolean del(Integer[] idArr) {
        Integer row = 0;
        for (Integer id:idArr) {
            row = customerMapper.del(id);
        }
        return row > 0;
    }

    @Override
    public Integer updateState(int id, int state) {
        return customerMapper.updateState(id,state);
    }

    @Override
    public Result login(String phone, String password) {
        Customer customer = customerMapper.login(phone,password);
        if (customer == null){
            return new Result(-1,"账号或密码错误!");
        }

        return new Result(200,"登陆成功!");
    }

    @Override
    public Customer getCustomerByPhone(String phone) {


        return customerMapper.findByPhone(phone);
    }

    @Override
    public Integer updatePassword(Customer customer) {
        return customerMapper.updatePassword(customer);
    }
}
