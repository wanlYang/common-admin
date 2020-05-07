package com.xieke.admin.entity.pe;

import org.apache.ibatis.type.Alias;


@Alias("Member")
public class Member {

    private Integer id;
    private String name;
    private String nickName;
    private String userHeaderImg;
    private Integer sex;
    private String phone;
    private Integer videoStatus;
    private Integer videoTime;
    private Integer vipStatus;
    private Integer vipTime;
    private Integer addTime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getUserHeaderImg() {
        return userHeaderImg;
    }

    public void setUserHeaderImg(String userHeaderImg) {
        this.userHeaderImg = userHeaderImg;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getVideoStatus() {
        return videoStatus;
    }

    public void setVideoStatus(Integer videoStatus) {
        this.videoStatus = videoStatus;
    }

    public Integer getVideoTime() {
        return videoTime;
    }

    public void setVideoTime(Integer videoTime) {
        this.videoTime = videoTime;
    }

    public Integer getVipStatus() {
        return vipStatus;
    }

    public void setVipStatus(Integer vipStatus) {
        this.vipStatus = vipStatus;
    }

    public Integer getVipTime() {
        return vipTime;
    }

    public void setVipTime(Integer vipTime) {
        this.vipTime = vipTime;
    }

    public Integer getAddTime() {
        return addTime;
    }

    public void setAddTime(Integer addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "Member{" +
                "name='" + name + '\'' +
                ", nickName='" + nickName + '\'' +
                ", userHeaderImg='" + userHeaderImg + '\'' +
                ", sex=" + sex +
                ", phone='" + phone + '\'' +
                ", videoStatus=" + videoStatus +
                ", videoTime=" + videoTime +
                ", vipStatus=" + vipStatus +
                ", vipTime=" + vipTime +
                ", addTime=" + addTime +
                '}';
    }
}
