<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>管理用户</title>

    <script>
        function gotoPage(page){
            var searchtype=$("#searchtype").val();
            var searchvalue=$("#searchvalue").val();
            if(searchtype!='' && searchvalue!=''){
                window.location.href="/user/viewusers?currentPage="+page+
                "&searchtype="+searchtype+"&searchvalue="+searchvalue;
            }else{
                window.location.href="/user/viewusers?currentPage="+page;
            }
        }
    </script>
</head>
<body>
<div class="container-fluid" align="center">
    <div class="row">

        <%--        主体 开始--%>


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
            <br>
            <h4>用户管理</h4>
            <br>
            <br>
            <div class="table-responsive">

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">账号</th>
                        <th scope="col">昵称</th>
                        <th scope="col">手机号</th>
                        <th scope="col">操作</th>
                    </tr>

                    </thead>
                    <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.nickName}</td>
                                <td>${user.telephone}</td>
                                <td><a href="/user/edituser?id=${user.id}">编辑</a> &nbsp;&nbsp;<a href="/user/adduser">添加</a> <a href="/user/deleteuser?id=${user.id}">删除</a></td>
                            </tr>
                        </c:forEach>



                    </tbody>

                </table>

                <br>

                <%--            分页--%>

                <span>总记录：${total}， <span>总页数：${pageTotal}，</span> <span>当前页：${currentPage}</span>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${currentPage>1}">
                        <li class="page-item">
                            <a class="page-link" onclick="gotoPage(${currentPage-1})">上一页</a></li>
                    </c:if>
                    <c:forEach begin="1" end="${pageTotal}" var="page">
                        <c:if test="${page==currentPage}">
                            <li class="page-item"><a class="page-link" href="javascript:void(0);">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=currentPage}">
                            <li class="page-item"><a class="page-link" onclick="gotoPage(${page})">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage<pageTotal}">
                        <li class="page-item"><a class="page-link" onclick="gotoPage(${currentPage+1})">下一页</a></li>
                    </c:if>

                </ul>
            </nav>


            </div>
        </main>


        <%--        主体 结束--%>
    </div>
</div>

<!-- /.modal -->

</body>
</html>
