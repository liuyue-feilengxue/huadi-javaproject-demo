<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>编辑用户</title>
    </head>
    <body>
    <h4> 编辑用户：</h4>
    <form action="/user/doupdateuser" method="post">
        <table class="table table-hover">
            <tr><td>用户名：</td><td>${user.username}</td></tr>
            <tr><td>昵称：</td><td><input type="text" name="nickName" value="${user.nickName}"></td></tr>
            <tr><td>密码：</td><td><input type="text" name="password" value="${user.password}"></td></tr>
            <tr><td>电话：</td><td><input type="text" name="phone" value="${user.phone}"></td></tr>
            <tr><td>邮箱：</td><td><input type="email" name="email" value="${user.email}"></td></tr>

            <tr><td>
                <input type="hidden" name="id" value="${user.id}">
                <button  class="btn btn-log btn-primary btn-dark" type="submit">提交</button>
            </td></tr>
        </table>

        <br>
    </form>
    </body>
</html>
