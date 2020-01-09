package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias("UserCou")
public class UserCou implements Serializable {

    private Integer id;

    private Coupons coupons;

    private Acuser acuser;

    private Integer state;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Coupons getCoupons() {
        return coupons;
    }

    public void setCoupons(Coupons coupons) {
        this.coupons = coupons;
    }

    public Acuser getAcuser() {
        return acuser;
    }

    public void setAcuser(Acuser acuser) {
        this.acuser = acuser;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "UserCou{" +
                "id=" + id +
                ", coupons=" + coupons +
                ", acuser=" + acuser +
                ", state=" + state +
                '}';
    }
}
