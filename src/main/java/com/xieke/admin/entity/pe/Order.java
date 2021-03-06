package com.xieke.admin.entity.pe;


import com.xieke.admin.entity.Customer;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("Order")
public class Order {
    private int id;
    private PrivateContract contract;
    private Coach coach;
    private Customer customer;
    private String starttime;
    private String endtime;
    private Date thisday;
    private Integer status;
    private String orderKey;

    public String getOrderKey() {
        return orderKey;
    }

    public void setOrderKey(String orderKey) {
        this.orderKey = orderKey;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PrivateContract getContract() {
        return contract;
    }

    public void setContract(PrivateContract contract) {
        this.contract = contract;
    }

    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public Date getThisday() {
        return thisday;
    }

    public void setThisday(Date thisday) {
        this.thisday = thisday;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", contract=" + contract +
                ", coach=" + coach +
                ", customer=" + customer +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", thisday=" + thisday +
                '}';
    }
}
