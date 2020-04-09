package com.xieke.admin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class TimeSplit {

    /**
     * 获取固定间隔时刻集合
     * @param start 开始时间
     * @param end 结束时间
     * @param interval 时间间隔(单位：分钟)
     * @return
     */
    public static List<String> getIntervalTimeList(String start, String end, int interval){
        Date startDate = convertString2Date("HH:mm:ss",start);
        Date endDate = convertString2Date("HH:mm:ss",end);
        List<String> list = new ArrayList<>();
        while(startDate.getTime()<=endDate.getTime()){
            list.add(convertDate2String("HH:mm:ss",startDate));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(startDate);
            calendar.add(Calendar.MINUTE,interval);
            if(calendar.getTime().getTime()>endDate.getTime()){
                if(!startDate.equals(endDate)){
                    list.add(convertDate2String("HH:mm:ss",endDate));
                }
                startDate = calendar.getTime();
            }else{
                startDate = calendar.getTime();
            }

        }
        return list;
    }
    public static Date convertString2Date(String format, String dateStr) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
        try {
            Date date = simpleDateFormat.parse(dateStr);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static String convertDate2String(String format,Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
        return simpleDateFormat.format(date);
    }

//    public static void main(String[] args) {
//     List<String>  x = getIntervalTimeList("12:00:00","18:00:00",30);
//        for (String i:x) {
//            System.out.println(i);
//        }
//
//
//    }

}
