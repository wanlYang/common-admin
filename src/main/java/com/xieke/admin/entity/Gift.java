package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;

@Alias("Gift")
public class Gift implements Serializable {

    private Integer id;
    private Acuser acuser;
    private String giftName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Acuser getAcuser() {
        return acuser;
    }

    public void setAcuser(Acuser acuser) {
        this.acuser = acuser;
    }

    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    @Override
    public String toString() {
        return "Gift{" +
                "id=" + id +
                ", acuser=" + acuser +
                ", giftName='" + giftName + '\'' +
                '}';
    }
}
