<%@ page import="com.csw.entity.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="com.csw.util.MarkDownUtil" %>
<%@ page import="com.csw.util.Page" %>
<%@ page import="com.csw.service.impl.*" %>
<%@ page import="com.csw.service.*" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<base href="<%=basePath%>}">

<%
    //分页
    int start = 0;
    int count = 6;
    int pageNumber=1;
    try {

        pageNumber=Integer.parseInt(request.getParameter("page"));
        start = Integer.parseInt(request.getParameter("page.start"));
        count = Integer.parseInt(request.getParameter("page.count"));

    } catch (Exception e) {

    }
    Page pageBreak = new Page(start, count,pageNumber);

    SiteService siteService=new SiteServiceImpl();
    BlogService blogService = new BlogServiceImpl();
    RightService rightService = new RightServiceImpl();
    PhotoService photoService = new PhotoServiceImpl();
    pageBreak.setTotal(blogService.selAllBlogCount());

    request.setAttribute("pageBreak", pageBreak);
    request.setAttribute("ShowBlogByPage", selAllBlogToHtml(blogService.selBlogByPage(pageBreak.ToStart(pageBreak.getPageNumber(),pageBreak.getCount()), pageBreak.getCount())));


    request.setAttribute("right", rightService.selRight());
    request.setAttribute("ShowIndex", selAllBlogToHtml(blogService.selAllBlog()));
    request.setAttribute("HeaderPhoto", photoService.selPhoto(1));
    request.setAttribute("showIndexCount", blogService.selAllBlogCount());
    request.setAttribute("site",siteService.selSite());


%>
<%!
    public static List<Blog> selAllBlogToHtml(List<Blog> list) {
        for (Blog blog : list) {
            blog.setContent(MarkDownUtil.mdToHtml(blog.getContent()));
        }
        return list;
    }
%>
<html lang="zh-CN" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>首页 | ${requestScope.site.name}</title>
    <meta property="og:image" content="https://todcsw.github.io/img/post.jpg">
    <link rel="stylesheet" href="blog/css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.css">
<%--    <link rel="canonical" href="https://todcsw.github.io/about/">--%>
    <meta name="generator" content="Hexo 4.2.0">
    <style>
        .pageJump {
            display: inline-block;
            padding-left: 0;

            margin: 0px 0px 0px 60px;
            border-radius: 4px;
            vertical-align: top;
        }
        .pageJump input {
            width: 40px;
        }
        .pageJump .button ,.pageJump input  {
            font-size: 16px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
        }

    </style>
