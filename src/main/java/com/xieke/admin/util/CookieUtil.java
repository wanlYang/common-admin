package com.xieke.admin.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {

    public static void addCookie(HttpServletResponse response, String name, String value, Integer maxAge,
            boolean isEncode) {
        try {
            if (value == null) {
                value = "";
            } else if (isEncode) {
                value = URLEncoder.encode(value, "UTF-8");
            }
            Cookie cookie = new Cookie(name, value);
            if (maxAge.intValue() > 0) {
                cookie.setMaxAge(maxAge.intValue());
            }
            cookie.setPath("/");
            response.addCookie(cookie);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean delCookie(HttpServletResponse response, HttpServletRequest request, String name) {
        boolean bool = false;
        Cookie[] cookies = request.getCookies();
        if (null == cookies || cookies.length == 0) {
            return bool;
        }
        try {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    bool = true;
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bool;
    }

    public static String getCookie(HttpServletRequest request, String name, boolean isDecoder) {
        Cookie[] cookies = request.getCookies();
        if (cookies == null || name == null) {
            return "";
        }
        String retValue = null;
        try {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals(name)) {
                    if (isDecoder) {
                        retValue = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
                        break;
                    }
                    retValue = cookies[i].getValue();

                    break;
                }
            }
        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();
        }
        return retValue;
    }
}
