<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/11/23
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dbo" class="cn.edu.hziee.utils.DBUtils"></jsp:useBean>
<html>
<head>
    <title>笔记编辑</title>
<body>
<%
    String id = request.getParameter("id");
    if (id != null) {
        String[] field = {"postid", "username", "contents"};
        List<String[]> vec = dbo.getaData(field, "select * from contents where postid=" + id);
        for (int i = 0; i < vec.size(); i++) {
            String ss[] = vec.get(i);
%>
<h1>正在编辑第<%=id%>笔记</h1>
<form method="post" action="edit.do">
    <p><h3>原内容</h3></p>
    <%=ss[2]%><br>
    <input type="hidden" name="id" id="id" value="<%=ss[0]%>">
    <p><h3>新内容</h3></p>
    <input type="text" name="new" id="new" placeholder="在次输入新内容">
    <input type="submit">
</form>
<%}%>
<%} else out.print("未知错误");%>
</body>
</html>
