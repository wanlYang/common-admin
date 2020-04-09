package com.xieke.admin.entity.pe;


import com.xieke.admin.entity.Customer;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("Shopping")
public class Shopping {
    private int id;
    private PrivateContract contract;
    private Coach coach;
    private Customer customer;
    private String starttime;
    private String endtime;
    private Date thisday;
    private boolean valid;
    private Date nowtime;


    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public Date getNowtime() {
        return nowtime;
    }

    public void setNowtime(Date nowtime) {
        this.nowtime = nowtime;
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
        return "Shopping{" +
                "id=" + id +
                ", contract=" + contract +
                ", coach=" + coach +
                ", customer=" + customer +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", thisday=" + thisday +
                ", valid=" + valid +
                ", nowtime=" + nowtime +
                '}';
    }
}
