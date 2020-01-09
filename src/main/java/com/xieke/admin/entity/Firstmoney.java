package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 定金实体
 */
@Alias("Firstmoney")
public class Firstmoney {

    /**
     * 定金ID
     */
    private int id;

    /**
     *  定金备注
     */
    private String remark;

    /**
     * 定金金额
     */
    private Double firstMoney;

    /**
     * 付款方式 连接付款方式表 外键
     */
    private Paytype payType;

    /**
     * 付款时间
     */
    private Date payTime;

    /**
     * 绑定销售  外键 员工ID
     */
    private User mt;

    /**
     * 编号
     */
    private String number;
    /**
     * 定金结束时间  过期
     */
    private Date endTime;

    /**
     * 定金合约添加时间
     */
    private Date insertTime;
    /**
     * 状态 0 未冲账  1 已冲账  2 已退回  3已过期
     */
    private Integer status;

    /**
     * 店面名称
     */
    private String store;

    /**
     * 绑定客户
     */
    private Customer customer;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Double getFirstMoney() {
        return firstMoney;
    }

    public void setFirstMoney(Double firstMoney) {
        this.firstMoney = firstMoney;
    }

    public Paytype getPayType() {
        return payType;
    }

    public void setPayType(Paytype payType) {
        this.payType = payType;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public User getMt() {
        return mt;
    }

    public void setMt(User mt) {
        this.mt = mt;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getInsertTime() {
        return insertTime;
    }

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    @Override
    public String toString() {
        return "Firstmoney{" +
                "id=" + id +
                ", remark='" + remark + '\'' +
                ", firstMoney=" + firstMoney +
                ", payType=" + payType +
                ", payTime=" + payTime +
                ", mt=" + mt +
                ", number='" + number + '\'' +
                ", endTime=" + endTime +
                ", insertTime=" + insertTime +
                ", status=" + status +
                ", store='" + store + '\'' +
                ", customer=" + customer +
                '}';
    }
}
