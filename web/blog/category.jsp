<%@ page import="com.csw.service.impl.RightServiceImpl" %>
<%@ page import="com.csw.service.RightService" %>
<%@ page import="com.csw.service.CommentService" %>
<%@ page import="com.csw.service.impl.CommentServiceImpl" %>
<%@ page import="com.csw.service.CategoryService" %>
<%@ page import="com.csw.service.impl.CategoryServiceImpl" %>
<%@ page import="com.csw.service.PhotoService" %>
<%@ page import="com.csw.service.impl.PhotoServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>}">
<%

    RightService rightService=new RightServiceImpl();
    CommentService commentService=new CommentServiceImpl();
    CategoryService categoryService=new CategoryServiceImpl();
    PhotoService photoService=new PhotoServiceImpl();


    request.setAttribute("right",rightService.selRight());
    request.setAttribute("ShowComment",commentService.selComment());
    request.setAttribute("ShowCategory",categoryService.selAllCategory());
    request.setAttribute("HeaderPhoto",photoService.selPhoto(1));
    request.setAttribute("showCategoryCount",categoryService.selAllCategoryCount());
    request.setAttribute("CategoryBlogCount",categoryService.selCategoryBlogCount());
%>
<html lang="zh-CN" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>目录 | 行路のblog</title>
    <meta property="og:image" content="https://todcsw.github.io/img/post.jpg">
    <link rel="stylesheet" href="blog/css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.css">
    <link rel="canonical" href="https://todcsw.github.io/about/">
    <meta name="generator" content="Hexo 4.2.0">
</head>
<body>

<div id="body-wrap">
<%--    style="background-image: url(/img/index3.jpg)"--%>
    <jsp:include page="header.jsp" />
    <main class="layout_page" id="content-inner">
        <div class="category-content">
            <div class="category-lists">
                <div class="category__title">分类 - <span class="category__amount">${requestScope.showCategoryCount}</span></div>
                <div>
                    <ul class="category-list">
                        <c:forEach items="${requestScope.CategoryBlogCount}" var="BlogCount">
                        <li class="category-list-item">
                            <a class="category-list-link" href="blog/detailCategory.jsp?CategoryName=${BlogCount.name}">${BlogCount.name}</a>
                            <span class="category-list-count">${BlogCount.count}</span>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <hr>
            <div id="post-comment">
                <div class="comment_headling"><i class="fa fa-comments fa-fw" aria-hidden="true"></i><span> 评论</span></div>
                <div class="vcomment" id="vcomment"></div>
                <script src="https://cdn.jsdelivr.net/npm/valine/dist/Valine.min.js"></script>
                <script>var GUEST_INFO = ['nick','mail','link'];
                var guest_info = 'nick,mail,link'.split(',').filter(function(item){
                    return GUEST_INFO.indexOf(item) > -1
                });
                guest_info = guest_info.length == 0 ? GUEST_INFO :guest_info;

                window.valine = new Valine({
                    el:'#vcomment',
                    notify: false,
                    verify: false,
                    appId: '${requestScope.ShowComment.appId}',
                    appKey: '${requestScope.ShowComment.appKey}',
                    placeholder: '${requestScope.ShowComment.placeholder}',
                    avatar: 'monsterid',
                    meta: guest_info,
                    pageSize: '10',
                    lang: 'zh-cn',
                    recordIP: false,
                    serverURLs: ''
                });</script>
            </div>
        </div>

        <jsp:include page="right.jsp" />
    </main>
    <jsp:include page="foot.jsp" />

</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
<script src="blog/js/utils.js"></script>
<!-- <script src="js/main.js"></script>
<script src="js/tw_cn.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.js"></script>
<script defer id="ribbon" src="blog/js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1" mobile="true"
        data-click="false"></script>
<script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true" src="blog/js/third-party/canvas-nest.js"></script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<script src="https://cdn.jsdelivr.net/npm/instant.page@latest/instantpage.min.js" type="module"></script>
<script src="https://cdn.jsdelivr.net/npm/lazysizes@latest/lazysizes.min.js" async=""></script>
<script src="blog/js/third-party/click_heart.js"></script>
<script id="ribbon_piao" mobile="true" src="https://cdn.jsdelivr.net/gh/jerryc127/butterfly_cdn@2.1.0/js/piao.js"></script>
<script src="blog/js/refuseF12.js"></script>
<script src="blog/js/jquery.min.js"></script>
<script>
    $(function () {

        //comment相关信息
        $("#veditor").css("backgroundImage","url("+"${requestScope.ShowComment.placePhoto}"+")");
        if("${requestScope.ShowComment.flag}"!="true"){
            $("#post-comment").css("display","none");
        }

        $("#site_title").html("目录");

        //顶部背景图片
        $(".not-index-bg").css("background-image","url("+"${requestScope.HeaderPhoto.catalogPhoto}"+")");
    })
</script>
</body>
</html>

