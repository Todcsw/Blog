<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/6
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside th:fragment="sidebar-fragment(path)"  class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a th:href="@{/admin/index}" class="brand-link">
        <img src="admin/dist/img/logo.png" alt="ssm-cluster Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">my blog</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="admin/dist/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block" >${sessionScope.user.account}</a>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-header">Dashboard</li>
                <li class="nav-item">
                    <a href="IndexServlet" class='nav-link'>
                        <i class="nav-icon fa fa-dashboard"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="EditServlet" class='nav-link'>
                        <i class="nav-icon fa fa fa-pencil-square-o"></i>
                        <p>发布博客</p>
                    </a>
                </li>
                <li class="nav-header">管理模块</li>
                <li class="nav-item">
                    <a href="BlogServlet" class='nav-link'>
                        <i class="fa fa-list-alt nav-icon" aria-hidden="true"></i>
                        <p>博客管理</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="CategoryServlet" class='nav-link'>
                        <i class="fa fa-bookmark nav-icon" aria-hidden="true"></i>
                        <p>分类管理</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="TagServlet" class='nav-link'>
                        <i class="fa fa-tags nav-icon" aria-hidden="true"></i>
                        <p>标签管理</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="LinkServlet" class='nav-link'>
                        <i class="fa fa-heart nav-icon" aria-hidden="true"></i>
                        <p>友情链接</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="comment.jsp" class='nav-link'>
                        <i class="fa fa-comments nav-icon" aria-hidden="true"></i>
                        <p>评论管理</p>
                    </a>
                </li>
                <li class="nav-header">系统管理</li>
                <li class="nav-item">
                    <a href="ConfigurationServlet"
                       class='nav-link'>
                        <i class="fa fa-wrench nav-icon"></i>
                        <p>系统配置</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="InformationServlet"
                       class='nav-link'>
                        <i class="fa fa-wrench nav-icon"></i>
                        <p>信息配置</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="profile.jsp"
                       class='nav-link '>
                        <i class="fa fa-user-secret nav-icon"></i>
                        <p>修改密码</p>
                    </a>
                </li>
                <li class="nav-item" >
                    <a href="login.jsp?removeUser=removeUser"  class="nav-link">
                        <i class="fa fa-sign-out nav-icon"></i>
                        <p>安全退出</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
<script src="X-admin\js\jquery.min.js"></script>
<script>
    // $(function () {
    //     $("#removeUser").click(function () {
    //
    //     })
    // });
</script>