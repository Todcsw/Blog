<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/7
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--  引入所有需要用到的css  --%>
    <jsp:include page="index/css.jsp" />
</head>
<body class="hold-transition sidebar-mini">
<style>
    .ui-jqgrid tr.jqgrow td {
        white-space: normal !important;
        height: auto;
        vertical-align: text-top;
        padding-top: 2px;
    }
</style>
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
                        <h3 class="card-title">评论管理 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red;font-weight: bold;">该功能处于维护中</span></h3>
                    </div> <!-- /.card-body -->
                    <div class="card-body">
                        <div class="grid-btn">
                            <button class="btn btn-success" onclick="checkDoneComments()"><i
                                    class="fa fa-check"></i>&nbsp;批量审核
                            </button>
                            <button class="btn btn-info" onclick="reply()"><i
                                    class="fa fa-reply"></i>&nbsp;回复
                            </button>
                            <button class="btn btn-danger" onclick="deleteComments()"><i
                                    class="fa fa-trash-o"></i>&nbsp;批量删除
                            </button>
                        </div>
                        <!-- JqGrid必要DOM,用于创建表格展示列表数据 -->
                        <table id="jqGrid" class="table table-bordered"></table>
                        <!-- JqGrid必要DOM,分页信息区域 -->
                        <div id="jqGridPager"></div>
                    </div><!-- /.card-body -->
                </div>
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
        <div class="content">
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="replyModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h6 class="modal-title" id="replyModalLabel">评论回复</h6>
                        </div>
                        <div class="modal-body">
                            <form id="replyForm">
                                <input type="hidden" class="form-control" id="categoryId" name="categoryId">
                                <div class="form-group">
                                    <label for="replyBody" class="control-label">回复内容:</label>
                                    <textarea type="text" class="form-control" id="replyBody" name="replyBody"
                                              placeholder="请输入回复内容" required="true"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" id="saveButton">确认</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal -->
        </div>
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
<!-- AdminLTE App -->
<script src="admin/dist/js/adminlte.min.js"></script>
<!-- jquery App -->
<script src="admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="admin/plugins/jqgrid-5.3.0/grid.locale-cn.js"></script>
<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="admin/dist/js/public.js"></script>
<script src="admin/dist/js/comment.js"></script>
</body>
</html>