<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/7
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--  引入所有需要用到的css  --%>
    <jsp:include page="index/css.jsp" />

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- 引入页面头header.jsp -->
    <jsp:include page="index/header.jsp" />

    <!-- 引入工具栏left.jsp -->
    <jsp:include page="index/left.jsp" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
            </div><!-- /.container-fluid -->
        </div>
        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">test</h3>
                    </div> <!-- /.card-body -->
                    <div class="card-body">
                        <div class="grid-btn">
                            <button class="btn btn-file" id="uploadButton"><i
                                    class="fa fa-upload"></i>&nbsp;上传图片
                            </button>
                        </div>
                        <div class="panel panel-default">
                            <div style="padding: 10px 0 20px 10px;">
                                <h3>&nbsp;&nbsp;&nbsp;test</h3>
                                <br>
                                <p>&nbsp;&nbsp;&nbsp;test页面</p>
                                <img id="img" src="##">
                            </div>

                        </div>
                    </div><!-- /.card-body -->
                </div>
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- 引入页脚footer-fragment -->
    <div th:replace="admin/footer::footer-fragment"></div>
</div>
<!-- jQuery -->
<script src="admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="admin/plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="admin/plugins/ajaxupload/ajaxupload.js"></script>
<!-- AdminLTE App -->
<script src="admin/dist/js/adminlte.min.js"></script>
<script src="admin/dist/js/test.js"></script>
</body>
</html>

