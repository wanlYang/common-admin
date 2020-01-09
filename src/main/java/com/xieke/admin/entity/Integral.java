package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 积分
 */
@Alias("Integral")
public class Integral {
    /**
     * ID
     */
    private int id;
    /**
     * 添加时间
     */
    private Date insertTime;

    /**
     * 积分数量
     */
    private int amount;

    /**
     * 关联客户表ID
     */
    private Customer customer;

    /**
     * 使用了多少积分
     */
    private int useAmount;

    /**
     * 使用时间
     */
    private Date useTime;

    /**
     * 合同编号
     */
    private String clubcardNum;

    public String getClubcardNum() {
        return clubcardNum;
    }

    public void setClubcardNum(String clubcardNum) {
        this.clubcardNum = clubcardNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getInsertTime() {
        return insertTime;
    }

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public int getUseAmount() {
        return useAmount;
    }

    public void setUseAmount(int useAmount) {
        this.useAmount = useAmount;
    }

    public Date getUseTime() {
        return useTime;
    }

    public void setUseTime(Date useTime) {
        this.useTime = useTime;
    }

    @Override
    public String toString() {
        return "Integral{" +
                "id=" + id +
                ", insertTime=" + insertTime +
                ", amount=" + amount +
                ", customer=" + customer +
                ", useAmount=" + useAmount +
                ", useTime=" + useTime +
                ", clubcardNum='" + clubcardNum + '\'' +
                '}';
    }
}
