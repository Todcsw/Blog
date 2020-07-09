<%@ page import="com.csw.service.impl.RightServiceImpl" %>
<%@ page import="com.csw.service.RightService" %>
<%@ page import="com.csw.service.CommentService" %>
<%@ page import="com.csw.service.impl.CommentServiceImpl" %>
<%@ page import="com.csw.service.LinkService" %>
<%@ page import="com.csw.service.impl.LinkServiceImpl" %>
<%@ page import="com.csw.service.PhotoService" %>
<%@ page import="com.csw.service.impl.PhotoServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 17:35
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

    CommentService commentService=new CommentServiceImpl();
    LinkService linkService=new LinkServiceImpl();
    PhotoService photoService=new PhotoServiceImpl();
    RightService rightService=new RightServiceImpl();

    request.setAttribute("right",rightService.selRight());
    request.setAttribute("ShowComment",commentService.selComment());
    request.setAttribute("ShowLink",linkService.selAllLink());
    request.setAttribute("HeaderPhoto",photoService.selPhoto(1));
%>
<!DOCTYPE html>
<html lang="zh-CN" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>友情链接 | 行路のblog</title>
    <meta property="og:image" content="https://todcsw.github.io/img/post.jpg">
    <link rel="stylesheet" href="blog/css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.css">
    <link rel="canonical" href="https://todcsw.github.io/about/">
    <meta name="generator" content="Hexo 4.2.0">
</head>
<body>

<div id="body-wrap">
    <jsp:include page="header.jsp" />
    <main class="layout_page" id="content-inner">
        <div id="page">
            <div class="flink" id="article-container">
                <h2>友情链接</h2>
                <div class="post-cards">
                    <div class="md-links">
                        <c:forEach  items="${requestScope.ShowLink}" var="link">
                        <div class="md-links-item">
                            <a href="${link.url}" title="${link.name}" target="_blank">
                                <img class="lazyload" data-src="${link.hphoto}"
                                     onerror="this.onerror=null; this.src='/img/friend_404.gif' "alt='${link.name}' src="${link.hphoto}">
                                <div class="md-links-title">${link.name}</div>
                                <div class="md-links-des">${link.introduce}</div>
                            </a>
                        </div>
                        </c:forEach>
                    </div>
                </div>

                <h2>我的资料</h2>
<%--这里需要手动填写自己的友情链接信息,方便别人添加--%>
<%--                <ul>--%>
<%--                    <li>Blog名字: 圣文のblog</li>--%>
<%--                    <li>Blog地址: <a href="https://todcsw.github.io/">https://todcsw.github.io/</a></li>--%>
<%--                    <li>Blog头像:<a href="https:Todcsw.github.io/images/avatar.png">https:Todcsw.github.io/images/avatar.png</a></li>--%>
<%--                    <li>blog简介:学深夜的习,读清晨的书</li>--%>
<%--                </ul>--%>
                <hr>

                <h2>欢迎留言,交换友链</h2>
            </div>
            <hr>
            <div id="post-comment">
                <div class="comment_headling"><i class="fa fa-comments fa-fw" aria-hidden="true"></i><span> 评论</span></div>
                <div class="vcomment" id="vcomment"></div>
                <script src="https://cdn.jsdelivr.net/npm/valine/dist/Valine.min.js"></script>
                <script>
                    var GUEST_INFO = ['nick','mail','link'];
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
<!-- 	<script src="js/main.js"></script>
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

        $("#site_title").html("友情链接");
        //顶部背景图片
        $(".not-index-bg").css("background-image","url("+"${requestScope.HeaderPhoto.linkPhoto}"+")");
    })
</script>
</body>
</html>

