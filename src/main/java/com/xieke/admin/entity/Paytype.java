package com.xieke.admin.entity;

import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("Paytype")
public class Paytype {
    /**
     * 付款方式Id
     */
    private int id;
    /**
     * 付款方式名称
     */
    private String name;

    /**
     *是否有效  0无效 1为有效
     */
    private int valid;

    /**
     * 操作时间
     */
    private Date createTime;

    public Paytype(int id, String name, int valid, Date createTime) {
        this.id = id;
        this.name = name;
        this.valid = valid;
        this.createTime = createTime;
    }


    public Paytype() {
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

    public int getValid() {
        return valid;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Paytype{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", valid=" + valid +
                ", createTime=" + createTime +
                '}';
    }
}
