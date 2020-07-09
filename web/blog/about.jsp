<%@ page import="com.csw.service.PhotoService" %>
<%@ page import="com.csw.service.impl.PhotoServiceImpl" %>
<%@ page import="com.csw.service.DescriptionService" %>
<%@ page import="com.csw.service.impl.DescriptionServiceImpl" %>
<%@ page import="com.csw.service.impl.CommentServiceImpl" %>
<%@ page import="com.csw.service.CommentService" %>
<%@ page import="com.csw.service.RightService" %>
<%@ page import="com.csw.service.impl.RightServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>}">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>关于 | 行路のblog</title>
    <meta property="og:image" content="https://todcsw.github.io/img/post.jpg">
    <link rel="stylesheet" href="blog/css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.css">
    <link rel="canonical" href="https://todcsw.github.io/about/">
    <meta name="generator" content="Hexo 4.2.0">
</head>
<body>
<%
    RightService rightService=new RightServiceImpl();
    CommentService commentService=new CommentServiceImpl();
    PhotoService photoService=new PhotoServiceImpl();
    DescriptionService descriptionService=new DescriptionServiceImpl();
    request.setAttribute("ShowComment",commentService.selComment());
    request.setAttribute("showDescription",descriptionService.selDescription());
    request.setAttribute("HeaderPhoto",photoService.selPhoto(1));
    request.setAttribute("right",rightService.selRight());
%>
<div id="body-wrap">
    <jsp:include page="header.jsp" />
    <main class="layout_page" id="content-inner">
        <div id="page">
            <div id="article-container">
                <h2>关于</h2>
                <ul>
                    <li>java开发路上的小敢敢</li>
                    <li>名字:${requestScope.showDescription.name}</li>
                    <li>星座:${requestScope.showDescription.constellation}</li>
                    <li>&nbsp;<span style="color:red">${requestScope.showDescription.experience}</span> </li>
                    <li>最喜欢的一句话:${requestScope.showDescription.sentence}</li>
                    <li>偶像:<span style="color:red">${requestScope.showDescription.idol}</span></li>
                    <li>性格:${requestScope.showDescription.character}</li>
                    <li>联系方式:${requestScope.showDescription.contact}</li>
                </ul>
                <h2>想对大家说的话:</h2>
                <ul>
                    <li>${requestScope.showDescription.information}</li>
                </ul>
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
                });
                </script>
            </div>

        </div>

        <jsp:include page="right.jsp" />

    </main>
    <jsp:include page="foot.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
<script src="blog/js/utils.js"></script>
<!-- <script src="js/main.js"></script> -->
<!-- <script src="js/tw_cn.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.js"></script>
<script defer id="ribbon" src="blog/js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1" mobile="true"
        data-click="false"></script>
<script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true" src="blog/js/third-party/canvas-nest.js"></script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

<script src="https://cdn.jsdelivr.net/npm/instant.page@latest/instantpage.min.js" type="module"></script>
<script src="https://cdn.jsdelivr.net/npm/lazysizes@latest/lazysizes.min.js" async=""></script>
<script id="ribbon_piao" mobile="true" src="https://cdn.jsdelivr.net/gh/jerryc127/butterfly_cdn@2.1.0/js/piao.js"></script>
<script src="blog/js/refuseF12.js"></script>
<%--<script src="blog/js/jquery-3.4.1.js"></script>--%>
<script src="blog/js/third-party/click_heart.js"></script>
<script>
    $(function () {
        $("#veditor").css("backgroundImage","url("+"${requestScope.ShowComment.placePhoto}"+")");
        if("${requestScope.ShowComment.flag}"!="true"){
            $("#post-comment").css("display","none");
        }
        $(".not-index-bg").css("background-image","url("+"${requestScope.HeaderPhoto.aboutPhoto}"+")");

    })
</script>

</body>
</html>
