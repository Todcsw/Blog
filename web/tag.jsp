<%@ page import="com.csw.util.Page" %>
<%@ page import="com.csw.service.TagService" %>
<%@ page import="com.csw.service.impl.TagServiceImpl" %><%--
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
<%--        <link rel="stylesheet" href="X-admin/css/table.css"/>--%>
    <link rel="stylesheet" href="blog/css/pagination.css">
</head>
<%
    //分页
    //分页
    int start = 0;
    int count = 6;
    int pageNumber=1;
    try {

        pageNumber=Integer.parseInt(request.getParameter("page"));
        start = Integer.parseInt(request.getParameter("page.start"));
        count = Integer.parseInt(request.getParameter("page.count"));

    } catch (Exception e) {

    }
    TagService tagService=new TagServiceImpl();
    Page pageBreak = new Page(start, count,pageNumber);

    pageBreak.setTotal(tagService.selAllTagCount());

    request.setAttribute("pageBreak", pageBreak);
    request.setAttribute("ShowTagByPage", tagService.selTagByPage(pageBreak.ToStart(pageBreak.getPageNumber(),pageBreak.getCount()), pageBreak.getCount()));



%>
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


                        <div class="widget-body" style="padding-right: 0px;padding-left: 0px;">
                                                        <table class="table table-striped table-bordered" id="sample_1">
                                                            <thead>
                                                            <tr>
                                                                <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                                                                <th>标签名称</th>
                                                                <th class="hidden-phone">创建时间</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${requestScope.ShowTagByPage}" var="tag">
                                                                <tr class="odd gradeX">
                                                                    <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                                                    <td>${tag.name}</td>
                                                                    <td class="hidden-phone">${tag.createTime}</td>
                                                                    <td name="hiddenId" style="display: none" >${tag.id}</td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>



                            <nav id="pagination" style="margin-top: 1.7rem;">
                                <div class="pagination">
                                    <a class="extend prev" id="prevBlogPage" rel="prev" href="TagServlet?page=${pageBreak.pageNumber-1}">
                                        <i class="fa fa-fw fa-chevron-left" aria-hidden="true"></i>
                                    </a>
                                    <a id="FirstPage" class="page-number current" href="TagServlet?page=1">1</a>
                                    <c:forEach begin="2" end="3" step="1" varStatus="var">
                                        <a class="page-number" href="TagServlet?page=${var.current}">${var.current}</a>
                                    </c:forEach>

                                    <c:if test="${pageBreak.getTotalPage()>3&&pageBreak.pageNumber-2>3}">
                                        <a class="space"  >&hellip;</a>
                                    </c:if>

                                    <c:if test="${pageBreak.pageNumber>3}">

                                        <c:if test="${pageBreak.pageNumber!=4}" >
                                            <a class="page-number" href="TagServlet?page=${pageBreak.pageNumber-1}">${pageBreak.pageNumber-1}</a>
                                        </c:if>

                                        <c:if test="${pageBreak.getTotalPage()!=pageBreak.pageNumber}">
                                            <a class="page-number" href="TagServlet?page=${pageBreak.pageNumber}">${pageBreak.pageNumber}</a>
                                        </c:if>

                                        <c:if test="${pageBreak.getTotalPage()>pageBreak.pageNumber+1}">
                                            <a class="page-number" href="TagServlet?page=${pageBreak.pageNumber+1}">${pageBreak.pageNumber+1}</a>
                                        </c:if>

                                    </c:if>

                                    <c:if test="${pageBreak.getTotalPage()>3&&pageBreak.pageNumber!=pageBreak.getTotalPage()&&pageBreak.pageNumber+3<pageBreak.getTotalPage()}">
                                        <a class="space"  >&hellip;</a>
                                    </c:if>

                                    <c:if test="${pageBreak.getTotalPage()>3}">
                                        <a class="page-number" href="TagServlet?page=${pageBreak.getTotalPage()}">${pageBreak.getTotalPage()}</a>
                                    </c:if>
                                    <a class="extend next" id="nextBlogPage" rel="next" href="TagServlet?page=${pageBreak.pageNumber+1}">
                                        <i class="fa fa-fw fa-chevron-right" aria-hidden="true"></i>
                                    </a>

                                    <%--                    <input type="text" name="gotoPage" placeholder="请输入要跳转的页数">--%>
                                    <div class="pageJump">
                                        <span>跳转到</span>
                                        <input type="text" id="goToPage" name="goToPage" value=""/>
                                        <span>页</span>
                                        <button  type="button" class="button" onclick="goToPage()">确定</button>
                                    </div>
                                </div>



                            </nav>





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

    //跳转到指定页
    function goToPage() {

        var pageNum=$("#goToPage").val();

        pageNum=parseInt(pageNum);

        window.location.href="TagServlet?page="+pageNum;
    }


    //存储选中友链的id
    var idArray = [];

    function tagAdd() {
        if($("#tagName").val()==""||$("#tagName").val()==null){
            swal("标签名称不能为空", {
                icon: "error",
            });
            return;
        }

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
            text: "确认要删除id为[" + idArray + "]这些数据吗?",
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


        //得到=后的页码  分页
        var sub=(window.location+"").split("=");

        if(sub[1]!="1"){
            $("#FirstPage").removeClass("current");
        }

        if(sub[1]==undefined){
            $("#FirstPage").addClass("current");
        }
        //为改页码加入样式
        $(".pagination a").each(function () {
            if($(this).html()==sub[1]){
                $(this).addClass("current");
            }
        })

        if(sub[1]=="1"||sub[1]==undefined){
            $("#prevBlogPage").css("display","none");
        }

        if(sub[1]=="${pageBreak.getTotalPage()}"){
            $("#nextBlogPage").css("display","none");
        }


        $(".pagination a").each(function () {
            if(parseInt($(this).html())>parseInt("${pageBreak.getTotalPage()}")){
                $(this).css("display","none");
            }
        })


        $("ul.pagination li.disabled a").click(function () {
            return false;
        });
        //分页




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
