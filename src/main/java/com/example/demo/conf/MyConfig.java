package com.example.demo.conf;

import com.example.demo.interceptor.UserLoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration//配置类
public class MyConfig implements WebMvcConfigurer {

//    自定义拦截器
//    @Bean // 声明这个方法，返回一个bean实例，并把这个bean交给Spring容器管理
//    public UserLoginInterceptor getUserLoginInterceptor(){
//        return new UserLoginInterceptor();
//    }
//
////    添加拦截器
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
////        添加自定义拦截器
//        registry.addInterceptor(getUserLoginInterceptor())
////                拦截路径（不能直接进入main）
//                .addPathPatterns("/user/main");
//    }
}
