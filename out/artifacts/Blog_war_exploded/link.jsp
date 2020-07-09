<%@ page import="com.csw.entity.Link" %><%--
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
    <jsp:include page="index/css.jsp"/>
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
        <div class="content">
            <div class="container-fluid">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">友情链接管理</h3>
                    </div> <!-- /.card-body -->
                    <div class="card-body">
                        <div class="grid-btn">
                            <button class="btn btn-info" onclick="linkAdd()"><i
                                    class="fa fa-plus"></i>&nbsp;新增
                            </button>
                            <button class="btn btn-info" onclick="selLink()">
                                <i class="fa fa-pencil-square-o"></i>&nbsp;修改
                            </button>
                            <button class="btn btn-danger" onclick="deleteLink()"><i
                                    class="fa fa-trash-o"></i>&nbsp;删除
                            </button>
                        </div>

                        <div class="widget-body">
                            <table class="table table-striped table-bordered" id="sample_1">
                                <thead>
                                <tr>
                                    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                                    <th>友链名称</th>
                                    <th class="hidden-phone">友链介绍</th>
                                    <th class="hidden-phone">友情链接</th>
                                    <th class="hidden-phone">友链头像</th>
                                    <th class="hidden-phone">创建时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.linkList}" var="link">
                                <tr class="odd gradeX">
                                    <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                    <td>${link.name}</td>
                                    <td class="hidden-phone"><a href="mailto:jhone-doe@gmail.com">${link.introduce}</a></td>
                                    <td class="center hidden-phone">${link.url}</td>
                                    <td class="hidden-phone">${link.hphoto}</td>
                                    <td class="hidden-phone">${link.createTime}</td>
                                    <td name="hiddenId" style="display: none" >${link.id}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>



                    </div><!-- /.card-body -->
                </div>
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
        <div class="content">
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="linkModal" tabindex="-1" role="dialog" aria-labelledby="linkModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h6 class="modal-title" id="linkModalLabel">Modal</h6>
                        </div>
                        <div class="modal-body">
                            <form id="linkForm" action="LinkServlet" method="post" >
                                <input type="hidden" name="op" value="insLink">
                                <input type="hidden" name="linkId" value="">
                                <div class="form-group">
                                    <div class="alert alert-danger" id="edit-error-msg" style="display: none;">
                                        错误信息展示栏。
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="linkName" class="control-label">友链名称</label>
<%--                                    <select class="form-control" id="linkType" name="linkType">--%>
<%--                                        <option selected="selected" value="0">友链</option>--%>
<%--                                        <option value="1">推荐网站</option>--%>
<%--                                        <option value="2">个人链接</option>--%>
<%--                                    </select>--%>
                                    <input type="text" class="form-control" id="linkName" name="linkName"
                                           placeholder="请输入友链名称" required="true">
                                </div>
                                <div class="form-group">
                                    <label for="linkIntroduce" class="control-label">友链介绍:</label>
                                    <input type="text" class="form-control" id="linkIntroduce" name="linkIntroduce"
                                           placeholder="请输入友链介绍" required="true">
                                </div>
                                <div class="form-group">
                                    <label for="linkUrl" class="control-label">友情链接:</label>
                                    <input type="url" class="form-control" id="linkUrl" name="linkUrl"
                                           placeholder="请输入友情链接" required="true">
                                </div>
                                <div class="form-group">
                                    <label for="linkHphoto" class="control-label">友链头像:</label>
                                    <input type="url" class="form-control" id="linkHphoto" name="linkHphoto"
                                           placeholder="请输入友链头像链接" required="true">
                                </div>
<%--                                <div class="form-group">--%>
<%--                                    <label for="linkRank" class="control-label">排序值:</label>--%>
<%--                                    <input type="number" class="form-control" id="linkRank" name="linkRank"--%>
<%--                                           placeholder="请输入排序值" required="true">--%>
<%--                                </div>--%>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary" id="saveButton">确认</button>
                        </div>
                        </div>
                        </form>
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
<script src="admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="admin/plugins/jqgrid-5.3.0/grid.locale-cn.js"></script>
<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="admin/dist/js/public.js"></script>
<%--<script src="admin/dist/js/link.js"></script>--%>
<script defer id="ribbon" src="admin/dist/js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1" mobile="true"
        data-click="false">
</script>
<script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true" src="admin/dist/js/third-party/canvas-nest.js">
</script>
<script>


    //存储选中友链的id
    var idArray=[];


    $(".btn-default").click(function () {
       $("input:hidden[name='op']").val("insLink");
    })

    // $("#saveButton").click(function () {
    //     $("input:hidden[name='op']").val("insLink");
    // })

    function linkAdd() {
        $("input:hidden[name='op']").val("insLink");
        reset();
        $('.modal-title').html('友链添加');
        $('#linkModal').modal('show');
    }

    //重置模态框
    function reset() {
        $("#linkName").val('');
        $("#linkUrl").val('');
        $("#linkHphoto").val('');
        $("#linkIntroduce").val('');
        $('#edit-error-msg').css("display", "none");
        $("#linkType option:first").prop("selected", 'selected');
    }

    /**
     * 查询友情链接
     */
    function selLink() {
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
        $("input:hidden[name='op']").val("selLink");
        $("input:hidden[name='linkId']").val(idArray[0]);
        $("#linkForm").submit();
    }

    function deleteLink() {

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
                    $("input:hidden[name='op']").val("delLink");
                    $("input:hidden[name='linkId']").val(idArray);
                    $("#linkForm").submit();
                }else{
                    $("input:hidden[name='op']").val("insLink");
                }
            }
        );
    }



    $(function () {

        /**
         * 修改友情链接
         */
        if("${sessionScope.show}"=="true"){
            $("input:hidden[name='op']").val("updLink");
            $('.modal-title').html('友链修改');
            $("#linkName").val("${sessionScope.link.name}");
            $("#linkIntroduce").val("${sessionScope.link.introduce}");
            $("#linkUrl").val("${sessionScope.link.url}");
            $("#linkHphoto").val("${sessionScope.link.hphoto}");
            $('#linkModal').modal('show');
        };


        /**
         * 存储选中友链的id
         */
        $('.checkboxes').click(function () {
            if ($(this).prop("checked")) {
                idArray.push(parseInt($(this).parent().parent().find("td:eq(6)").html()))
            } else {
                var i=parseInt($(this).parent().parent().find("td:eq(6)").html());
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
    request.getSession().setAttribute("show","");
    request.getSession().setAttribute("link",new Link());
%>
</body>
</html>
