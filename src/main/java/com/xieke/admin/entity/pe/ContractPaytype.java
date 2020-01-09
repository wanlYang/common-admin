package com.xieke.admin.entity.pe;

import com.xieke.admin.entity.Paytype;
import org.apache.ibatis.type.Alias;

@Alias("ContractPaytype")
public class ContractPaytype {

    private int id;

    private String money;

    private PrivateContract privateContract;

    private Paytype paytype;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public PrivateContract getPrivateContract() {
        return privateContract;
    }

    public void setPrivateContract(PrivateContract privateContract) {
        this.privateContract = privateContract;
    }

    public Paytype getPaytype() {
        return paytype;
    }

    public void setPaytype(Paytype paytype) {
        this.paytype = paytype;
    }

    @Override
    public String toString() {
        return "ContractPaytype{" +
                "id=" + id +
                ", money='" + money + '\'' +
                ", privateContract=" + privateContract +
                ", paytype=" + paytype +
                '}';
    }
}
