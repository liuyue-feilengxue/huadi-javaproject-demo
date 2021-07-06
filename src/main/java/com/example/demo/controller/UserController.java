package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import com.example.demo.util.SessionParamter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired //自动注入，把spring容器里面的UserService实例赋值给变量userService
    private UserService userService;

//    注册用户->登录->主页

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/doregist")
    public String doregist(User user){
        User dbUser=userService.findByUserName(user.getUsername());
        if(dbUser!=null){
            //不为空，说明已经注册过了
            return "redirect:/user/register?error=1";
        }else{
//            注册
            user.setCreateTime(new Date());
            userService.createUser(user);
            return "redirect:/user/login";
        }
    }
//  登录页
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/dologin")
    public String dologin(User user, HttpSession session){
        User dbUser=userService.findByNameAndPas(user);
        if(dbUser!=null){
//           如果用户存在，那么就登录，并保存用户信息到session里面，然后跳转到主页
            session.setAttribute(SessionParamter.USER_INFO,dbUser);
            return "redirect:/user/main";
        }else{
//           如果用户不存在，那么就登录失败并提示
            return "redirect:/user/login?error=1";
        }
    }

//  主页
    @RequestMapping("/main")
    public String main(HttpServletRequest request,
                       HttpSession session, Map<String,Object> map){
        Object obj=session.getAttribute(SessionParamter.USER_INFO);
        if(obj!=null && obj instanceof User){
            User user=(User)obj;
            map.put("user",user);
        }

        int currentPage=1;
        int pageSize=5;
        int total=userService.count();

        int firstPage=total%pageSize;
        if(firstPage!=0){
            firstPage=1;
        }else{
            firstPage=0;
        }
        int pageTotal=total/pageSize+firstPage;

        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr!=null){
            currentPage=Integer.parseInt(currentPageStr);
        }

        List<User> userList=userService.findAll();

        List<User> userList2=userService.findByPage(currentPage,pageSize);

        map.put("userList",userList);
        map.put("total",total);
        map.put("pageTotal",pageTotal);
        map.put("currentPage",currentPage);
        return "main";
    }

    @RequestMapping("/donewuser")
    public String doNewUser(User user){
        User dbUser=userService.findByUserName(user.getUsername());
        if(dbUser!=null){
            //不为空，说明已经注册过了
            return "redirect:/user/main?error=1";
        }else{
//            新用户（注册）
            user.setCreateTime(new Date());
            userService.createUser(user);
            return "redirect:/user/main";
        }
    }

    @RequestMapping("/edit")
    public String editUser(int id,Map<String,Object> map){
        User user=userService.findById(id);
        map.put("user",user);
        return "edit";
    }

    @RequestMapping("/doupdateuser")
    public String updateUser(User user,HttpSession session){
        userService.updateUser(user);
//        User dbUser=userService.findByNameAndPas(user);
//        session.setAttribute(SessionParamter.USER_INFO,dbUser);
        return "redirect:/user/main";
    }

    @RequestMapping("/deleteuser")
    public String deleteUser(int id){
        userService.deleteUser(id);
        return "redirect:/user/main";
    }

//    退出登录
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){
        request.getSession().removeAttribute(SessionParamter.USER_INFO);
        return "redirect:/user/login";
    }

}
