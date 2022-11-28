<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/11/25
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>注册页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/my-login.css">
</head>
<%
    Object user = session.getAttribute("user");
    if (user!=null) {//已登录
        response.sendRedirect("./admin/index.jsp");
    }
%>
<body class="my-login-page">
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
                <div class="brand">
                    <img src="logo.jpg" alt="" style="width: 90%;height: 90%;">
                </div>
                <div class="card fat">
                    <div class="card-body">
                        <h4 class="card-title">登录笔记系统</h4>
                        <form method="POST" class="my-login-validation" novalidate="" action="login.do">
                            <div class="form-group">
                                <label for="userName">用户名：</label>
                                <input id="userName" type="userName" class="form-control" name="userName" value="" onkeyup="value=value.replace(/[\W]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required autofocus>
                                <div class="invalid-feedback">
                                    用户名无效
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password">密码
                                    <a href="forgot.html" class="float-right">
                                        忘记密码?
                                    </a>
                                </label>
                                <input id="password" type="pwd" class="form-control" name="pwd" required data-eye>
                                <div class="invalid-feedback">
                                    密码是必须的
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="custom-checkbox custom-control">
                                    <input type="checkbox" name="remember" id="remember" class="custom-control-input">
                                    <label for="remember" class="custom-control-label">记住我</label>
                                </div>
                            </div>

                            <div class="form-group m-0">
                                <button type="submit" class="btn btn-primary btn-block">
                                    登录
                                </button>
                            </div>
                            <div class="mt-4 text-center">
                                还没有账户？ <a href="reg.html">创建一个</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="footer">
                    Copyright &copy; XueMian168.Com 2022
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>