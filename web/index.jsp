<%@ page import="com.csw.entity.Blog" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/6
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="order by dede58.com" />
    <title>my personal blog | 后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
    <%--  引入head  --%>
    <jsp:include page="index/css.jsp" />
    <%--彩带--%>


</head>


<body class="hold-transition sidebar-mini">

<div class="wrapper">
    <!-- 引入页面头header-fragment -->
    <jsp:include page="index/header.jsp" />

    <!-- 引入工具栏sidebar-fragment -->
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
                <div class="card-header">
                    <h3 class="card-title">管理首页</h3>
                </div> <!-- /.card-body -->
                <div class="row" style="margin-top: 40px;border-top:0px;">
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>新增博客</h3>
                                <p>记心中所想</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-pencil-square-o"></i>
                            </div>
                            <a href="EditServlet" class="small-box-footer">let's go <i
                                    class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>${requestScope.counts[0]}</h3>
                                <p>总文章数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-list-alt"></i>
                            </div>
                            <a href="BlogServlet" class="small-box-footer">More info <i
                                    class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-primary">
                            <div class="inner">
                                <h3>功能维护中</h3>
                                <p>收到评论数</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-comments"></i>
                            </div>
                            <a href="comment.jsp" class="small-box-footer">More info <i
                                    class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>${requestScope.counts[1]}</h3>
                                <p>分类数量</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-bookmark"></i>
                            </div>
                            <a href="CategoryServlet" class="small-box-footer">More info <i
                                    class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3 >${requestScope.counts[2]}</h3>
                                <p>标签总量</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-tags"></i>
                            </div>
                            <a href="TagServlet" class="small-box-footer">More info <i
                                    class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-4 col-6">
                        <!-- small box -->
                        <div class="small-box bg-dark">
                            <div class="inner">
                                <h3>${requestScope.counts[3]}</h3>
                                <p>友情链接</p>
                            </div>
                            <div class="icon">
                                <i class="fa fa-heart"></i>
                            </div>
                            <a href="LinkServlet" class="small-box-footer">More info <i
                                    class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- 引入页脚footer-fragment -->
    <jsp:include page="index/footer.jsp" />

</div>
<!-- jQuery -->
<script src="admin/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="admin/plugins/jQueryUI/jquery-ui.min.js"></script>
<%--<!-- Bootstrap 4 -->--%>
<script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<%--<!-- AdminLTE App -->--%>
<script src="admin/dist/js/adminlte.min.js"></script>
<%--<!-- sweetalert -->--%>
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="admin/dist/js/public.js"></script>






<script>


    $(function () {

        /**
         * 登陆时间
         */
        function getNow(s) {
            return s < 10 ? '0' + s: s;
        }

        var myDate = new Date();

        var year=myDate.getFullYear();        //获取当前年
        var month=myDate.getMonth()+1;   //获取当前月
        var date=myDate.getDate();            //获取当前日


        var h=myDate.getHours();              //获取当前小时数(0-23)
        var m=myDate.getMinutes();          //获取当前分钟数(0-59)
        var s=myDate.getSeconds();

        var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
        $("#loginTime").html(now);


        if(${sessionScope.user!=null}){

            if ("${sessionScope.tan}"=="1"){
            swal("欢迎您的登陆:"+"${sessionScope.user.account}", {
                icon: "success",
            });
            }
        }
    })


</script>
<%
request.getSession().setAttribute("tan","2");
request.getSession().setAttribute("blog",new Blog());
%>
</body>
</html>

