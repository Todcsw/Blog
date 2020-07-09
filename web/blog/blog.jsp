<%@ page import="com.csw.entity.Blog" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    Blog blog = (Blog)request.getAttribute("BlogShowInBlog");
    String blogImage=blog.getPhoto().substring(0,9)+"/"+blog.getPhoto().substring(10);
%>
<base href="<%=basePath%>}">
<!DOCTYPE html>
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

    <script>
        var autoChangeMode = '1'
    var t = "light";
    if (autoChangeMode == '1'){
        var isDarkMode = window.matchMedia("(prefers-color-scheme: dark)").matches
        var isLightMode = window.matchMedia("(prefers-color-scheme: light)").matches
        var isNotSpecified = window.matchMedia("(prefers-color-scheme: no-preference)").matches
        var hasNoSupport = !isDarkMode && !isLightMode && !isNotSpecified

        if (t === undefined){
            if (isLightMode) activateLightMode()
            else if (isDarkMode) activateDarkMode()
            else if (isNotSpecified || hasNoSupport){
                console.log('You specified no preference for a color scheme or your browser does not support it. I Schedule dark mode during night time.')
                var now = new Date()
                var hour = now.getHours()
                var isNight = hour < 6 || hour >= 18
                isNight ? activateDarkMode() : activateLightMode()
            }
        } else if (t == 'light') activateLightMode()
        else activateDarkMode()

    } else if (autoChangeMode == '2'){
        now = new Date();
        hour = now.getHours();
        isNight = hour < 6 || hour >= 18
        if(t === undefined) isNight? activateDarkMode() : activateLightMode()
        else if (t === 'light') activateLightMode()
        else activateDarkMode()
    } else {
        if ( t == 'dark' ) activateDarkMode()
        else if ( t == 'light') activateLightMode()
    }

    function activateDarkMode(){
        document.documentElement.setAttribute('data-theme', 'dark')
        if (document.querySelector('meta[name="theme-color"]') !== null){
            document.querySelector('meta[name="theme-color"]').setAttribute('content','#000')
        }
    }
    function activateLightMode(){
        document.documentElement.setAttribute('data-theme', 'light')
        if (document.querySelector('meta[name="theme-color"]') !== null){
            document.querySelector('meta[name="theme-color"]').setAttribute('content','#fff')
        }
    }</script>
    <link rel="stylesheet" href="blog/css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.css">
    <link rel="canonical" href="BlogShowServlet?blogID=${requestScope.BlogShowInBlog.id}" >
    <link rel="prev" title="java实现基数排序和堆排序" href="BlogShowServlet?blogID=${requestScope.BlogShowInBlog.id}" >
    <link rel="next" title="java实现插入排序和希尔排序" href="BlogShowServlet?blogID=${requestScope.BlogShowInBlog.id}">

    <script>(adsbygoogle = window.adsbygoogle || []).push({
        google_ad_client: 'ca-pub-4497879613836554',
        enable_page_level_ads: 'true'
    });</script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Titillium+Web">
    <script>var GLOBAL_CONFIG = {
        root: '/',
        algolia: undefined,
        localSearch: undefined,
        translate: {"defaultEncoding":2,"translateDelay":0,"cookieDomain":"https://xxx/","msgToTraditionalChinese":"繁","msgToSimplifiedChinese":"簡"},
        copy: {
            success: '复制成功',
            error: '复制错误',
            noSupport: '浏览器不支持'
        },
        bookmark: {
            message_prev: '按',
            message_next: '键将本页加入书签'
        },
        runtime_unit: '天',
        runtime: true,
        copyright: undefined,
        ClickShowText: undefined,
        medium_zoom: false,
        fancybox: true,
        Snackbar: undefined,
        baiduPush: false,
        highlightCopy: true,
        highlightLang: true,
        highlightShrink: 'false',
        isFontAwesomeV5: false,
        isPhotoFigcaption: false

    }
    </script>
    <script>var GLOBAL_CONFIG_SITE = {
        isPost: true,
        isHome: false,
        isSidebar: true
    }</script>
    <noscript>
              <style>
                  #page-header {
    opacity: 1
  }
  .justified-gallery img{
    opacity: 1
  }
  </style>
          </noscript>
    <meta name="generator" content="Hexo 4.2.0">
    <link rel="alternate" href="/atom.xml" title="行路のblog" type="application/atom+xml">
