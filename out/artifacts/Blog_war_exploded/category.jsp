<%@ page import="com.csw.entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/7
  Time: 20:54
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
<div class="wrapper">

    <!-- 引入页面头header.jsp -->
    <jsp:include page="index/header.jsp" />

    <!-- 引入工具栏left.jsp -->
    <jsp:include page="index/left.jsp" />

    <!-- Content Wrapper. Contains 图标content -->
    <div class="content-wrapper">
        <!-- Content Header (图标header) -->
        <div class="content-header">
            <div class="container-fluid">
            </div><!-- /.container-fluid -->
        </div>
        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">分类管理</h3>
                    </div> <!-- /.card-body -->
                    <div class="card-body">
                        <div class="grid-btn">
                            <button class="btn btn-info" onclick="categoryAdd()"><i
                                    class="fa fa-plus"></i>&nbsp;新增
                            </button>
                            <button class="btn btn-info" onclick="selCategory()"><i
                                    class="fa fa-pencil-square-o"></i>&nbsp;修改
                            </button>
                            <button class="btn btn-danger" onclick="deleteCagegory()"><i
                                    class="fa fa-trash-o"></i>&nbsp;删除
                            </button>
                        </div>
                        <br>



                        <div class="widget-body">
                            <table class="table table-striped table-bordered" id="sample_1">
                                <thead>
                                <tr>
                                    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                                    <th>目录名称</th>
                                    <th class="hidden-phone">创建时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.categoryList}" var="category">
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>${category.name}</td>
                                        <td class="hidden-phone">${category.createTime}</td>
                                        <td name="hiddenId" style="display: none" >${category.id}</td>
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
            <div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="categoryModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h6 class="modal-title" id="categoryModalLabel">Modal</h6>
                        </div>
                        <div class="modal-body">
                            <form id="categoryForm" method="post" action="CategoryServlet">
                                <div class="form-group">
                                    <div class="alert alert-danger" id="edit-error-msg" style="display: none;">
                                        错误信息展示栏。
                                    </div>
                                </div>
                                <input type="hidden" name="op" value="insCategory">
                                <input type="hidden" name="categoryId" value="">
                                <div class="form-group">
                                    <label for="categoryName" class="control-label">分类名称:</label>
                                    <input type="text" class="form-control" id="categoryName" name="categoryName"
                                           placeholder="请输入分类名称" required="true">
                                </div>
                                <div class="form-group">
                                    <label for="categoryIcon" class="control-label">分类图标:</label>
                                    <select class='form-control select2 image-picker' id="categoryIcon"
                                            name="categoryIcon">
                                        <option data-img-src='admin/dist/img/category/00.png' value='admin/dist/img/category/00.png'> 默认图标</option>
                                        <option data-img-src='admin/dist/img/category/01.png' value='admin/dist/img/category/01.png'> 图标1</option>
                                        <option data-img-src='admin/dist/img/category/02.png' value='admin/dist/img/category/02.png'> 图标2</option>
                                        <option data-img-src='admin/dist/img/category/03.png' value='admin/dist/img/category/03.png'> 图标3</option>
                                        <option data-img-src='admin/dist/img/category/04.png' value='admin/dist/img/category/04.png'> 图标4</option>
                                        <option data-img-src='admin/dist/img/category/05.png' value='admin/dist/img/category/05.png'> 图标5</option>
                                        <option data-img-src='admin/dist/img/category/06.png' value='admin/dist/img/category/06.png'> 图标6</option>
                                        <option data-img-src='admin/dist/img/category/07.png' value='admin/dist/img/category/07.png'> 图标7</option>
                                        <option data-img-src='admin/dist/img/category/08.png' value='admin/dist/img/category/08.png'> 图标8</option>
                                        <option data-img-src='admin/dist/img/category/09.png' value='admin/dist/img/category/09.png'> 图标9</option>
                                        <option data-img-src='admin/dist/img/category/10.png' value='admin/dist/img/category/10.png'> 图标10</option>
                                        <option data-img-src='admin/dist/img/category/11.png' value='admin/dist/img/category/11.png'> 图标11</option>
                                        <option data-img-src='admin/dist/img/category/12.png' value='admin/dist/img/category/12.png'> 图标12</option>
                                        <option data-img-src='admin/dist/img/category/13.png' value='admin/dist/img/category/13.png'> 图标13</option>
                                        <option data-img-src='admin/dist/img/category/14.png' value='admin/dist/img/category/14.png'> 图标14</option>
                                        <option data-img-src='admin/dist/img/category/15.png' value='admin/dist/img/category/15.png'> 图标15</option>
                                        <option data-img-src='admin/dist/img/category/16.png' value='admin/dist/img/category/16.png'> 图标16</option>
                                        <option data-img-src='admin/dist/img/category/17.png' value='admin/dist/img/category/17.png'> 图标17</option>
                                        <option data-img-src='admin/dist/img/category/18.png' value='admin/dist/img/category/18.png'> 图标18</option>
                                        <option data-img-src='admin/dist/img/category/19.png' value='admin/dist/img/category/19.png'> 图标19</option>
                                    </select>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary" id="saveButton">确认</button>
                                </div>
                            </form>
                        </div>


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
<!-- jqgrid -->
<script src="admin/plugins/jqgrid-5.3.0/jquery.jqGrid.min.js"></script>
<script src="admin/plugins/jqgrid-5.3.0/grid.locale-cn.js"></script>
<!-- image-picker -->
<script src="admin/plugins/image-picker/query.masonry.min.js"></script>
<script src="admin/plugins/image-picker/image-picker.min.js"></script>
<!-- sweetalert -->
<script src="admin/plugins/sweetalert/sweetalert.min.js"></script>
<script src="admin/dist/js/public.js"></script>
<%--<script src="admin/dist/js/category.js"></script>--%>
<script>


    //存储选中友链的id
    var idArray=[];

    $(".btn-default").click(function () {
        $("input:hidden[name='op']").val("insCategory");
    })

    function categoryAdd() {
        $("#categoryName").val('');
        $("input:hidden[name='op']").val("insCategory");
        $('.modal-title').html('目录添加');
        $('#categoryModal').modal('show');
    }

    /**
     * 查询目录
     */
    function selCategory() {


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
        $("input:hidden[name='op']").val("selCategoryById");
        $("input:hidden[name='categoryId']").val(idArray[0]);
        $("#categoryForm").submit();
    }

    /**
     * 删除目录
     */
    function deleteCagegory() {

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
                    $("input:hidden[name='op']").val("delCategory");
                    $("input:hidden[name='categoryId']").val(idArray);
                    $("#categoryForm").submit();
                }else{
                    $("input:hidden[name='op']").val("insCategory");
                }
            }
        );
    }


    $(function () {

        /**
         * 修改目录
         */
        if("${sessionScope.show}"=="true"){
            $("input:hidden[name='op']").val("updCategory");
            $('.modal-title').html('类别修改');
            $("#categoryName").val("${sessionScope.category.name}");
            $('#categoryModal').modal('show');
        };


        /**
         * 存储选中友链的id
         */
        $('.checkboxes').click(function () {
            if ($(this).prop("checked")) {
                idArray.push(parseInt($(this).parent().parent().find("td:eq(3)").html()))
            } else {
                var i=parseInt($(this).parent().parent().find("td:eq(3)").html());
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
    request.getSession().setAttribute("category",new Category());
%>
</body>
</html>