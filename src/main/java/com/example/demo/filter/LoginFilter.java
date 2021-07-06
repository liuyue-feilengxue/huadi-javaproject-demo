package com.example.demo.filter;

import com.example.demo.entity.User;
import com.example.demo.util.SessionParamter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest hsr=(HttpServletRequest)servletRequest;
        HttpServletResponse hsrp=(HttpServletResponse)servletResponse;
        String requestURI = hsr.getRequestURI();
        if(requestURI.contains("login")
                ||requestURI.contains("regist")
                ||requestURI.contains("static")
                ||requestURI.contains("style")){
//            不过滤登录页，注册页,直接放行，执行下一个过滤器
            filterChain.doFilter(servletRequest,servletResponse);
        }else{
            Object attribute = hsr.getSession().getAttribute(SessionParamter.USER_INFO);
            if(attribute!=null && attribute instanceof User){
//                已经登录
                filterChain.doFilter(servletRequest,servletResponse);
            }else{
//                没有登录，跳转到登录页面
                hsrp.sendRedirect("/user/login");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
