package com.xieke.admin.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class UUIDUtils {
    public static String getUid() {
        return UUID.randomUUID().toString();
    }

    public static String getOrderid() {
        return UUID.randomUUID().toString();
    }

    public static String getOrderItemid() {
        return UUID.randomUUID().toString();
    }

    public static String getPid() {
        return UUID.randomUUID().toString();
    }

    public static String getCateGoryId() {
        return UUID.randomUUID().toString();
    }

    public static String getCode() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static void main(String[] args) {
        System.out.println(generateNumberUUID(""));
    }

    public static String generateUID() {
        Random random = new Random();
        String result = "";
        for (int i = 0; i < 8; i++) {
            result = result + (random.nextInt(9) + 1);
        }
        return result;
    }

    public static String generateNumberUUID(String type) {
        String no = "";
        int[] num = new int[9];
        int c = 0;
        for (int i = 0; i < 9; i++) {
            num[i] = (new Random()).nextInt(10) + 1;
            c = num[i];
            for (int j = 0; j < i; j++) {
                if (num[j] == c) {
                    i--;
                    break;
                }
            }
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());
        Calendar calendar = Calendar.getInstance();
        String date  = calendar.get(1) + "" + (calendar.get(2) + 1) + (calendar.get(Calendar.DATE));
        if (num.length > 0) {
            for (int i = 0; i < num.length; i++) {
                no = no + num[i];
            }
        }
        if (type.equals("ADMIN_ID")) {
            String wanl = "ADMIN";
            return wanl = wanl + no;
        }
        if (type.equals("DANCE_TEACHER_ID")) {
            String wanl = "DANCETEACHER";
            return wanl = wanl + no;
        }
        if (type.equals("DANCE_TRAINING_ID")) {
            String wanl = "DANCETRAINING";
            return wanl = wanl + no;
        }
        if (type.equals("CLUBCARD")) {
            String wanl = "JY";
            return wanl = wanl +date+ no +"";
        }
        if (type.equals("COACH")) {
            String wanl = "SJ";
            return wanl = wanl +date +"";
        }
        if (type.equals("FIRSTMONEY")) {
            String wanl = "FM";
            return wanl = wanl +date+ no +"";
        }
        return no + "" +System.currentTimeMillis();
    }
}
