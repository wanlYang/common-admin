package com.xieke.admin.entity.pe;

import org.apache.ibatis.type.Alias;

import java.util.Date;

@Alias("Office")
public class Office {

    /**
     * 上班安排时间ID
     */
    private int id;

    /**
     * 教练
     */
    private Coach coach;

    /**
     * 班次时间
     */
    private Officetime officetime;

    /**
     * 开始时间
     */
    private Date starttime;

    /**
     * 结束时间
     */
    private Date endtime;

    @Override
    public String toString() {
        return "Office{" +
                "id=" + id +
                ", coach=" + coach +
                ", officetime=" + officetime +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    public Officetime getOfficetime() {
        return officetime;
    }

    public void setOfficetime(Officetime officetime) {
        this.officetime = officetime;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Office() {
    }

    public Office(int id, Coach coach, Officetime officetime, Date starttime, Date endtime) {
        this.id = id;
        this.coach = coach;
        this.officetime = officetime;
        this.starttime = starttime;
        this.endtime = endtime;
    }
}
