package com.xieke.admin.entity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * 客户实体类
 */
@Alias("Customer")
@TableName("jy_customer")
public class Customer {

    /**
     * 客户ID
     */
    private int id;
    /**
     * 客户姓名
     */
    private String name;
    /**
     * 客户类型
     */
    private int cusType;
    /**
     * 客户来源  外键
     */
    private Fromsource fromsource;

    /**
     * IC卡号 卡内码 不可重复
     */
    private String icCardId;

    /**
     * IC卡编号
     */
    private String icCardNum;

    /**
     * 门店名称  固定值
     */
    private String store;
    /**
     * 生日
     */
    private Date birthday;
    /**
     * 性别
     */
    private int sex;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 身份证号
     */
    private String idCard;
    /**
     * 接待人 拉取员工表
     */
    private User reception;

    /**
     * 销售顾问 拉取员工表
     */
    private User mt;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 介绍人，拉取客户列表  本表
     */
    private Customer intro;

    /**
     * 备注
     */
    private String remark;

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

    public int getCusType() {
        return cusType;
    }

    public void setCusType(int cusType) {
        this.cusType = cusType;
    }

    public Fromsource getFromsource() {
        return fromsource;
    }

    public void setFromsource(Fromsource fromsource) {
        this.fromsource = fromsource;
    }

    public String getIcCardId() {
        return icCardId;
    }

    public void setIcCardId(String icCardId) {
        this.icCardId = icCardId;
    }

    public String getIcCardNum() {
        return icCardNum;
    }

    public void setIcCardNum(String icCardNum) {
        this.icCardNum = icCardNum;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public User getReception() {
        return reception;
    }

    public void setReception(User reception) {
        this.reception = reception;
    }

    public User getMt() {
        return mt;
    }

    public void setMt(User mt) {
        this.mt = mt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Customer getIntro() {
        return intro;
    }

    public void setIntro(Customer intro) {
        this.intro = intro;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cusType=" + cusType +
                ", fromsource=" + fromsource +
                ", icCardId=" + icCardId +
                ", icCardNum=" + icCardNum +
                ", store='" + store + '\'' +
                ", birthday=" + birthday +
                ", sex=" + sex +
                ", phone='" + phone + '\'' +
                ", idCard='" + idCard + '\'' +
                ", reception=" + reception +
                ", mt=" + mt +
                ", email='" + email + '\'' +
                ", intro=" + intro +
                ", remark='" + remark + '\'' +
                '}';
    }
}
