<%@ page import="cn.edu.hziee.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: hanhuixue
  Date: 2022/11/23
  Time: 3:40 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dbo" class="cn.edu.hziee.utils.DBUtils"></jsp:useBean>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
    Object user = request.getAttribute("user");
    if (request.getParameter("userName")!=null) {
        User user1 = (User) user;
        session.setAttribute("userName",user1.getUserName());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HHX笔记管理系统</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        /* Style the top navigation bar */
        .topnav {
            overflow: hidden;
            background-color: #333;
        }

        /* Style the topnav links */
        .topnav a {
            float: right;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .topnav p {
            float: left;
            text-align: center;
            color: white;
            padding: 0px 10px;
        }


        /* Change color on hover */
        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Style the content */
        .content {
            background-color: #ddd;
            padding: 25px;
            height: 1000px; /* Should be removed. Only for demonstration */
        }

        /* Style the footer */
        .footer {
            background-color: #f1f1f1;
            padding: 10px;
        }
    </style>
</head>
<body>

<div class="topnav">
    <p><%=user1.getUserName().toUpperCase()%>笔记管理系统
    </p>
    <a href="logout.jsp">登出</a>


</div>
<%
    String username = user1.getUserName();
    System.out.println("用户名:" + username);
    boolean isadmin;
    if (("admin".equals(username))) isadmin = true;
    else isadmin = false;
    System.out.println(isadmin);
%>
<div class="content">
    <h2>笔记管理器</h2>
    <p>A website of manage student notes</p>
    <form action="post.do" method="post">
        <%if (isadmin) {%>
        <input type="text" name="username" value="<%=username%>"><br>
        <%} else {%>
        <input type="text" readonly="readonly" name="username" value="<%=username%>"><br>
        <%}%>
        <input type="text" name="content" width="30px" height="80px"><br>
        <input type="submit" value="提交笔记">
    </form>

    <%
        String[] field = {"postid", "username", "contents"};
        String sql = "";

        if (isadmin) {
            sql = "select * from contents";
        } else {
            sql = "select * from contents where username='" + user1.getUserName() + "' or share = 1";
        }
        List<String[]> vec = dbo.getaData(field, sql);
        for (int i = 0; i < vec.size(); i++) {
            String ss[] = vec.get(i);
    %>
    <table width="500" height="161" border="0" cellpadding="0" cellspacing="1" bgcolor="#999999">
        <tr>
            <td>ID</td>
            <td width="337" height="25" bgcolor="#CCCCCC"> 【<%=ss[0]%>】</td>
            <td><a href="./share.jsp?id=<%=ss[0]%>">分享</a></td>
        </tr>
        <tr>
            <td width="20">用户名</td>
            <td width="337" height="25" bgcolor="#CCCCCC"> 【<%=ss[1]%>】</td>
            <td width="35"><a href="./postmgt.jsp?id=<%=ss[0]%>">修改这条</a></td>
        </tr>
        <tr>
            <td>笔记</td>
            <td height="100" bgcolor="#CCCCCC">【<%=ss[2]%>】</td>
            <td width="20" rowspan="3"><a href="./del.jsp?act=<%=ss[0]%>">删除这条</a></td>


        </tr>
    </table>
    <%
        }
    %>

    <%
        } else {
            System.out.println("session 获取失败");
            System.out.println(user);
            response.sendRedirect("login.html");
            return;
        }
    %>
</div>
<div class="footer">
    <p style="text-align: center">© XueMian168.Com</p>
</div>
SessionID：<%= session.getId() %>
<%
    session.setMaxInactiveInterval(50);
%>
</body>
</html>



