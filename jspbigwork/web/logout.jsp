<%--
  Created by IntelliJ IDEA.
  User: zhoumx
  Date: 2022/10/18
  Time: 11:46 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();//清除session，失效
    response.sendRedirect("login.html");
%>
</body>
</html>
