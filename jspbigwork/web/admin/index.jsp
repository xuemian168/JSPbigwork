<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/11/25
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="cn.edu.hziee.model.User" %>
<%@ page import="java.util.List" %>
<%@ page pageEncoding="utf-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dbo" class="cn.edu.hziee.utils.DBUtils"></jsp:useBean>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>HHX笔记管理平台</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/admin/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<style>
    a{
        color: black;
        text-decoration: none;
    }
    td{
        padding: 15px;
    }
</style>
<%
    Object user = session.getAttribute("user");
    if (user !=null) {
        User user1 = (User) user;
%>

<%
    String username = user1.getUserName();
    System.out.println("用户名:" + username);
    boolean isadmin;
    if (("admin".equals(username))) isadmin = true;
    else isadmin = false;
    System.out.println(isadmin);
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
                <h1 class="mt-4">笔记仪表盘</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Notepad Dashboard</li>
                </ol>
                <div class="row">
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-info text-white mb-4">
                            <div class="card-body">一般日志</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">查看详情</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card bg-warning text-white mb-4">
                            <div class="card-body">告警日志</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="#">查看详情</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                提交笔记
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/post.do" method="post">
                                    <div class="mb-3">
                                        <%if (isadmin) {%>
                                        <input type="text" id="username" name="username" class="form-control"
                                               value="<%=username%>"><br>
                                        <%} else {%>
                                        <input type="text" readonly="readonly" hidden name="username" id="username"
                                               class="form-control"
                                               value="<%=username%>"><br>
                                        <%}%>
                                    </div>
                                    <div class="mb-3">
                                        <label for="content" class="form-label">笔记内容:</label>
                                        <textarea name="content" width="30px" height="80px"
                                                  id="content" class="form-control" rows="5"></textarea>
                                    </div>
                                    <br>
                                    <button type="submit" class="btn btn-primary">提交笔记</button>
                                </form>
                                <canvas width="100%" height="40">
                                </canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                            </div>
                            <div class="card-body">
                                <%
                                    String[] field = {"postid", "username", "contents","share"};
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
                                <div class="table">
                                    <table width="500" height="161" border="0" cellpadding="0" cellspacing="1">
                                        <tr class="table-primary">
                                            <td>ID</td>
                                            <td width="337" height="25"> 【<%=ss[0]%>】</td>
                                            <td>
                                                <%if (ss[3].equals("0")){%>
                                                    <a href="${pageContext.request.contextPath}/share.jsp?id=<%=ss[0]%>&act=1">分享</a>
                                                <%}else if (ss[3].equals("1")){%>
                                                    <a href="${pageContext.request.contextPath}/share.jsp?id=<%=ss[0]%>&act=0">取消分享</a>
                                                <%}%>
                                            </td>
                                        </tr>
                                        <tr class="table-info">
                                            <td width="20">用户名</td>
                                            <td width="337" height="25"> 【<%=ss[1]%>】</td>
                                            <td width="35"><a href="${pageContext.request.contextPath}/postmgt.jsp?id=<%=ss[0]%>">修改这条</a></td>
                                        </tr>
                                        <tr>
                                            <td>笔记</td>
                                            <td height="100">【<%=ss[2]%>】</td>
                                            <td width="20" rowspan="3"><a href="${pageContext.request.contextPath}/del.jsp?act=<%=ss[0]%>">删除这条</a></td>
                                        </tr>
                                    </table>
                                </div>
                                <%
                                    }
                                %>
                                <canvas width="100%" height="40"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; XueMian168.Com</div>
                    <div>
                        <a href="#">用户协议</a>
                        ·
                        <a href="#"><%=request.getSession()%></a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<%
    } else {
        System.out.println("session 获取失败");
        System.out.println(request.getSession());
        response.sendRedirect(request.getContextPath()+"/login.jsp");
        return;
    }
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/admin/js/datatables-simple-demo.js"></script>
</body>
</html>

