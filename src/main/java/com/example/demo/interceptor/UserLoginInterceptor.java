package com.example.demo.interceptor;

import com.example.demo.entity.User;
import com.example.demo.util.SessionParamter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLoginInterceptor implements HandlerInterceptor {

//    进入control控制器之前执行（通常用于拦截）
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        Object obj = request.getSession().getAttribute(SessionParamter.USER_INFO);
        if (obj!=null &&obj instanceof User){
//            已经登录
            return true;
        }
//        没有登录，进行拦截
        response.sendRedirect("/user/login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) throws Exception {

    }

    //control控制器返回内容之后进入
    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response,
                                Object handler, Exception ex) throws Exception {

    }
}