</head>
<body>
<div id="body-wrap">
    <div class="full_page" id="nav" style="background-image: url(https://s1.ax1x.com/2020/05/08/YurCQ0.jpg)">
        <div id="page-header"><span class="pull_left" id="blog_name"><a class="blog_title" id="site-name"
                                                                        href="blog/index.jsp">${requestScope.site.name}</a></span><span
                class="pull_right menus">
						<div class="menus_items">
							<div class="menus_item"><a class="site-page" href="blog/index.jsp"><i
                                    class="fa-fw fa fa-home"></i><span> 首页</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/archives.jsp"><i
                                    class="fa-fw fa fa-archive"></i><span> 时间轴</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/tag.jsp"><i
                                    class="fa-fw fa fa-tags"></i><span> 标签</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/category.jsp"><i
                                    class="fa-fw fa fa-folder-open"></i><span>
										目录</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/link.jsp"><i
                                    class="fa-fw fa fa-link"></i><span> 友情链接</span></a></div>
							<div class="menus_item"><a class="site-page" href="blog/about.jsp"><i
                                    class="fa-fw fa fa-heart"></i><span> 关于</span></a></div>
						</div><span class="toggle-menu close"><a class="site-page"><i class="fa fa-bars fa-fw"
                                                                                      aria-hidden="true"></i></a></span>
					</span>
        </div>
        <div id="site-info">
            <h1 id="site_title">${requestScope.site.name}</h1>
            <div id="site_subtitle"><span id="subtitle"></span></div>
            <div id="site_social_icons" style="display: block">
                <a class="social-icon" href="${requestScope.right.github}" target="_blank" title="Github">
                    <i class="fa fa-github" aria-hidden="true"></i>
                </a>
                <a class="social-icon" href="mailto:${requestScope.right.email}" target="_blank" title="Email">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                </a>
                <a class="social-icon" href="index.jsp" target="_blank" title="RSS">
                    <i class="fa fa-rss" aria-hidden="true"></i>
                </a>
            </div>
        </div>
        <div id="scroll_down"><i class="fa fa-angle-down scroll-down-effects"></i></div>
    </div>
    <main class="layout_page" id="content-inner">
        <div class="recent-posts" id="recent-posts">
            <c:forEach items="${requestScope.ShowBlogByPage}" var="blog">
                <div class="recent-post-item">
                    <div class="post_cover left_radius">
                        <a href="BlogShowServlet?blogID=${blog.id}" title="${blog.title}">
                            <img class="post_bg lazyload" data-src="${blog.photo}"
                                 onerror="this.onerror=null;this.src='/img/404.jpg'" alt="${blog.title}">
                        </a>
                    </div>
                    <div class="recent-post-info">
                        <a class="article-title" href="BlogShowServlet?blogID=${blog.id}"
                           title="${blog.title}">${blog.title}</a>
                        <div class="article-meta-wrap">
                            <time class="post-meta__date" title="发表于 ${blog.uploadTime}"><i class="fa fa-calendar"
                                                                                            aria-hidden="true"></i>${blog.uploadTime}
                            </time>
                            <span class="article-meta"><span class="article-meta__separator">|</span>
                            <i class="fa fa-inbox article-meta__icon" aria-hidden="true"></i>
                            <a class="article-meta__categories" href="/categories/mysql/">${blog.catalog}</a>
                        </span>
                        </div>
                        <div class="content">${blog.content}</div>
                    </div>

                </div>
            </c:forEach>

            <nav id="pagination" style="margin-top: 1.7rem;">
                <div class="pagination">
                    <a class="extend prev" id="prevBlogPage" rel="prev" href="blog/index.jsp?page=${pageBreak.pageNumber-1}">
                        <i class="fa fa-fw fa-chevron-left" aria-hidden="true"></i>
                    </a>
                    <a id="FirstPage" class="page-number current" href="blog/index.jsp?page=1">1</a>
                    <c:forEach begin="2" end="3" step="1" varStatus="var">
                    <a class="page-number" href="blog/index.jsp?page=${var.current}">${var.current}</a>
                    </c:forEach>

                    <c:if test="${pageBreak.getTotalPage()>3&&pageBreak.pageNumber-2>3}">
                        <a class="space"  >&hellip;</a>
                    </c:if>

                    <c:if test="${pageBreak.pageNumber>3}">

                        <c:if test="${pageBreak.pageNumber!=4}" >
                        <a class="page-number" href="blog/index.jsp?page=${pageBreak.pageNumber-1}">${pageBreak.pageNumber-1}</a>
                        </c:if>

                        <c:if test="${pageBreak.getTotalPage()!=pageBreak.pageNumber}">
                        <a class="page-number" href="blog/index.jsp?page=${pageBreak.pageNumber}">${pageBreak.pageNumber}</a>
                        </c:if>

                        <c:if test="${pageBreak.getTotalPage()>pageBreak.pageNumber+1}">
                        <a class="page-number" href="blog/index.jsp?page=${pageBreak.pageNumber+1}">${pageBreak.pageNumber+1}</a>
                        </c:if>

                    </c:if>

                    <c:if test="${pageBreak.getTotalPage()>3&&pageBreak.pageNumber!=pageBreak.getTotalPage()&&pageBreak.pageNumber+3<pageBreak.getTotalPage()}">
                        <a class="space"  >&hellip;</a>
                    </c:if>

                    <c:if test="${pageBreak.getTotalPage()>3}">
                    <a class="page-number" href="blog/index.jsp?page=${pageBreak.getTotalPage()}">${pageBreak.getTotalPage()}</a>
                    </c:if>
                    <a class="extend next" id="nextBlogPage" rel="next" href="blog/index.jsp?page=${pageBreak.pageNumber+1}">
                        <i class="fa fa-fw fa-chevron-right" aria-hidden="true"></i>
                    </a>