</head>
<body>
<i class="fa fa-arrow-right on" id="toggle-sidebar" aria-hidden="true"> </i>
<div id="sidebar">
    <div class="sidebar-toc">
        <div class="sidebar-toc__title">目录</div>
        <div class="sidebar-toc__progress"><span class="progress-notice">你已经读了</span><span class="progress-num">0</span><span
                class="progress-percentage">%</span>
            <div class="sidebar-toc__progress-bar"> </div>
        </div>
        <div class="sidebar-toc__content">
            <ol class="toc">
                <li class="toc-item toc-level-1">

                </li>
            </ol>
        </div>
    </div>
</div>
<div id="body-wrap">
    <div class="post-bg" id="nav" style="background-image:url(https://s1.ax1x.com/2020/05/08/YuyGRA.jpg)">
        <div id="page-header"><span class="pull_left" id="blog_name"><a class="blog_title" id="site-name" href="blog/index.jsp">行路のblog</a></span><span
                class="pull_right menus">
						<div class="menus_items">
							<div class="menus_item"><a class="site-page" href="blog/index.jsp"><i class="fa-fw fa fa-home"></i><span> 首页</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/archives.jsp"><i class="fa-fw fa fa-archive"></i><span> 时间轴</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/tag.jsp"><i class="fa-fw fa fa-tags"></i><span> 标签</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/category.jsp"><i class="fa-fw fa fa-folder-open"></i><span>
										目录</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/link.jsp"><i class="fa-fw fa fa-link"></i><span> 友情链接</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/about.jsp"><i class="fa-fw fa fa-heart"></i><span> 关于</span></a></div>
						</div><span class="toggle-menu close"><a class="site-page"><i class="fa fa-bars fa-fw" aria-hidden="true"></i></a></span>
					</span></div>
        <div id="post-info">
            <div id="post-title">
                <div class="posttitle">${requestScope.BlogShowInBlog.title}</div>
            </div>
            <div id="post-meta">
                <div class="meta-firstline">
                    <time class="post-meta__date">
                        <span class="post-meta__date-created" title="发表于 ${requestScope.BlogShowInBlog.uploadTime}">
                            <i class="fa fa-calendar" aria-hidden="true"></i> 发表于 ${requestScope.BlogShowInBlog.uploadTime}
                        </span>
                        <span class="post-meta__separator">|</span>
                        <span class="post-meta__date-updated" title="更新于 ${requestScope.BlogShowInBlog.updateTime}">
                            <i class="fa fa-history" aria-hidden="true"></i>更新于 ${requestScope.BlogShowInBlog.updateTime}
                        </span>
                    </time>
                    <span class="post-meta__categories">
                        <span class="post-meta__separator">|</span>
                        <i class="fa fa-inbox post-meta__icon" aria-hidden="true"></i>
                        <a class="post-meta__categories" href="blog/detailCategory.jsp?CategoryName=${requestScope.BlogShowInBlog.catalog}">${requestScope.BlogShowInBlog.catalog}</a>
                    </span>
                </div>
                <div class="meta-secondline">
                    <span class="post-meta-wordcount">
                        <i class="post-meta__icon fa fa-file-word-o" aria-hidden="true"></i>
                        <span>字数总计:</span>
                        <span class="word-count">${requestScope.BlogShowInBlog.content}</span>
                        <span class="post-meta__separator">|</span>
                        <i class="post-meta__icon fa fa-clock-o" aria-hidden="true"></i>
                        <span>阅读时长: 8 分钟</span>
                    </span>
                </div>
                <div class="meta-thirdline">
                    <span class="post-meta-pv-cv"><span class="post-meta__separator">|</span>
                        <i class="fa fa-eye post-meta__icon" aria-hidden="true"> </i>
                        <span>阅读量:</span>
                        <span id="busuanzi_value_page_pv">${requestScope.BlogShowInBlog.view}</span>
                    </span>
                    <span class="post-meta-commentcount">
                        <span class="post-meta__separator">|</span>
                        <i class="post-meta__icon fa fa-comment-o" aria-hidden="true"></i>
                        <span>评论数:</span>
                        <a href="BlogShowServlet?blogID=${requestScope.BlogShowInBlog.id}"
                        itemprop="discussionUrl">
                            <span class="valine-comment-count comment-count" data-xid="" itemprop="commentCount">0</span>
                        </a>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <main class="layout_post" id="content-inner">
        <article id="post">
            <div id="article-container">
                ${requestScope.BlogShowInBlog.content}
            </div>
            <div class="post-copyright">
                <div class="post-copyright__author"><span class="post-copyright-meta">文章作者: </span><span class="post-copyright-info"><a
                        href="mailto:undefined">${requestScope.InformationShowBlog.name}</a></span></div>
                <div class="post-copyright__type"><span class="post-copyright-meta">文章链接: </span><span class="post-copyright-info"><a
                        href="BlogShowServlet?blogID=${requestScope.BlogShowInBlog.id}">BlogShowServlet?blogID=${requestScope.BlogShowInBlog.id}</a></span></div>
                <div class="post-copyright__notice"><span class="post-copyright-meta">版权声明: </span><span class="post-copyright-info">本博客所有文章除特别声明外，均采用
								<a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a> 许可协议。转载请注明来自
								<a href="blog/index.jsp" target="_blank">${requestScope.SiteShowBlog.name}</a>！</span></div>
            </div>
            <div class="tag_share">
                <div class="post-meta__tag-list">
                    <c:forEach items="${requestScope.tagsList}" var="tag">
                    <a class="post-meta__tags" href="blog/detailTag.jsp?tagName=${tag}">${tag}</a>
                    </c:forEach>
                </div>
                <div class="post_share">
                    <div class="social-share" data-image="https://s1.ax1x.com/2020/05/08/YuyAPJ.jpg" data-sites="facebook,twitter,wechat,weibo,qq"></div>
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/social-share.js/dist/css/share.min.css" />
                    <script src="https://cdn.jsdelivr.net/npm/social-share.js/dist/js/social-share.min.js"></script>
                </div>
            </div>

            <div class="post-reward"><a class="reward-button button--primary button--animated"> <i class="fa fa-qrcode"></i>
                打赏<div class="reward-main">
                    <ul class="reward-all">
                        <li class="reward-item"><img class="lazyload post-qr-code__img" src="blog/error/img/wechat.jpg" alt="微信" />
                            <div class="post-qr-code__desc">微信</div>
                        </li>
                        <li class="reward-item"><img class="lazyload post-qr-code__img" src="blog/error/img/alipay.jpg" alt="支付宝" />
                            <div class="post-qr-code__desc">支付宝</div>
                        </li>
                    </ul>
                </div></a></div>
            <nav class="pagination_post" id="pagination">
                <div class="prev-post pull_left"><a href="BlogShowServlet?blogID=${requestScope.FirstOrRecentOrOther[0].id}"><img
                        class="prev_cover lazyload" data-src="${requestScope.FirstOrRecentOrOther[0].photo}" onerror="onerror=null;src='/img/404.jpg'">
                    <div class="pagination-info">
                        <div class="label">上一篇</div>
                        <div class="prev_info">${requestScope.FirstOrRecentOrOther[0].title}</div>
                    </div>
                </a></div>
                <div class="next-post pull_right"><a href="BlogShowServlet?blogID=${requestScope.FirstOrRecentOrOther[1].id}"><img
                        class="next_cover lazyload" data-src="${requestScope.FirstOrRecentOrOther[1].photo}" onerror="onerror=null;src='/img/404.jpg'">
                    <div class="pagination-info">
                        <div class="label">下一篇</div>
                        <div class="next_info">${requestScope.FirstOrRecentOrOther[1].title}</div>
                    </div>
                </a>
                </div>
            </nav>
            <div class="relatedPosts">
                <div class="relatedPosts_headline"><i class="fa fa-fw fa-thumbs-up" aria-hidden="true"></i><span> 相关推荐</span></div>
                <div class="relatedPosts_list">
                <c:forEach items="${requestScope.BlogShowOrderById}" var="blogs" begin="0" end="5" step="1">

                    <div class="relatedPosts_item">
                        <a href="BlogShowServlet?blogID=${blogs.id}" title="${blogs.title}">
                            <img class="relatedPosts_cover lazyload" data-src="${blogs.photo}">
                        <div class="relatedPosts_main is-center">
                            <div class="relatedPosts_date"><i class="fa fa-calendar fa-fw" aria-hidden="true"></i> ${blogs.uploadTime}</div>
                            <div class="relatedPosts_title">${blogs.title}</div>
                        </div>
                    </a>
                    </div>
                    </c:forEach>
                </div>
                <div class="clear_both"></div>
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
        </article>
    </main>
    <jsp:include page="foot.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
