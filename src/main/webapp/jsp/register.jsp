<%@ page contentType="text/html; charset=UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>注册页面</title>
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
                else if (getQueryVariable("error")=="1"){
                    alert("用户名已存在！");
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
        注册页面：<br>
        <form action="/user/doregist" method="post" onsubmit="return checkUser()">

            用户名*：<input id="username" type="text" name="username"/><br>
            密码*：<input id="password" type="password" name="password"/><br>
            确认密码*：<input id="password2" type="password" name="password2"/><br>
            昵称：<input type="text" name="nickName"/><br>
            手机：<input id="phone" type="text" name="phone"><br>
            email:<input id="email" type="email" name="email"><br>
            <input type="submit" value="提交">
        </form>
    </body>
</html>
