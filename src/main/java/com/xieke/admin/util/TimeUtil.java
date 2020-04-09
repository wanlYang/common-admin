package com.xieke.admin.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class TimeUtil {
    public String GetNearest15MinutesDateByCurrentDate() {
        // 日期字符串格式 ："2013-05-01 00:01:08"
        Calendar calendar = Calendar.getInstance();//获取当前时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int minute = calendar.get(Calendar.MINUTE);// 得到分钟
        int count = 0;
        if (minute != 0 && minute != 30 && minute != 30 && minute != 45) { //时间不为00，15，30，45的情况
            for (int i = minute; i >= 0; i--) { //判断距离最近的00，15，30，45的分钟数
                if (i % 15 == 0) {
                    break;
                } else {
                    count++;
                }
            }
        }
        calendar.add(Calendar.MINUTE, -count); //获取最近的分钟
        int year = calendar.get(Calendar.YEAR); //得到年
        int month = calendar.get(Calendar.MONTH) + 1; //得到月
        int day = calendar.get(Calendar.DAY_OF_MONTH);// 得到天
        int hour = calendar.get(Calendar.HOUR_OF_DAY);// 得到小时
        int min = calendar.get(Calendar.MINUTE);// 得到分钟
        StringBuffer datebuffer = new StringBuffer();
        datebuffer.append(year);
        datebuffer.append("-");
        if (month < 10) {
            datebuffer.append("0" + month + "-");
        } else {
            datebuffer.append(month + "-");
        }
        if (day < 10) {
            datebuffer.append("0" + day + " ");
        } else {
            datebuffer.append(day + " ");
        }
        if (hour < 10) {
            datebuffer.append("0" + hour + ":");
        } else {
            datebuffer.append(hour + ":");
        }
        if (min < 10) {
            datebuffer.append("0" + min + ":");
        } else {
            datebuffer.append(min + ":");
        }
        datebuffer.append("00");
        System.out.println(datebuffer.toString());
        return datebuffer.toString();
    }

    static void asd() {
        Date a = new Date("2020/01/16");
        SimpleDateFormat ist = new SimpleDateFormat("yyyy/MM/dd");
        System.out.println(ist.format(a));
    }

    public static void main(String[] args) throws ParseException {
//        TimeUtil timeUtil = new TimeUtil();
//        timeUtil.GetNearest15MinutesDateByCurrentDate();
asd();
    }
}