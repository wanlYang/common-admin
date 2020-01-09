package com.xieke.admin.entity.pe;

import org.apache.ibatis.type.Alias;

@Alias("Course")
public class Course {

    /**
     * ID
     */
    private Integer id;

    /**
     * 课程名称
     */
    private String name;

    /**
     * 课程简介
     */
    private String briefIntroduction;

    /**
     * 所属店面
     */
    private String store;

    /**
     * 课程单价
     */
    private String unitPrice;

    /**
     * 备注
     */
    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBriefIntroduction() {
        return briefIntroduction;
    }

    public void setBriefIntroduction(String briefIntroduction) {
        this.briefIntroduction = briefIntroduction;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", briefIntroduction='" + briefIntroduction + '\'' +
                ", store='" + store + '\'' +
                ", unitPrice='" + unitPrice + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
