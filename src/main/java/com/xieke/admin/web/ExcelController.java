package com.xieke.admin.web;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Excel表格控制器
 */
public class ExcelController {
    static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static void main(String[] args) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DAY_OF_WEEK, -1);
        }
        String[] dates = new String[7];
        for (int i = 0; i < 7; i++) {
            dates[i] = dateFormat.format(calendar.getTime());
            calendar.add(Calendar.DATE, 1);
        }
        System.out.println(calendar.getTime().getTime()/1000 + 60*60*24*7);
        System.out.println(Arrays.toString(dates));
        Date currentDate = new Date();
        long l = System.currentTimeMillis();
        long end = l/(1000*3600*24)*(1000*3600*24)-TimeZone.getDefault().getRawOffset();
        System.out.println( end/1000);
        Date xia = new Date(end);
        System.out.println(sdf.format(xia));
        List<Date> days = dateToWeek(xia);
        for (Date date : days) {
            System.out.println(sdf.format(date));
        }

    }
    @SuppressWarnings("deprecation")
    public static List<Date> dateToWeek(Date mdate) {
        int b = mdate.getDay();
        Date fdate;
        List<Date> list = new ArrayList<Date>();
        Long fTime = mdate.getTime() - b * 24 * 3600000;
        for (int a = 1; a <= 7; a++) {
            fdate = new Date();
            fdate.setTime(fTime + (a * 24 * 3600000));
            list.add(a-1, fdate);
        }
        return list;
    }

}
