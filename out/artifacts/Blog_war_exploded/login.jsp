<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/7
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%
    String removeUser = request.getParameter("removeUser");
    if ("removeUser".equals(removeUser)) {
        request.getSession().setAttribute("user", null);
    }
%>
<head>
    <jsp:include page="index/css.jsp"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>personal blog | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="admin/dist/img/favicon.png"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="admin/dist/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="admin/dist/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="admin/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="X-admin/css/waifu.css">
    <style>
        canvas {
            display: block;
            vertical-align: bottom;
        }

        #particles {
            background-color: #F7FAFC;
            position: absolute;
            top: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
    </style>
</head>
<body class="hold-transition login-page">
<div id="particles">
</div>
<div class="login-box" style="width: 500px;">
    <div class="login-logo" style="color: #007bff;">
        <h1>personal blog</h1>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">your personal blog , enjoy it</p>
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <div class="alert alert-danger" style="display: none"
                         text="${sessionScope.errorMsg}">${sessionScope.errorMsg}</div>
                </div>
                <div class="form-group has-feedback">
                    <span class="fa fa-user form-control-feedback">账号</span>
                    <input type="text" id="userName" name="userName" class="form-control" placeholder="请输入账号"
                           required="true">
                </div>
                <div class="form-group has-feedback">
                    <span class="fa fa-lock form-control-feedback">密码</span>
                    <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码"
                           required="true">
                </div>
                <div class="row">
                    <div class="col-6">
                        <input class="form-control input-code" name="verifyCode" placeholder="请输入验证码" required="true"
                               type="text" placeholder="验证码">
                    </div>
                    <div class="col-6" style="width: 221.6px;">
                        <span style="font-size: 23px;height: 40px" class="code pointer" title='点击切换'></span>
                    </div>
                </div>
                <div class="form-group has-feedback"></div>
                <div class="row">
                    <div class="col-8" style="max-width: 47.666667%">
                        <button style="width: 105% " type="button" class="btn btn-primary btn-block btn-flat"
                                onclick="register()">注册
                        </button>
                    </div>
                    <div class="col-4">
                        <button style="width: 235px" type="submit" class="btn btn-primary btn-block btn-flat">登录
                        </button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <button style="width: 154% " type="button" class="btn btn-primary btn-block btn-flat"
                                onclick="register()">找回密码
                        </button>
                    </div>
                </div>
            </form>

        </div>


        <!-- /.login-card-body -->
    </div>
    <!-- /.content -->
    <div class="content">
        <!-- 模态框（Modal） -->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="linkModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h6 class="modal-title" id="linkModalLabel">Modal</h6>
                    </div>
                    <div class="modal-body">
                        <form id="linkForm" action="LinkServlet" method="post">
                            <input type="hidden" name="op" value="insLink">
                            <input type="hidden" name="linkId" value="">
                            <div class="form-group">
                                <div class="alert alert-danger" id="edit-error-msg" style="display: none;">
                                    错误信息展示栏。
                                </div>
                            </div>

                            <div class="form-group">
                                <span>
                                <label for="LoginName" class="control-label">登录账号&nbsp;
                                </label>
                                    <label id="registerAlert" style="display: none;color: red">
                                    </label>
                                    </span>


                                <%--                                    <select class="form-control" id="linkType" name="linkType">--%>
                                <%--                                        <option selected="selected" value="0">友链</option>--%>
                                <%--                                        <option value="1">推荐网站</option>--%>
                                <%--                                        <option value="2">个人链接</option>--%>
                                <%--                                    </select>--%>
                                <input type="text" class="form-control" id="LoginName" name="linkName"
                                       placeholder="请输入登录账号" required="true">
                            </div>
                            <div class="form-group">
                                <label for="password1" class="control-label">登录密码:</label>
                                <input type="text" class="form-control" id="password1" name="password1"
                                       placeholder="请输入密码" required="true">
                            </div>
                            <div class="form-group">
                                <label for="password2" class="control-label">再次输入密码:</label>
                                <input type="text" class="form-control" id="password2" name="password2"
                                       placeholder="请再次输入密码" required="true">
                            </div>
                            <div class="form-group">
                                <label for="problem" class="control-label">密保问题:</label>
                                <input type="url" class="form-control" id="problem" name="linkUrl"
                                       placeholder="请输入密保问题" required="true">
                            </div>
                            <div class="form-group">
                                <label for="answer" class="control-label">密保答案:</label>
                                <input type="url" class="form-control" id="answer" name="linkHphoto"
                                       placeholder="请输入密保答案" required="true">
                            </div>
                            <div class="form-group">
                                <label for="userIdentify" class="control-label">身份说明:</label>
                                <input type="url" class="form-control" id="userIdentify" name="linkHphoto"
                                       placeholder="请输入身份说明" required="true">
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


    <footer class="page-footer bg-color">
        <div class="waifu" style="right: 30px;">
            <div class="waifu-tips" style="width: 307px; height: 87px; top: -30px; font-size: 15px; opacity: 0;">这句一言来自
                <span style="color:#0099cc;">『网易云』</span>，是 <span style="color:#0099cc;">破晓之雪</span> 在 hitokoto.cn 投稿的。
            </div>
            <canvas id="live2d" class="live2d" width="300" height="267"></canvas>
            <div class="waifu-tool" style="font-size: 18px;"><span class="fui-home"
                                                                   style="line-height: 25px;"></span><span
                    class="fui-chat" style="line-height: 25px;"></span><span class="fui-eye"
                                                                             style="line-height: 25px;"></span><span
                    class="fui-user" style="line-height: 25px;"></span><span class="fui-photo"
                                                                             style="line-height: 25px; display: none;"></span><span
                    class="fui-info-circle" style="line-height: 25px; display: none;"></span><span class="fui-cross"
                                                                                                   style="line-height: 25px;"></span>
            </div>
        </div>
        <script src="admin/plugins/jquery/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/waifu/waifu-tips.js"></script>
        <script src="https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/waifu/live2d.js"></script>
        <script>live2d_settings.hitokotoAPI = "hitokoto.cn", live2d_settings.modelId = 2, live2d_settings.modelTexturesId = 60, live2d_settings.modelStorage = !1, live2d_settings.waifuSize = "300x267", live2d_settings.waifuTipsSize = "285x75", live2d_settings.waifuFontSize = "15px", live2d_settings.waifuToolFont = "18px", live2d_settings.waifuToolLine = "25px", live2d_settings.waifuToolTop = "-30px", live2d_settings.waifuEdgeSide = "right:30", live2d_settings.waifuDraggable = "axis-x", live2d_settings.canTurnToAboutPage = !1, live2d_settings.canTakeScreenshot = !1, live2d_settings.homePageUrl = "http://localhost:8080/Blog/login.jsp", initModel("https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/waifu/waifu-tips.json")</script>
    </footer>

