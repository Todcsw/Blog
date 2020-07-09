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
    <jsp:include page="index/css.jsp"/>
    <%--       表格 --%>
        <link rel="stylesheet" href="X-admin/css/table.css"/>
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
        <div class="content">
            <div class="container-fluid">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">标签管理</h3>
                    </div> <!-- /.card-body -->
                    <div class="card-body">
                        <form id="tagForm" method="post" action="TagServlet">
                            <div class="grid-btn">

                                <input type="hidden" name="op" value="">
                                <input type="hidden" name="tagId" value="">
                                <input type="text" class="form-control col-1" id="tagName" name="tagName"
                                       placeholder="标签名称" required="true">&nbsp;&nbsp;&nbsp;

                                <button class="btn btn-info" onclick="tagAdd()"><i
                                        class="fa fa-plus"></i>&nbsp;新增
                                </button>

                                <button class="btn btn-danger" onclick="deleteTag()"><i
                                        class="fa fa-trash-o"></i>&nbsp;删除
                                </button>
                            </div>
                        </form>


                        <div class="widget-body" style="padding-right: 0px;
    padding-left: 0px;">
                            <%--                            <table class="table table-striped table-bordered" id="sample_1">--%>
                            <%--                                <thead>--%>
                            <%--                                <tr>--%>
                            <%--                                    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>--%>
                            <%--                                    <th>标签名称</th>--%>
                            <%--                                    <th class="hidden-phone">创建时间</th>--%>
                            <%--                                </tr>--%>
                            <%--                                </thead>--%>
                            <%--                                <tbody>--%>
                            <%--                                <c:forEach items="${requestScope.tagList}" var="tag">--%>
                            <%--                                    <tr class="odd gradeX">--%>
                            <%--                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>--%>
                            <%--                                        <td>${tag.name}</td>--%>
                            <%--                                        <td class="hidden-phone">${tag.createTime}</td>--%>
                            <%--                                        <td name="hiddenId" style="display: none" >${tag.id}</td>--%>
                            <%--                                    </tr>--%>
                            <%--                                </c:forEach>--%>
                            <%--                                </tbody>--%>
                            <%--                            </table>--%>
                            <div class="box">
                                <%--        <div class="box-header">--%>
                                <%--            <h3 class="box-title">Data Table With Full Features</h3>--%>
                                <%--        </div><!-- /.box-header -->--%>
                                <div class="box-body">
                                    <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table id="example1"
                                                       class="table table-bordered table-striped dataTable" role="grid"
                                                       aria-describedby="example1_info">
                                                    <thead>
                                                    <tr role="row">
                                                        <th class="sorting_asc" tabindex="0" aria-controls="example1"
                                                            rowspan="1" colspan="1" aria-sort="ascending"
                                                            aria-label="Rendering engine: activate to sort column descending"
                                                            style="width: 216px;">Rendering engine
                                                        </th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1"
                                                            rowspan="1" colspan="1"
                                                            aria-label="Browser: activate to sort column ascending"
                                                            style="width: 266px;">Browser
                                                        </th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1"
                                                            rowspan="1" colspan="1"
                                                            aria-label="Platform(s): activate to sort column ascending"
                                                            style="width: 235px;">Platform(s)
                                                        </th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1"
                                                            rowspan="1" colspan="1"
                                                            aria-label="Engine version: activate to sort column ascending"
                                                            style="width: 186px;">Engine version
                                                        </th>
                                                        <th class="sorting" tabindex="0" aria-controls="example1"
                                                            rowspan="1" colspan="1"
                                                            aria-label="CSS grade: activate to sort column ascending"
                                                            style="width: 135px;">CSS grade
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Firefox 1.0</td>
                                                        <td>Win 98+ / OSX.2+</td>
                                                        <td>1.7</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Firefox 1.5</td>
                                                        <td>Win 98+ / OSX.2+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Firefox 2.0</td>
                                                        <td>Win 98+ / OSX.2+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Firefox 3.0</td>
                                                        <td>Win 2k+ / OSX.3+</td>
                                                        <td>1.9</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Camino 1.0</td>
                                                        <td>OSX.2+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Camino 1.5</td>
                                                        <td>OSX.3+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Netscape 7.2</td>
                                                        <td>Win 95+ / Mac OS 8.6-9.2</td>
                                                        <td>1.7</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Netscape Browser 8</td>
                                                        <td>Win 98SE+</td>
                                                        <td>1.7</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="odd">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Netscape Navigator 9</td>
                                                        <td>Win 98+ / OSX.2+</td>
                                                        <td>1.8</td>
                                                        <td>A</td>
                                                    </tr>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1">Gecko</td>
                                                        <td>Mozilla 1.0</td>
                                                        <td>Win 95+ / OSX.1+</td>
                                                        <td>1</td>
                                                        <td>A</td>
                                                    </tr>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <th rowspan="1" colspan="1">Rendering engine</th>
                                                        <th rowspan="1" colspan="1">Browser</th>
                                                        <th rowspan="1" colspan="1">Platform(s)</th>
                                                        <th rowspan="1" colspan="1">Engine version</th>
                                                        <th rowspan="1" colspan="1">CSS grade</th>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="row"
                                             style="margin-right: 17px;margin-left: -14px;margin-top: 0px;box-sizing: border-box;">
                                            <div class="col-sm-5" style="width: 688px">
                                                <div class="dataTables_info" id="example1_info" role="status"
                                                     aria-live="polite">Showing 1 to 10 of 57 entries
                                                </div>
                                            </div>
                                            <div class="col-sm-7">
                                                <div class="dataTables_paginate paging_simple_numbers"
                                                     id="example1_paginate">
                                                    <ul class="pagination">
                                                        <li class="paginate_button previous disabled"
                                                            id="example1_previous">
                                                            <a href="#" aria-controls="example1" data-dt-idx="0"
                                                               tabindex="0">Previous</a>
                                                        </li>
                                                        <li class="paginate_button active">
                                                            <a href="#" aria-controls="example1" data-dt-idx="1"
                                                               tabindex="0">1</a>
                                                        </li>
                                                        <li class="paginate_button ">
                                                            <a href="#" aria-controls="example1" data-dt-idx="2"
                                                               tabindex="0">2</a>
                                                        </li>
                                                        <li class="paginate_button ">
                                                            <a href="#" aria-controls="example1" data-dt-idx="3"
                                                               tabindex="0">3</a>
                                                        </li>
                                                        <li class="paginate_button "><a href="#"
                                                                                        aria-controls="example1"
                                                                                        data-dt-idx="4"
                                                                                        tabindex="0">4</a></li>
                                                        <li class="paginate_button "><a href="#"
                                                                                        aria-controls="example1"
                                                                                        data-dt-idx="5"
                                                                                        tabindex="0">5</a></li>
                                                        <li class="paginate_button "><a href="#"
                                                                                        aria-controls="example1"
                                                                                        data-dt-idx="6"
                                                                                        tabindex="0">6</a></li>
                                                        <li class="paginate_button next" id="example1_next"><a href="#"
                                                                                                               aria-controls="example1"
                                                                                                               data-dt-idx="7"
                                                                                                               tabindex="0">Next</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.box-body -->
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
<!-- AdminLTE App -->
<script src="admin/dist/js/adminlte.min.js"></script>
<!-- jqgrid -->
<script src="admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="admin/plugins/jqgrid-5.3.0/grid.locale-cn.js"></script>
<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="admin/dist/js/public.js"></script>
<%--<script src="admin/dist/js/tag.js"></script>--%>


