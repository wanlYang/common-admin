package com.xieke.admin.interceptor;

import com.xieke.admin.entity.Acuser;
import com.xieke.admin.service.AcuserService;
import com.xieke.admin.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    private AcuserService acuserService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Acuser acuser = (Acuser)request.getSession().getAttribute("user");

        if (acuser == null){
            String loginCookiePhone = CookieUtil.getCookie(request, "loginCookiePhone", true);
            if(!"".equals(loginCookiePhone)){
                Acuser byPhone = acuserService.findByPhone(loginCookiePhone);
                request.getSession().setAttribute("user",byPhone);
            }

        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
