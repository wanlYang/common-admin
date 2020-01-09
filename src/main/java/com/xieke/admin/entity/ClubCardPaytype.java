package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

@Alias("ClubCardPaytype")
public class ClubCardPaytype {

    private Integer id;
    private Double money;
    private Clubcard clubcard;
    private Paytype paytype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Clubcard getClubcard() {
        return clubcard;
    }

    public void setClubcard(Clubcard clubcard) {
        this.clubcard = clubcard;
    }

    public Paytype getPaytype() {
        return paytype;
    }

    public void setPaytype(Paytype paytype) {
        this.paytype = paytype;
    }

    @Override
    public String toString() {
        return "ClubCardPaytype{" +
                "id=" + id +
                ", money=" + money +
                ", clubcard=" + clubcard +
                ", paytype=" + paytype +
                '}';
    }
}
