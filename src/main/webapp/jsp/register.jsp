<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>注册页面</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/layui/css/layui.css">

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
    <body class="layui-body">
        <div class="layui-main">
            <form action="/user/doregist" method="post" onsubmit="return checkUser()" class="layui-form">
                <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px";>
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input id="username" type="text" name="username" class="layui-input" required  lay-verify="required" autocomplete="off"
                        placeholder="请输入用户名"/>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px";>
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                        <input id="password" type="password" name="password" class="layui-input" required  lay-verify="required" autocomplete="off"
                               placeholder="请输入密码"/>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px";>
                    <label class="layui-form-label">确认密码：</label>
                    <div class="layui-input-block">
                        <input id="password2" type="password" name="password2" class="layui-input" required  lay-verify="required" autocomplete="off"
                               placeholder="请再次输入密码"/>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px";>
                    <label class="layui-form-label">昵称：</label>
                    <div class="layui-input-block">
                            <input type="text" name="nickName" class="layui-input" autocomplete="off"
                                   placeholder="请输入昵称" />
                    </div>
                </div>
                <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px";>
                    <label class="layui-form-label">手机：</label>
                    <div class="layui-input-block">
                            <input id="phone" type="text" name="phone" class="layui-input" lay-verify="phone" autocomplete="off"
                                   placeholder="请输入手机" />
                    </div>
                </div>
                <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px";>
                    <label class="layui-form-label">email：</label>
                    <div class="layui-input-block">
                        <input id="email" type="email" name="email" class="layui-input" lay-verify="email" autocomplete="off"
                             placeholder="请输入email" />
                    </div>
                </div>
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md4">
                        <input type="submit" value="注册" class="layui-btn  layui-btn-radius">
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
