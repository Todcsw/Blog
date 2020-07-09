<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/6
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-header navbar navbar-expand bg-white navbar-light border-bottom"  >
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="IndexServlet" class="nav-link">Dashboard</a>
        </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
            <a class="nav-link" href="blog/index.jsp">
                <i class="fa fa-paper-plane">博客首页</i>
            </a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="fa fa-user">&nbsp;&nbsp;作者</i>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fa fa-lock mr-2"></i> 账号
                    <span class="float-right text-muted text-sm">${sessionScope.user.account}</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fa fa-user-secret mr-2"></i>身份
                    <span class="float-right text-muted text-sm">${sessionScope.user.identify}</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                    <i class="fa fa-info-circle mr-2"></i> 登陆时间
                    <span class="float-right text-muted text-sm" id="loginTime"></span>
                </a>
            </div>
        </li>
    </ul>
</div>
<script>
    // $(function () {
    //
    // })

</script>
