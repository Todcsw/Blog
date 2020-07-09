<%@ page import="com.csw.entity.Blog" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/6
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="author" content="order by dede58.com"/>
    <title>my personal blog | 后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <link href="admin/dist/js/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="admin/dist/js/plugins/bootstrap/css/bootstrap-fileupload.css" rel="stylesheet"/>
    <link href="admin/dist/css/todcsw.css" rel="stylesheet"/>
    <%--  引入所有需要用到的css  --%>
    <jsp:include page="index/css.jsp"/>
    <style>
        .editormd-dialog-container select {
            display: initial;
        }
    </style>
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- 引入页面头header.jsp -->
    <jsp:include page="index/header.jsp"/>

    <!-- 引入工具栏left.jsp -->
    <jsp:include page="index/left.jsp"/>

    <!-- Content Wrapper. Contains page content -->

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
            </div><!-- /.container-fluid -->
        </div>
        <!-- Main content -->
        <form id="blogForm" method="post" action="EditServlet" enctype="multipart/form-data">
            <div class="content">
                <div class="container-fluid">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">发布文章</h3>
                        </div>
                        <div class="card-body">
                            <!-- 几个基础的输入框，名称、分类等输入框 -->

                            <div class="form-group" style="display:flex;">

                                <input type="hidden" name="op" value="">
                                <input type="hidden" id="blogId" name="blogId" value="${sessionScope.blog.id}">
                                <input type="hidden" name="blogContentEdit" value="${sessionScope.blog.content}">
                                <input type="hidden" name="uploadTime" value="${sessionScope.blog.uploadTime}">
                                <input type="hidden" name="view" value="${sessionScope.blog.view}">
                                <input type="hidden" name="photo" value="${sessionScope.blog.photo}">
                                <input type="hidden" name="catalog" value="${sessionScope.blog.catalog}">
                                <input type="text" class ="form-control col-sm-6" placeholder="请输入文章标题" id="blogName" name="blogName" >
                                <input style="display: none" type="text" class="form-control col-sm-6" id="blogName2" name="blogName2" placeholder="*请输入文章标题(必填)"  required="true">
                                <input type="text" class="form-control" id="blogTags" name="blogTags" placeholder="请输入文章标签" value="${sessionScope.blog.tags}" style="width: 100%;">

                            </div>
                            <div class="form-group" style="display:flex;">
                                <select class="form-control select2" style="width: 100%;" id="blogCategoryId"
                                        data-placeholder="请选择分类...">
                                    <c:forEach items="${sessionScope.categorys}" var="category1">
                                        <option value="${category1.name}">${category1.name}</option>
                                    </c:forEach>

                                </select>
                            </div>
                            <div class="form-group" id="blog-editormd">
                                <textarea style="display:none;" name="blogContent">### Hello Editor.md !</textarea>
                            </div>

                            <div class="form-group">
                                <!-- 按钮 -->
                                &nbsp;<button class="btn btn-info float-right" style="margin-left: 5px;"
                                              id="confirmButton">保存文章
                            </button>&nbsp;
                                &nbsp;<button class="btn btn-secondary float-right" style="margin-left: 5px;"
                                              id="cancelButton" onclick="forward()">返回文章列表
                            </button>&nbsp;
                            </div>

                        </div>

                    </div>
                </div><!-- /.container-fluid -->


            </div>

            <div class="content">
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="articleModal" tabindex="-1" role="dialog"
                     aria-labelledby="articleModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h6 class="modal-title" id="articleModalLabel">信息完善</h6>
                            </div>
                            <div class="modal-body" style="padding: 0px">
                                <div class="control-group">
                                    <div class="controls">

                                        <div class="bb">上传文章封面</div>

                                        <div data-provides="fileupload" class="fileupload fileupload-new">
                                            <div style="width: 200px; height: 200px;margin-left: 50px"
                                                 class="fileupload-new thumbnail ">
                                                <img alt=""
                                                     src="http://www.placehold.it/200x200/EFEFEF/AAAAAA&amp;text=no+image">
                                            </div>
                                            <div style="max-width: 450px; max-height: 300px;margin: 0px ; line-height: 20px;"
                                                 class="bb1 fileupload-preview fileupload-exists thumbnail"></div>
                                            <div>
                                                        <span class="btn btn-file">
                                                            <span class="fileupload-new btn btn-primary">选择封面</span>
                                                            <span class="btn btn-primary fileupload-exists">更改</span>
                                                            <input type="file" class="default" name="file1" id="file1">
                                                        </span>

                                                <a data-dismiss="fileupload" class="btn fileupload-exists btn-default"
                                                   href="#">去除</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

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
    </form>



    </div>


    <!-- /.content-wrapper -->
    <!-- 引入页脚footer.jsp -->
    <jsp:include page="index/footer.jsp"/>