<script>

    //存储选中友链的id
    var idArray = [];

    function tagAdd() {
        $("input:hidden[name='op']").val("insTag");
        $("#tagForm").submit();
    }

    function deleteTag() {

        if (idArray == "null" || idArray == null || idArray == "undefined" || idArray == undefined || idArray.length == 0) {
            swal("请选择要删除的数据", {
                icon: "error",
            });
            return;
        }

        swal({
            title: "确认弹框",
            text: "确认要删除编号:" + idArray + "这些数据吗?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((flag) => {
                if (flag) {
                    $("input:hidden[name='op']").val("delTag");
                    $("input:hidden[name='tagId']").val(idArray);
                    $("#tagForm").submit();
                } else {
                    $("input:hidden[name='op']").val();
                }
            }
        );
    }

    $(function () {
        $("#tagName").val("");

        /**
         * 存储选中友链的id
         */
        $('.checkboxes').click(function () {
            if ($(this).prop("checked")) {
                idArray.push(parseInt($(this).parent().parent().find("td:eq(3)").html()))
            } else {
                var i = parseInt($(this).parent().parent().find("td:eq(3)").html());
                idArray.splice($.inArray(i, idArray), 1);
            }
        })


        if ("${sessionScope.MSG}" == 200) {
            swal("保存成功", {
                icon: "success",
            });
        } else if ("${sessionScope.MSG}" == 201) {
            swal("操作失败", {
                icon: "error",
            });
        }
    })


</script>

<%
    request.getSession().setAttribute("MSG", "");
%>
</body>
</html>
