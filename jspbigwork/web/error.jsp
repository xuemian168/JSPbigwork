<%--
  Created by IntelliJ IDEA.
  User: zhoumx
  Date: 2022/11/18
  Time: 3:46 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String msg = (String) session.getAttribute("msg");
    String id = request.getParameter("id");
    if (msg == "333" || id == "333") {
        out.print("用户名已被注册");
    } else if (msg == "222" || id == "222") {
        out.print("未知错误");
    } else if ((msg == "888") || (id == "888")) {
        out.print("登陆失败");
    } else if ((msg=="601")||(id=="601")) {
        out.print("密码输入有误");
    } else out.print("未知错误");
%>
</body>
</html>