</div>
<!-- jQuery -->
<script type="text/javascript" src="X-admin/js/jquery.min.js"></script>
<script type="text/javascript" src="X-admin/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="X-admin/js/xadmin.js" charset="utf-8"></script>
<script type="text/javascript" src="X-admin/js/formSelects-v4.min.js" charset="utf-8"></script>

<%--<!--[if lt IE 9]>--%>

<script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
<script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>

<![endif]-->
<!-- jQuery -->
<script src="admin/plugins/jquery/jquery.min.js"></script>
<%--<!-- jQuery UI 1.11.4 -->--%>
<script src="admin/plugins/jQueryUI/jquery-ui.min.js"></script>
<%--<!-- Bootstrap 4 -->--%>
<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="admin/dist/js/adminlte.min.js"></script>
<!-- editor.md -->
<%--<script src="admin/plugins/editormd/editormd.min.js"></script>--%>
<!-- tagsinput -->
<script src="admin/plugins/tagsinput/jquery.tagsinput.min.js"></script>
<!-- Select2 -->
<script src="admin/plugins/select2/select2.full.min.js"></script>
<!-- sweetalert -->


<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<!-- ajaxupload -->
<script src="admin/plugins/ajaxupload/ajaxupload.js"></script>

<script src="admin/dist/js/public.js"></script>

<!-- editor.md -->
<script type="text/javascript" src="X-admin/editormd/src/editormd.js"></script>
<%--弹框等js--%>
<script type="text/javascript" src="admin/dist/js/edit2.js"></script>

<%--文件上传--%>
<script type="text/javascript" src="admin/dist/js/plugins/bootstrap/js/bootstrap-fileupload.js"></script>
<script>



    function forward() {
        window.location.href = "BlogServlet";
    }

    $(function () {

        $("#confirmButton").click(function () {
            $("#articleModal").modal("show");
        })


        $("#saveButton").click(function () {
            if ($("input:hidden[name='blogId']").val() == "0" || $("input:hidden[name='blogId']").val() == 0) {

                //新增博客
                $(".form-group input:hidden[name='op']").val("insBlog");
                $("#blogName").val($("#blogName").val());
                $("#blogTags").val($("#blogTags").val());
                $("input:hidden[name='catalog']").val($(":selected").val());
                $("input:hidden[name='blogContentEdit']").val($(".editormd-markdown-textarea").html());
                $("#blogForm").submit();


            } else {

                // 修改博客
                $("#blogName").val($("#blogName").val());
                $("#blogTags").val($("#blogTags").val());
                $("input:hidden[name='catalog']").val($(":selected").val());
                $("input:hidden[name='blogContentEdit']").val($(".editormd-markdown-textarea").html());
                $("input:hidden[name='op']").val("updBlogById");
                $("#blogForm").submit();
            }
        })


        $("#blogName").val("${sessionScope.blog.title}");
        $(".blogId").val($("input:hidden[name='blogId']").val());


        $("#blogCategoryId option").each(function () {  //遍历所有option
            var channlVal = $(this).val();   //获取option值
            if (channlVal == $("input:hidden[name='catalog']").val()) {
                $(this).prop("selected", true);
            }
        })



        $(".editormd-markdown-textarea").val($("input:hidden[name='blogContentEdit']").val());
    })


</script>
<%
    request.getSession().setAttribute("blog", new Blog());
%>
</body>
</html>
