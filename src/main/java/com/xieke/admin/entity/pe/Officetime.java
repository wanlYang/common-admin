package com.xieke.admin.entity.pe;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Time;
import java.util.Date;

@Alias("Officetime")
public class Officetime {    /**
 * 班次时间ID
 */
private int id;

    /**
     * 班次名称
     */
    private String name;

    /**
     * 上班开始时间
     */
    private Time starttime;

    /**
     * 下班时间
     */
    private Time endtime;

    /**
     * 展示颜色
     */
    private String  showcolour;

    /**
     *是否有效
     */
    private int status;

    @Override
    public String toString() {
        return "Officetime{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                ", showcolour='" + showcolour + '\'' +
                ", status=" + status +
                '}';
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

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Time starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Time endtime) {
        this.endtime = endtime;
    }

    public String getShowcolour() {
        return showcolour;
    }

    public void setShowcolour(String showcolour) {
        this.showcolour = showcolour;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Officetime() {
    }

    public Officetime(int id, String name, Time starttime, Time endtime, String showcolour, int status) {
        this.id = id;
        this.name = name;
        this.starttime = starttime;
        this.endtime = endtime;
        this.showcolour = showcolour;
        this.status = status;
    }

}
