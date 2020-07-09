<%@ page import="com.csw.servlet.TagServlet" %><%--
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
<%
    TagServlet.isIllegalLogin(request,response);
    HttpSession hs=request.getSession();
    String placeLogin =(String) session.getAttribute("illegalLogin");
    if(placeLogin.equals("请登录")){
        return;
    }
%>
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
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">基本信息</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="userNameForm" >

                                    <div class="form-group col-sm-8">
                                        <div class="alert alert-danger" id="updateUserName-info" style="display: none;"></div>
                                    </div>
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label>原账号</label><label id="errorAlert" style="display: none ;color: red" ></label>
                                        <input type="text" class="form-control" id="loginUserName"
                                               name="loginUserName"
                                               placeholder="请输入登陆名称" required="true" >
                                    </div>
                                    <div class="form-group">
                                        <label>新账号</label><label id="errorNull" style="display: none ;color: red" ></label>
                                        <input type="text" class="form-control" id="nickName"
                                               name="nickName"
                                               placeholder="请输入昵称" required="true">
                                    </div>
                                    <div class="card-footer">
                                        <button type="button" id="updateUserNameButton"
                                                class="btn btn-danger float-right">确认修改
                                        </button>
                                    </div>
                                </form>
                            </div><!-- /.card-body -->
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">修改密码</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="userPasswordForm">

                                    <div class="form-group col-sm-8">
                                        <div class="alert alert-danger updatePassword-info" id="updatePassword-info" style="display: none;"></div>
                                    </div>
                                    <!-- input states -->
                                    <div class="form-group">
                                        <label class="control-label"><i class="fa fa-key"></i> 原密码</label>
                                        <label id="errorPassword" style="display: none ;color: red" ></label>

                                        <input type="password" class="form-control" id="originalPassword"
                                               name="originalPassword"
                                               placeholder="请输入原密码" required="true">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label"><i class="fa fa-key"></i> 新密码</label>
                                        <label id="errorPasswordNull" style="display: none ;color: red" ></label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword"
                                               placeholder="请输入新密码" required="true">
                                    </div>
                                    <div class="card-footer">
                                        <button type="button" id="updatePasswordButton"
                                                class="btn btn-danger float-right">确认修改
                                        </button>
                                    </div>
                                </form>
                            </div><!-- /.card-body -->
                        </div>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
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
<!-- public.js -->
<script src="admin/dist/js/public.js"></script>
<!-- profile -->
<%--<script src="admin/dist/js/profile.js"></script>--%>
<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>

<%--引入base64--%>
<script src="admin/dist/js/base64.js"></script>
<script>
    var base64 = new Base64();

    //判断原账号,输入是否正确
    $("#loginUserName").blur(function () {
        var loginUserName = $("#loginUserName").val();
        if(loginUserName!="${sessionScope.user.account}"){
            $("#errorAlert").css("display","contents");
            $("#errorAlert").html("  (账号输入不正确,请重新输入)");
        }else{
            $("#errorAlert").css("display","none");
            $("#errorAlert").html("")
        }

    })


    //判断原密码,输入是否正确
    $("#originalPassword").blur(function () {


        var originalPassword = $("#originalPassword").val();
        originalPassword=base64.encode(originalPassword);

        if(originalPassword!="${sessionScope.user.password}"){
            $("#errorPassword").css("display","contents");
            $("#errorPassword").html("  (密码输入不正确,请重新输入)");
        }else{
            $("#errorPassword").css("display","none");
            $("#errorPassword").html("")
        }

    })




    //修改密码ajax
    $("#updatePasswordButton").click(function () {
        var newPassword= $("#newPassword").val();
        if(newPassword!=""){
            $.ajax({
                url:"ProfileServlet",
                async:false,
                type:"post",
                data:{
                    "op":"editPassword",
                    "newPassword":newPassword,
                },
                success:function (data) {

                    if(data.code==200){
                        swal(data.message+"2妙后跳转", {
                            icon: "success",
                        });
                        setTimeout(function () {
                            window.location.href="login.jsp";
                        },2000)

                    }else{
                        swal(data.message, {
                            icon: "error",
                        });

                    }
                }

            })
        }else{
            $("#errorPasswordNull").css("display","contents");
            $("#errorPasswordNull").html("不能为空")
        }


    })

    //修改账户ajax
    $("#updateUserNameButton").click(function () {
        var nickName= $("#nickName").val();
        if(nickName!=""){
            $.ajax({
                url:"ProfileServlet",
                async:false,
                type:"post",
                data:{
                    "op":"editAccount",
                    "nickName":nickName,
                },
                success:function (data) {
                    if(data.code==200){
                        swal(data.message+"1秒后刷新页面", {
                            icon:"success",
                        });
                        setTimeout(function () {
                            window.location.href="profile.jsp";
                        },1000)

                    }else{
                        swal(data.message, {
                            icon: "error",
                        });
                        // $("#errorAlert").html(data.message);
                    }
                }

            })
        }else{
            $("#errorNull").css("display","contents");
            $("#errorNull").html("不能为空")
        }
    })

    $(function () {
        $("input").val("");
    })

</script>
</body>
</html>
