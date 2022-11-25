<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/11/23
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dbo" class="cn.edu.hziee.utils.DBUtils"></jsp:useBean>
<html>
<head>
    <title>删除文章</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    String act = request.getParameter("act");
    if (id != null) {
        out.print("已分享ID为" + act + "的文章");
        if (act.equals("1")) {
            dbo.sharepost(id, "1");
        } else if (act.equals("0")) {
            dbo.sharepost(id, "0");
        }
        response.sendRedirect("admin/index.jsp");
    } else out.print("未知错误");
%>
</body>
</html>
