package com.xieke.admin.entity.pe;

import java.util.Date;

public class Alltimes {

    private Integer id;

    /**
     *选择日期
     */
    private String choiceDate;

    /**
     *时间段（半小时）
     */
    private String times;

    /**
     *时间段重复次数（也可作教练数量）
     */
    private int count;

    /**
     *可不可用  cando或者notdo
     */
    private String cssClass;

    @Override
    public String toString() {
        return "Alltimes{" +
                "id=" + id +
                ", choiceDate=" + choiceDate +
                ", times=" + times +
                ", count=" + count +
                ", cssClass='" + cssClass + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChoiceDate() {
        return choiceDate;
    }

    public void setChoiceDate(String choiceDate) {
        this.choiceDate = choiceDate;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public Alltimes() {
    }

    public Alltimes(Integer id, String choiceDate, String times, int count, String cssClass) {
        this.id = id;
        this.choiceDate = choiceDate;
        this.times = times;
        this.count = count;
        this.cssClass = cssClass;
    }
}
