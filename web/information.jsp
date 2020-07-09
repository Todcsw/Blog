<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/8
  Time: 10:05
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
                                <h3 class="card-title">个人介绍信息</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="websiteForm" action="InformationServlet" method="post">
                                    <input type="hidden" name="op" value="updDescription">
                                    <!-- text input -->
                                    <div class="form-group">
                                        <label>个人昵称</label>
                                        <input type="text" class="form-control" id="websiteName"
                                               name="descriptionName"
                                               placeholder="个人昵称" value="${requestScope.description.name}">
                                    </div>
                                    <div class="form-group">
                                        <label>所属星座</label>
                                        <input type="text" class="form-control" id="websiteDescription"
                                               name="descriptionConstellation"
                                               value="${requestScope.description.constellation}"
                                               placeholder="所属星座">
                                    </div>
                                    <div class="form-group">
                                        <label>教育经历</label>
                                        <input type="text" class="form-control" id="websiteLogo"
                                               name="descriptionExperience"
                                               value="${requestScope.description.experience}"
                                               placeholder="教育经历">
                                    </div>

                                    <div class="form-group">
                                        <label>喜欢的一句话</label>
                                        <input type="text" class="form-control" id="websiteNotice"
                                               value="${requestScope.description.sentence}"
                                               name="descriptionSentence"
                                               placeholder="喜欢的一句话">
                                    </div>

                                    <div class="form-group">
                                        <label>个人偶像</label>
                                        <input type="text" class="form-control" id="websiteIcon"
                                               value="${requestScope.description.idol}"
                                               name="descriptionIdol"
                                               placeholder="个人偶像">
                                    </div>

                                    <div class="form-group">
                                        <label>个人性格</label>
                                        <input type="text" class="form-control" id="character"
                                               value="${requestScope.description.character}"
                                               name="descriptionCharacter"
                                               placeholder="个人性格">
                                    </div>

                                    <div class="form-group">
                                        <label>联系方式</label>
                                        <input type="text" class="form-control" id="contact"
                                               value="${requestScope.description.contact}"
                                               name="descriptionContact"
                                               placeholder="联系方式">
                                    </div>

                                    <div class="form-group">
                                        <label>擅长开发语言</label>
                                        <input type="text" class="form-control" id="language"
                                               value="${requestScope.description.language}"
                                               name="descriptionLanguage"
                                               placeholder="擅长开发语言">
                                    </div>

                                    <div class="form-group">
                                        <label>对大家的建议</label>
                                        <input type="text" class="form-control" id="information"
                                               value="${requestScope.description.information}"
                                               name="descriptionInformation"
                                               placeholder="对大家的建议">
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
                                <h3 class="card-title">图片信息</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="userInfoForm" method="post" action="InformationServlet">
                                    <input type="hidden" name="op" value="updPhoto">
                                    <!-- input states -->
                                    <div class="form-group">
                                        <label class="control-label">首页图片</label>
                                        <input type="text" class="form-control" id="indexPhoto"
                                               name="indexPhoto"
                                               value="${requestScope.photo.indexPhoto}"
                                               placeholder="首页图片">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">标签图片</label>
                                        <input type="text" class="form-control" id="tagPhoto"
                                               name="tagPhoto"
                                               value="${requestScope.photo.tagPhoto}"
                                               placeholder="标签图片">
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">分类图片</label>
                                        <input type="text" class="form-control" id="catalogPhoto"
                                               name="catalogPhoto"
                                               value="${requestScope.photo.catalogPhoto}"
                                               placeholder="分类图片">
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">友情链接图片</label>
                                        <input type="text" class="form-control" id="linkPhoto"
                                               name="linkPhoto"
                                               value="${requestScope.photo.linkPhoto}"
                                               placeholder="友情链接图片">
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">关于图片</label>
                                        <input type="text" class="form-control" id="aboutPhoto"
                                               name="aboutPhoto"
                                               value="${requestScope.photo.aboutPhoto}"
                                               placeholder="关于图片">
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
                                <h3 class="card-title">评论设置</h3>
                            </div> <!-- /.card-body -->
                            <div class="card-body">
                                <form role="form" id="footerForm" action="InformationServlet" method="post">
                                    <input type="hidden" name="op" value="updComment">
                                    <!-- input states -->
                                    <div class="form-group">
                                        <label class="control-label">是否引入评论功能<span style="color: red">(必须填写true或者false)</span></label>
                                        <input type="text" class="form-control" id="Flag"
                                               name="Flag"
                                               value="${requestScope.comment.flag}"
                                               placeholder="true 为是 ,false为否">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">appId</label>
                                        <input type="text" class="form-control" id="appId"
                                               name="appId"
                                               value="${requestScope.comment.appId}"
                                               placeholder="appId">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">appKey</label>
                                        <input type="text" class="form-control" id="appKey"
                                               name="appKey"
                                               value="${requestScope.comment.appKey}"
                                               placeholder="Copy Right">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">placeholder</label>
                                        <input type="text" class="form-control" id="placeholder"
                                               name="placeholder"
                                               value="${requestScope.comment.placeholder}"
                                               placeholder="想让别人评论什么">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">placePhoto</label>
                                        <input type="text" class="form-control" id="placePhoto"
                                               name="placePhoto"
                                               value="${requestScope.comment.placePhoto}"
                                               placeholder="评论上的一个水印">
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