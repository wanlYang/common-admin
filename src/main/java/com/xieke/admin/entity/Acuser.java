package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

@Alias("Acuser")
public class Acuser implements Serializable {


    private int id;
    private String name;
    private String phone;


    private List<UserCou> userCous;

    public List<UserCou> getUserCous() {
        return userCous;
    }

    public void setUserCous(List<UserCou> userCous) {
        this.userCous = userCous;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Acuser() {
    }

    public Acuser(int id, String name, String phone) {
        this.id = id;
        this.name = name;
        this.phone = phone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Acuser acuser = (Acuser) o;
        return id == acuser.id &&
                Objects.equals(phone, acuser.phone);
    }

    @Override
    public String toString() {
        return "Acuser{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", userCous=" + userCous +
                '}';
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, phone);
    }
}
