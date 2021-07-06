<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>登录页面</title>
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
            if (getQueryVariable("error")=="1"){
                alert("用户名不存在！");
            }
        </script>
    </head>
    <body>
        登录页面：<br>
<%--        onsubmit="return checkForm()"--%>
        <form action="/user/dologin" method="post" >
            用户名：<input type="text" name="username"/><br>
            密码：<input id="password" type="password" name="password"/><br>
            <input type="submit" value="登录">
        </form>
    </body>
</html>
