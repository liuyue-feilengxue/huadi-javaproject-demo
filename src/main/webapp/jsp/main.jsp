<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>用户管理</title>
        <style>
            table{
                border: 1px solid;
                margin: auto;
                width: 500px;
            }
            td,th{
                text-align: center;
                border: 1px solid;
            }
            div{
                text-align: center;
                margin: 50px;
            }
        </style>
        <script language="javascript" type="text/javascript">
            //获取url地址
            function getQueryVariable(variable)
            {
                var query = window.location.search.substring(1);
                var vars = query.split("&");
                for (var i=0;i<vars.length;i++) {
                    var pair = vars[i].split("=");
                    if(pair[0] == variable){return pair[1];}
                }
                return(false);
            }
            //检查表单
            function checkUser(){
                var usename = document.getElementById("username").value;
                console.log(getQueryVariable("error"));
                if(usename==""){
                    alert("请输入用户名！");
                    return false;
                }
                <%--            判断密码--%>
                var pwd1 = document.getElementById("password").value;
                var pwd2 = document.getElementById("password2").value;
                if(pwd1!=pwd2){
                    alert("两次密码不一致！");
                    return false;
                }
                //判断手机
                var phone = document.getElementById("phone").value;
                //手机号正则
                var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
                //手机号，可以为空
                if(!myreg.test(phone)&&phone!="")
                {
                    alert('请输入有效的手机号码！');
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
    <form action="/user/donewuser" method="post" onsubmit="return checkUser()">
        用户名*：<input id="username" type="text" name="username"/>
        密码*：<input id="password" type="password" name="password"/>
        确认密码*：<input id="password2" type="password" name="password2"/>
        昵称：<input type="text" name="nickName"/>
        手机：<input id="phone" type="text" name="phone">
        email:<input id="email" type="email" name="email">
        <input type="submit" value="添加新用户">
    </form>
    <form action="/user/donewuser" method="post" onsubmit="return checkUser()">
        用户名*：<input  type="text" name="username"/>
        密码*：<input id= type="password" name="password"/>
        昵称：<input type="text" name="nickName"/>
        手机：<input  type="text" name="phone">
        email:<input  type="email" name="email">
        <input type="hidden" name="id">
        <input type="submit" value="编辑用户">
    </form>
        <table>
            <caption>用户管理表</caption>
            <thead>
                <tr>
                    <th>用  户  名</th>
                    <th>昵      称</th>
                    <th>手      机</th>
                    <th>邮      箱</th>
                    <th>操      作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.nickName}</td>
                    <td>${user.phone}</td>
                    <td>${user.email}</td>
                    <td><a href="/user/deleteuser?id=${user.id}">删除</a><br>
                        <a href="/user/edit?id=${user.id}">编辑</a>
                    <%--                        备用，修改--%>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
<%--        <span>总记录：${total}， <span>总页数：${pageTotal}，</span> <span>当前页：${currentPage}</span><br>--%>
        <a href="/user/exit">退出登录</a>
    </body>
</html>