<script src="blog/js/utils.js"></script>
<script src="blog/js/main.js"></script>
<script src="blog/js/tw_cn.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.js"></script>
<script defer id="ribbon" src="blog/js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1" mobile="true"
        data-click="false"></script>
<script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true" src="blog/js/third-party/canvas-nest.js"></script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<script src="https://cdn.jsdelivr.net/npm/instant.page@latest/instantpage.min.js" type="module"></script>
<script src="https://cdn.jsdelivr.net/npm/lazysizes@latest/lazysizes.min.js" async=""></script>
<script id="ribbon_piao" mobile="true" src="https://cdn.jsdelivr.net/gh/jerryc127/butterfly_cdn@2.1.0/js/piao.js"></script>
<script src="blog/js/refuseF12.js"></script>
<script src="blog/js/third-party/click_heart.js"></script>

<script>
    $(function () {


        var tags="${requestScope.BlogShowInBlog.tags}".split(',');

        //对上一篇下一篇动态显示
        if("${requestScope.isFirstOrRecentOrOther}"=="1"){
            //只显示上一篇
            $(".next-post").css("display","none"); //下面的div不显示
            $(".prev-post").addClass("pull-full");
        }else if("${requestScope.isFirstOrRecentOrOther}"=="2"){
            //只显示下一篇
            $(".next-post").css("display","none"); //下面的div不显示
            $(".prev-post").removeClass("pull_left");
            $(".prev-post").addClass("pull-right");
            $(".pagination-info .label").text("下一篇")
        }

        var word_count=$(".word-count").html();
        $(".word-count").html(word_count.length);


        //comment相关信息
        $("#veditor").css("backgroundImage","url("+"${requestScope.ShowComment.placePhoto}"+")");
        if("${requestScope.ShowComment.flag}"!="true"){
            $("#post-comment").css("display","none");
        }


        //获取顶部图片链接地址
        var photoHref="url("+"<%=blogImage%>"+")";
        //顶部背景图片
        if(photoHref.indexOf("BlogPhoto")!=-1){
            $(".post-bg").css("background-image",photoHref);
        }else{
            $(".post-bg").css("background-image","url("+'${requestScope.BlogShowInBlog.photo}'+")");
        }


        var headsContent=[];
        var headsTag=[];

        function getH1ToH6() {
            //查找h1-h6
            $("#article-container :header").each(function(){
                headsContent.push($(this).html());
                headsTag.push($(this).prop("tagName"));
            });
        }
        getH1ToH6();


        //将标题存入侧边栏
        for(var i=0;i<headsContent.length;i++){
            $(".toc-level-1").append("<span class='toc-text'>"+headsTag[i]+"  "+headsContent[i]+"</span><br>")
        }


    })
</script>
</body>
</html>