<%--                    <input type="text" name="gotoPage" placeholder="请输入要跳转的页数">--%>
                    <div class="pageJump">
                        <span>跳转到</span>
                        <input type="text" id="goToPage" name="goToPage" value=""/>
                        <span>页</span>
                        <button  type="button" class="button" onclick="goToPage()">确定</button>
                    </div>
                </div>



            </nav>
        </div>



        <jsp:include page="right.jsp"/>


    </main>








    <jsp:include page="foot.jsp"/>



    <script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
    <script src="blog/js/utils.js"></script>
     <script src="blog/js/main.js"></script>
<%--    <script src="blog/js/tw_cn.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.js"></script>
    <script defer id="ribbon" src="blog/js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1"
            mobile="true"
            data-click="true"></script>
    <script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true"
            src="blog/js/third-party/canvas-nest.js"></script>
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/instant.page@latest/instantpage.min.js" type="module"></script>
    <script src="https://cdn.jsdelivr.net/npm/lazysizes@latest/lazysizes.min.js" async=""></script>
    <script src="blog/js/third-party/click_heart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/typed.js"></script>
    <script id="ribbon_piao" mobile="true" src="https://cdn.jsdelivr.net/gh/jerryc127/butterfly_cdn@2.1.0/js/piao.js"></script>
<%--    <script src="blog/js/refuseF12.js"></script>--%>
    <script src="blog/js/jquery.min.js"></script>
    <script>

        //跳转到指定页
        function goToPage() {

            var pageNum=$("#goToPage").val();

            pageNum=parseInt(pageNum);

            window.location.href="blog/index.jsp?page="+pageNum;
        }

        var subtitleEffect = true
        if (subtitleEffect) {
            var typed = new Typed("#subtitle", {
                strings: '${requestScope.site.description}'.split(","),
                startDelay: 300,
                typeSpeed: 150,
                loop: false,
                backSpeed: 50
            })
        } else {
            document.getElementById("subtitle").innerHTML = '${requestScope.site.description}'
        }

        $(function () {

            //得到=后的页码  分页
            var sub=(window.location+"").split("=");

            if(sub[1]!="1"){
                $("#FirstPage").removeClass("current");
            }

            if(sub[1]==undefined){
                $("#FirstPage").addClass("current");
            }
            //为改页码加入样式
            $(".pagination a").each(function () {
                if($(this).html()==sub[1]){
                    $(this).addClass("current");
                }
            })

            if(sub[1]=="1"||sub[1]==undefined){
                $("#prevBlogPage").css("display","none");
            }

            if(sub[1]=="${pageBreak.getTotalPage()}"){
                $("#nextBlogPage").css("display","none");
            }


            $(".pagination a").each(function () {
                if(parseInt($(this).html())>parseInt("${pageBreak.getTotalPage()}")){
                    $(this).css("display","none");
                }
            })


            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
            //分页

            $(".post_cover:odd").removeClass("left_radius");
            $(".post_cover:odd").addClass("right_radius");


            $(".post_cover:even").addClass("left_radius"); //偶数

            $(".full_page").css("background-image", "url(" + "${requestScope.HeaderPhoto.indexPhoto}" + ")");

            // 除去HTML标签方法
            ;(function ($) {
                $.fn.stripHtmlTag = function () {
                    // 使用正则进行匹配
                    var regexp = /<("[^"]*"|'[^']*'|[^'">])*>/gi;
                    this.each(function () {
                        $(this).html($(this).html().replace(regexp, ''));
                    });
                    return $(this);
                }
            })(jQuery);

            //对部分内容进行替换
            $(".content").each(function () {
                $(this).text($(this).stripHtmlTag().html().substring(0, 1000));
            })

        })
    </script>
</body>
</html>

