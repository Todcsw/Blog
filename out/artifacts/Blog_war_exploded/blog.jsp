<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/7
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <h3 class="card-title">博客管理</h3>
                    </div> <!-- /.card-body -->
                    <div class="card-body">
                        <div class="grid-btn">
                            <button class="btn btn-success" onclick="addBlog()"><i
                                    class="fa fa-plus"></i>&nbsp;新增
                            </button>
                            <button class="btn btn-info" onclick="editBlog()"><i
                                    class="fa fa-edit"></i>&nbsp;修改
                            </button>
                            <button class="btn btn-danger" onclick="deleteBlog()"><i
                                    class="fa fa-trash-o"></i>&nbsp;删除
                            </button>&nbsp;&nbsp;
                            <input type="text" placeholder="关键字(标题/分类)" id="keyword" class="form-control col-2">&nbsp;
                            <button class="btn btn-info" onclick="search()"><i
                                    class="fa fa-search"></i>&nbsp;搜索
                            </button>
                        </div>




                        <div class="widget-body">
                            <table class="table table-striped table-bordered" id="sample_1">
                                <thead>
                                <tr>
                                    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                                    <th>博客标题</th>
                                    <th class="hidden-phone">封面图</th>
                                    <th class="hidden-phone">浏览量</th>
                                    <th class="hidden-phone">博客分类</th>
                                    <th class="hidden-phone">博客标签</th>
                                    <th class="hidden-phone">创建时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.blogList}" var="blog">
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>${blog.title}</td>
                                        <td class="hidden-phone"><img style="width: 100px;height:100px" src="${blog.photo}"></img></td>
                                        <td class="center hidden-phone">${blog.view}</td>
                                        <td class="hidden-phone">${blog.catalog}</td>
                                        <td class="hidden-phone">${blog.tags}</td>
                                        <td class="hidden-phone">${blog.uploadTime}</td>
                                        <td name="hiddenId" style="display: none" >${blog.id}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <form id="blogForm" action="BlogServlet" method="post">
                            <input type="hidden" name="op" value="">
                            <input type="hidden" name="blogId" value="">
                        </form>


                    </div><!-- /.card-body -->
                </div>
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- 引入页脚footer-fragment -->
    <div replace="footer::footer-fragment"></div>
</div>
<!-- jQuery -->
<script src="admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="admin/plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- Bootstrap 4 -->
<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="admin/dist/js/adminlte.min.js"></script>
<!-- jqgrid -->
<script src="admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="admin/plugins/jqgrid-5.3.0/grid.locale-cn.js"></script>
<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="admin/dist/js/public.js"></script>
<%--<script src="admin/dist/js/blog.js"></script>--%>
<script>

    //存储选中友链的id
    var idArray=[];

    function editBlog(){
        if(idArray=="null"||idArray==null||idArray=="undefined"||idArray==undefined||idArray.length==0){
            swal("请选择一个进行修改", {
                icon: "error",
            });
            return;
        }

        if(idArray.length>1){
            swal("只能选择一个进行修改", {
                icon: "error",
            });
            return;
        }
        $("input:hidden[name='op']").val("updBlog");
        $("input:hidden[name='blogId']").val(idArray[0]);
        $("#blogForm").submit();
    }

    function addBlog() {
        $("input:hidden[name='op']").val("insBlog");
        $("#blogForm").submit();
    }



    function deleteBlog(){

        if(idArray=="null"||idArray==null||idArray=="undefined"||idArray==undefined||idArray.length==0){
            swal("请选择要删除的数据", {
                icon: "error",
            });
            return;
        }

        swal({
            title: "确认弹框",
            text: "确认要删除"+idArray+"这些数据吗?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((flag) => {
                if (flag) {
                    $("input:hidden[name='op']").val("delBlog");
                    $("input:hidden[name='blogId']").val(idArray);
                    $("#blogForm").submit();
                }else{
                    $("input:hidden[name='op']").val("");
                }
            }
        );

    }

    $(function () {

        /**
         * 存储选中友链的id
         */
        $('.checkboxes').click(function () {
            if ($(this).prop("checked")) {
                idArray.push(parseInt($(this).parent().parent().find("td:eq(7)").html()))
            } else {
                var i=parseInt($(this).parent().parent().find("td:eq(7)").html());
                idArray.splice($.inArray(i,idArray),1);
            }
        })

        if("${sessionScope.MSG}"==200){
            swal("保存成功", {
                icon: "success",
            });
        }else if("${sessionScope.MSG}"==201){
            swal("操作失败", {
                icon: "error",
            });
        }


    })
</script>
<%
    request.getSession().setAttribute("MSG","");
%>
</body>
</html>