</div>
<!-- /.login-box -->

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

<script src="admin/dist/js/plugins/particles.js"></script>
<%--验证码--%>
<%--<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>--%>
<script src="admin/dist/js/jquery.code.js"></script>

<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="admin/dist/js/public.js"></script>
<%--<script src="admin/dist/js/plugins/login-bg-particles.js"></script>--%>

<%--彩带--%>
<script defer id="ribbon" src="admin/dist/js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1"
        mobile="true"
        data-click="true">
</script>
<script src="blog/js/third-party/click_heart.js"></script>
<script id="ribbon_piao" mobile="true"
        src="https://cdn.jsdelivr.net/gh/jerryc127/butterfly_cdn@2.1.0/js/piao.js"></script>
<script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true"
        src="admin/dist/js/third-party/canvas-nest.js">
</script>
<script>

    function register() {
        // alert("哈哈");
        // alert($("#loginModal").attr("id"));
        $(".modal-title").html('账号注册');
        $("#loginModal").modal('show');

    }

    // 前面输入框失去焦点验证
    $('.input-code').blur(function () {



        if ($(this).val().toLowerCase() != $('.code').children('input').val().toLowerCase()) {
            $(".input-code").val("");
            // alert('验证码不正确')
            swal("验证码不正确", {
                icon: "error",
            });
            $('.code').createCode({
                len: 6
            });
        }
    })





    $(function () {

        //ajax验证注册账号是否已经存在
        $("#LoginName").blur(function () {

            if($("#LoginName").val()!=""){
                var registerAccount=$("#LoginName").val();
                $.ajax({
                    url: "LoginServlet",
                    type: "get",
                    async:true,
                    data:{
                        op:"registerCheck",
                        registerAccount:registerAccount
                    },
                    success:function (data) {
                        if(data.code==200){
                            $("#registerAlert").css("display","block");
                            $("#registerAlert").html("该账号未被注册");
                        }else{
                            $("#registerAlert").css("display","block");
                            $("#LoginName").val("该账号已被注册,请重新填写");
                        }
                    },
                    error:function () {

                    }
                })
            }else{
                $("#registerAlert").css("display","block");
                $("#registerAlert").html("账号不能为空");
            }

        })
        //注册账号
        $("#saveButton").click(function () {
            var password1 = $("#password1").val();
            var password2=$("#password2").val();
            var problem=$("#problem").val()
            var userIdentify=$("#userIdentify").val();
            var answer=$("#answer").val();

            $.ajax({
                url: "LoginServlet",
                type: "get",
                async:true,
                data:{
                    op:"registerCheck",
                    registerAccount:registerAccount
                },
                success:function (data) {
                    if(data.code==200){
                        $("#registerAlert").css("display","block");
                        $("#registerAlert").html("该账号未被注册");
                    }else{
                        $("#registerAlert").css("display","block");
                        $("#registerAlert").html("该账号已被注册,请重新填写");
                        $("#LoginName").val("");
                    }
                },
                error:function () {

                }
            })


        })



        if ("${sessionScope.errorMsg}" == "账号或密码不正确") {
            $(".alert-danger").css("display", "block");
        }

        // 自定义验证码个数
        $('.code').createCode({
            len: 6
        });

        if ("${sessionScope.illegalLogin}" == "请登录") {
            swal("请先登录", {
                icon: "error",
            });
        }
    });

    document.oncontextmenu = function () {
        return false;
    };
    document.onkeydown = function () {
        if (window.event && window.event.keyCode == 123) {
            alert("你想对我做什么喵！ !!! 耍流氓喵");

            event.keyCode = 0;
            event.returnValue = false;
            return false;
        }
    };
</script>
<%
    request.getSession().setAttribute("illegalLogin","");
    request.getSession().setAttribute("errorMsg", "");
%>
</body>
</html>
