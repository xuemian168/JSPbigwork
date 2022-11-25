<%@ page import="cn.edu.hziee.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/11/23
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dbo" class="cn.edu.hziee.utils.DBUtils"></jsp:useBean>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet"/>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<html>
<head>
    <title>笔记编辑</title>
<body>
    <%
    Object user = session.getAttribute("user");
    if (user !=null) {
        User user1 = (User) user;
%>
    <%
    String id = request.getParameter("id");
    if (id != null) {
        String[] field = {"postid", "username", "contents"};
        List<String[]> vec = dbo.getaData(field, "select * from contents where postid=" + id);
        for (int i = 0; i < vec.size(); i++) {
            String ss[] = vec.get(i);
%>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3" href="index.html">笔记管理系统后台</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
            class="fas fa-bars"></i></button>
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="搜索功能..." aria-label="搜索功能..."
                   aria-describedby="btnNavbarSearch"/>
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- 顶部-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
               aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">账户设置</a></li>
                <li><a class="dropdown-item" href="#">登录日志</a></li>
                <li>
                    <hr class="dropdown-divider"/>
                </li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout.jsp">注销</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">状态</div>
                    <a class="nav-link" href="index.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        仪表盘
                    </a>
                    <div class="sb-sidenav-menu-heading">编辑</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts"
                       aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        功能一
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="#">功能1</a>
                            <a class="nav-link" href="#">功能2</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
                       aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                        内容
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                         data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                               aria-controls="pagesCollapseAuth">
                                文章管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                 data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">新建文章</a>
                                    <a class="nav-link" href="#">编辑文章</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                               data-bs-target="#pagesCollapseError" aria-expanded="false"
                               aria-controls="pagesCollapseError">
                                Error
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                 data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">401 Page</a>
                                    <a class="nav-link" href="#">404 Page</a>
                                    <a class="nav-link" href="#">500 Page</a>
                                </nav>
                            </div>
                        </nav>
                    </div>
                    <div class="sb-sidenav-menu-heading">审查</div>
                    <a class="nav-link" href="index.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        报表
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">当前身份：</div>
                <%=user1.getUserName()%>
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">笔记编辑器</li>
                </ol>
                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card mb-4">
                            <div class="card-body">
                                <main>
                                    <h1>正在编辑第<%=id%>笔记</h1>
                                    <form method="post" action="edit.do">
                                        <div class="mb-3">
                                            <input type="text" value="<%=id%>" id="id" name="id" readonly>
                                            <label for="content" class="form-label">笔记内容:</label>
                                            <textarea name="content" width="30px" height="80px"
                                                      id="content" class="form-control" rows="4"><%=ss[2]%></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">提交笔记</button>
                                    </form>
                                </main>
                            </div>
                        </div>
                    </div>
                </div>
                    <%}}else{out.print("session有误");}%>
                    <%} else out.print("未知错误");%>

                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; XueMian168.Com</div>
                            <div>
                                <a href="#">用户协议</a>
                                ·
                                <a href="#"><%=request.getSession()%>
                                </a>
                            </div>
                        </div>
                    </div>
                </footer>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                <script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                        crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
                <script src="${pageContext.request.contextPath}/admin/js/datatables-simple-demo.js"></script>
</body>
</html>
