<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/10/25
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>session</title>
</head>
<body>
SessionID：<%= session.getId() %>
<%
    session.setMaxInactiveInterval(50);
%>
</body>
</html>
