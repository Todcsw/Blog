<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/7
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">站点信息</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="websiteForm" method="post" action="ConfigurationServlet">
                                    <!-- text input -->
                                    <input type="hidden" name="op" value="updSite">
                                    <div class="form-group">
                                        <label>站点名称</label>
                                        <input type="text" class="form-control" id="websiteName"
                                               name="websiteName"
                                               placeholder="站点名称" value="${requestScope.site.name}" >
                                    </div>
                                    <div class="form-group">
                                        <label>站点描述</label>
                                        <input type="text" class="form-control" id="websiteDescription"
                                               name="websiteDescription"
                                               value="${requestScope.site.description}"
                                               placeholder="站点描述">
                                    </div>
                                    <div class="form-group">
                                        <label>站点Logo</label>
                                        <input type="text" class="form-control" id="websiteLogo"
                                               name="websiteLogo" value="${requestScope.site.logo}"
                                               placeholder="站点Logo">
                                    </div>

                                    <div class="form-group">
                                        <label>站点公告</label>
                                        <input type="text" class="form-control" id="websiteNotice"
                                               value="${requestScope.site.notice}"
                                               name="websiteNotice"
                                               placeholder="站点公告">
                                    </div>

                                    <div class="form-group">
                                        <label>favicon.ico</label>
                                        <input type="text" class="form-control" id="websiteIcon"
                                               value="${requestScope.site.favicon}"
                                               name="websiteIcon"
                                               placeholder="favicon.ico">
                                    </div>


                                    <div class="card-footer">
                                        <button type="submit" id="updateWebsiteButton"
                                                class="btn btn-danger float-right">确认修改
                                        </button>
                                    </div>
                                </form>
                            </div><!-- /.card-body -->
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">个人信息</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="userInfoForm" method="post" action="ConfigurationServlet">
                                    <input type="hidden" name="op" value="updInformation">
                                    <!-- input states -->
                                    <div class="form-group">
                                        <label class="control-label">个人头像</label>
                                        <input type="text" class="form-control" id="yourAvatar"
                                               name="yourAvatar" value="${requestScope.information.photo}"
                                               placeholder="个人头像">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">个人名称</label>
                                        <input type="text" class="form-control" id="yourName"
                                               name="yourName" value="${requestScope.information.name}"
                                               placeholder="个人名称">
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">喜欢的一句话</label>
                                        <input type="text" class="form-control" id="sentence"
                                               name="yourSentence" value="${requestScope.information.sentence}"
                                               placeholder="例如:学深夜的习,读清晨的书">
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">个人邮箱</label>
                                        <input type="email" class="form-control" id="yourEmail" name="yourEmail"
                                               value="${requestScope.information.email}"
                                               placeholder="个人邮箱">
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">个人github</label>
                                        <input type="text" class="form-control" id="github" name="yourGithub"
                                               value="${requestScope.information.github}"
                                               placeholder="个人github地址">
                                    </div>

                                    <div class="card-footer">
                                        <button type="submit" id="updateUserInfoButton"
                                                class="btn btn-danger float-right">确认修改
                                        </button>
                                    </div>
                                </form>
                            </div><!-- /.card-body -->
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">底部设置</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="footerForm" method="post" action="ConfigurationServlet">
                                    <input type="hidden" name="op" value="updFooter">
                                    <!-- input states -->
                                    <div class="form-group">
                                        <label class="control-label">底部About</label>
                                        <input type="text" class="form-control" id="footerAbout"
                                               name="footerAbout" value="${requestScope.footer.about}"
                                               placeholder="About">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">底部备案号</label>
                                        <input type="text" class="form-control" id="footerICP" name="footerICP"
                                               value="${requestScope.footer.number}"
                                               placeholder="备案号">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">底部Copy Right</label>
                                        <input type="text" class="form-control" id="footerCopyRight"
                                               name="footerCopyRight"
                                               value="${requestScope.footer.copyright}"
                                               placeholder="Copy Right">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">底部Powered By</label>
                                        <input type="text" class="form-control" id="footerPoweredBy"
                                               name="footerPoweredBy"
                                               value="${requestScope.footer.powerby}"
                                               placeholder="Powered By">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">底部Powered By URL</label>
                                        <input type="text" class="form-control" id="footerPoweredByURL"
                                               name="footerPoweredByURL"
                                               value="${requestScope.footer.byurl}"
                                               placeholder="Powered By URL">
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" id="updateFooterButton"
                                                class="btn btn-danger float-right">确认修改
                                        </button>
                                    </div>
                                </form>
                            </div><!-- /.card-body -->
                        </div>
                    </div>
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
<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<%--<script src="admin/dist/js/configuration.js"></script>--%>
<script>
$(function () {
    if("${sessionScope.MSG}"==200){
        swal("保存成功", {
            icon: "success",
        });
    }else if("${sessionScope.MSG}"==201){
        swal("操作失败", {
            icon: "error",
        });
    }else{

    }
})
</script>
<%
request.getSession().setAttribute("MSG","");
%>
</body>
</html>