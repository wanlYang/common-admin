package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 卡项设置
 */
@Alias("Cardsetting")
public class Cardsetting {

    /**
     * 卡项ID
     */
    private int id;
    /**
     * 卡项名称
     */
    private String name;
    /**
     * 卡类型  1 计时卡  2 次卡  3 时效性次卡
     */
    private int  cardType;

    /**
     * 卡面额
     */
    private Double money;


    /**
     * 单位天 有效期
     */
    private int validity;

    /**
     * 可使用时间 周内 周末1,2,3,4,5,6,
     */
    private String daysCan;

    /**
     * 1 启用  0 未启用
     */
    private int status;

    /**
     * 可使用开始时间
     */
    private Date startTime;

    /**
     * 可使用结束时间
     */
    private Date endTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 操作时间
     */

    private Date createTime;

    /**
     * 次卡次数
     */
    private int num;

    @Override
    public String toString() {
        return "Cardsetting{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cardType=" + cardType +
                ", money=" + money +
                ", validity=" + validity +
                ", daysCan='" + daysCan + '\'' +
                ", status=" + status +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", remark='" + remark + '\'' +
                ", createTime=" + createTime +
                ", num=" + num +
                '}';
    }

    public Cardsetting() {
    }

    public Cardsetting(int id, String name, int cardType, Double money, int validity, String daysCan, int status, Date startTime, Date endTime, String remark, Date createTime, int num) {
        this.id = id;
        this.name = name;
        this.cardType = cardType;
        this.money = money;
        this.validity = validity;
        this.daysCan = daysCan;
        this.status = status;
        this.startTime = startTime;
        this.endTime = endTime;
        this.remark = remark;
        this.createTime = createTime;
        this.num = num;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCardType() {
        return cardType;
    }

    public void setCardType(int cardType) {
        this.cardType = cardType;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public int getValidity() {
        return validity;
    }

    public void setValidity(int validity) {
        this.validity = validity;
    }

    public String getDaysCan() {
        return daysCan;
    }

    public void setDaysCan(String daysCan) {
        this.daysCan = daysCan;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
