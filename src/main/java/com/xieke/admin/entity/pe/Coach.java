package com.xieke.admin.entity.pe;

import com.xieke.admin.entity.User;
import org.apache.ibatis.type.Alias;

@Alias("Coach")
public class Coach {
    /**
     * ID
     */
    private int id;
    /**
     * 教练姓名
     */
    private String name ;
    /**
     * 教练性别 0女  1男
     */
    private int sex;

    /**
     * 教练员工
     */
    private User user;

    /**
     * 所属店面
     */
    private String store;

    /**
     * 教练来源  员工
     */
    private String fromsource;

    /**
     * 是否经理     0否 1是
     */
    private int isManager;

    /**
     * 教练编号  自动生成
     */
    private String  coachNumber;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 是否自由教练 0否 1是
     */
    private int freeCoach;

    /**
     * 状态 0正常  1请假  2离职
     */
    private int status;

    /**
     * 简介
     */
    private String  briefIntroduction;

    /**
     * 备注
     */
    private String remark;

    /**
     * 密码
     */
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    private Integer grade;

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }


    @Override
    public String toString() {
        return "Coach{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", user=" + user +
                ", store='" + store + '\'' +
                ", fromsource='" + fromsource + '\'' +
                ", isManager=" + isManager +
                ", coachNumber='" + coachNumber + '\'' +
                ", phone='" + phone + '\'' +
                ", freeCoach=" + freeCoach +
                ", status=" + status +
                ", briefIntroduction='" + briefIntroduction + '\'' +
                ", remark='" + remark + '\'' +
                ", grade=" + grade +
                '}';
    }

    public Coach() {
    }

    public Coach(int id, String name, int sex, User user, String store, String fromsource, int isManager, String coachNumber, String phone, int freeCoach, int status, String briefIntroduction, String remark) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.user = user;
        this.store = store;
        this.fromsource = fromsource;
        this.isManager = isManager;
        this.coachNumber = coachNumber;
        this.phone = phone;
        this.freeCoach = freeCoach;
        this.status = status;
        this.briefIntroduction = briefIntroduction;
        this.remark = remark;
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

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStore() {
        return store;
    }

    public void setStore(String store) {
        this.store = store;
    }

    public String getFromsource() {
        return fromsource;
    }

    public void setFromsource(String fromsource) {
        this.fromsource = fromsource;
    }

    public int getIsManager() {
        return isManager;
    }

    public void setIsManager(int isManager) {
        this.isManager = isManager;
    }

    public String getCoachNumber() {
        return coachNumber;
    }

    public void setCoachNumber(String coachNumber) {
        this.coachNumber = coachNumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getFreeCoach() {
        return freeCoach;
    }

    public void setFreeCoach(int freeCoach) {
        this.freeCoach = freeCoach;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getBriefIntroduction() {
        return briefIntroduction;
    }

    public void setBriefIntroduction(String briefIntroduction) {
        this.briefIntroduction = briefIntroduction;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
