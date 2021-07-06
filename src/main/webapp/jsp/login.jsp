<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/layui/css/layui.css">
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
            function jump() {
                window.location = "/register.jsp";
            }
            if (getQueryVariable("error")=="1"){
                alert("用户名不存在！");
            }
        </script>
    </head>
    <body class="layui-body">
        <div class="layui-main">
            <form action="/user/dologin" method="post" class="layui-form">
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

                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md2">
                        <input type="submit" value="登录" class="layui-btn  layui-btn-radius">
                    </div>
                </div>
            </form>
        </div>


    </body>
</html>
