<%@ page import="com.csw.service.BlogService" %>
<%@ page import="com.csw.service.impl.BlogServiceImpl" %>
<%@ page import="com.csw.service.PhotoService" %>
<%@ page import="com.csw.service.impl.PhotoServiceImpl" %>
<%@ page import="com.csw.service.RightService" %>
<%@ page import="com.csw.service.impl.RightServiceImpl" %>


<%@ page import="com.csw.entity.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="com.csw.util.MarkDownUtil" %>
<%@ page import="com.csw.util.Page" %>

<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 17:38
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


    BlogService blogService=new BlogServiceImpl();
    PhotoService photoService=new PhotoServiceImpl();
    RightService rightService=new RightServiceImpl();

    //分页
    pageBreak.setTotal(blogService.selAllBlogCount());
    request.setAttribute("pageBreak", pageBreak);
    request.setAttribute("ShowBlogByPage", selAllBlogToHtml(blogService.selBlogByPage(pageBreak.ToStart(pageBreak.getPageNumber(),pageBreak.getCount()), pageBreak.getCount())));

    request.setAttribute("right",rightService.selRight());
    request.setAttribute("ShowArchives",selAllBlogToHtml(blogService.selAllBlog()));
    request.setAttribute("HeaderPhoto",photoService.selPhoto(1));
    request.setAttribute("showArchivesCount",blogService.selAllBlogCount());
%>
<%!
    public static List<Blog> selAllBlogToHtml(List<Blog> list){
        for(Blog blog:list){
            blog.setContent(MarkDownUtil.mdToHtml(blog.getContent()));
        }
        return list;
    }
%>
<!DOCTYPE html>
<html lang="zh-CN" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>时间轴 | 行路のblog</title>
    <meta property="og:image" content="https://todcsw.github.io/img/post.jpg">
    <link rel="stylesheet" href="blog/css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.css">
    <link rel="canonical" href="https://todcsw.github.io/about/">
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
    <jsp:include page="header.jsp" />
    <main class="layout_page" id="content-inner">
        <div id="archive">
            <div class="article-sort-title">文章总览 - ${requestScope.showArchivesCount}</div>
            <div class="article-sort">
                <div class="article-sort-item year" id="getFullYear">2020</div>

                <c:forEach items="${requestScope.ShowBlogByPage}" var="blog" begin="0" end="${pageBreak.count}" step="1" >
                <div class="article-sort-item">
                    <div class="article-sort-img">
                        <a class="article-sort-item__img" href="BlogShowServlet?blogID=${blog.id}">
                            <img src="${blog.photo}" alt="${blog.title}" onerror="this.onerror=null;this.src='/img/404.jpg'">
                        </a>
                    </div>
                    <div class="article-sort-post">
                        <a class="article-sort-item__post" href="BlogShowServlet?blogID=${blog.id}">
                            <i class="fa fa-clock-o" aria-hidden="true"></i>
                            <time class="article-sort-item__time" title="发表于 ${blog.uploadTime}">${blog.uploadTime}</time>
                            <div class="article-sort-item__title">${blog.title}</div>
                        </a>
                    </div>
                </div>
                </c:forEach>
            </div>

            <%--分页--%>
            <nav id="pagination">
                <div class="pagination">
                    <a class="extend prev" id="prevBlogPage" rel="prev" href="blog/archives.jsp?page=${pageBreak.pageNumber-1}">
                        <i class="fa fa-fw fa-chevron-left" aria-hidden="true"></i>
                    </a>
                    <a id="FirstPage" class="page-number current" href="blog/archives.jsp?page=1">1</a>
                    <c:forEach begin="2" end="3" step="1" varStatus="var">
                        <a class="page-number" href="blog/archives.jsp?page=${var.current}">${var.current}</a>
                    </c:forEach>

                    <c:if test="${pageBreak.getTotalPage()>3&&pageBreak.pageNumber-2>3}">
                        <a class="space"  >&hellip;</a>
                    </c:if>

                    <c:if test="${pageBreak.pageNumber>3}">

                        <c:if test="${pageBreak.pageNumber!=4}" >
                            <a class="page-number" href="blog/archives.jsp?page=${pageBreak.pageNumber-1}">${pageBreak.pageNumber-1}</a>
                        </c:if>

                        <c:if test="${pageBreak.getTotalPage()!=pageBreak.pageNumber}">
                            <a class="page-number" href="blog/archives.jsp?page=${pageBreak.pageNumber}">${pageBreak.pageNumber}</a>
                        </c:if>

                        <c:if test="${pageBreak.getTotalPage()>pageBreak.pageNumber+1}">
                            <a class="page-number" href="blog/archives.jsp?page=${pageBreak.pageNumber+1}">${pageBreak.pageNumber+1}</a>
                        </c:if>

                    </c:if>

                    <c:if test="${pageBreak.getTotalPage()>3&&pageBreak.pageNumber!=pageBreak.getTotalPage()&&pageBreak.pageNumber+3<pageBreak.getTotalPage()}">
                        <a class="space"  >&hellip;</a>
                    </c:if>

                    <c:if test="${pageBreak.getTotalPage()>3}">
                        <a class="page-number" href="blog/archives.jsp?page=${pageBreak.getTotalPage()}">${pageBreak.getTotalPage()}</a>
                    </c:if>

                    <a class="extend next" id="nextBlogPage" rel="next" href="blog/archives.jsp?page=${pageBreak.pageNumber+1}">
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


        <jsp:include page="right.jsp" />
    </main>
    <jsp:include page="foot.jsp" />
</div>

<%--<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script> -->--%>
<script src="blog/js/utils.js"></script>
<!-- <script src="js/main.js"></script>
<script src="js/tw_cn.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.js"></script> -->
<script defer id="ribbon" src="blog/js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1" mobile="true"
        data-click="false"></script>
<script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true" src="blog/js/third-party/canvas-nest.js"></script>
<!-- <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<script src="https://cdn.jsdelivr.net/npm/instant.page@latest/instantpage.min.js" type="module"></script>
<script src="https://cdn.jsdelivr.net/npm/lazysizes@latest/lazysizes.min.js" async=""></script> -->
<script src="blog/js/third-party/click_heart.js"></script>
<script id="ribbon_piao" mobile="true" src="https://cdn.jsdelivr.net/gh/jerryc127/butterfly_cdn@2.1.0/js/piao.js"></script>
<script src="blog/js/refuseF12.js"></script>
<script src="blog/js/jquery.min.js"></script>
<script>
    $(function () {

        //跳转到指定页
        function goToPage() {

            var pageNum=$("#goToPage").val();

            pageNum=parseInt(pageNum);

            window.location.href="blog/archives.jsp?page="+pageNum;
        }



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

        $(".pagination a").each(function () {
            if(parseInt($(this).html())>parseInt("${pageBreak.getTotalPage()}")){
                $(this).css("display","none");
            }
        })
        //分页



        var date = new Date();
        var year = date.getFullYear();
        $("#getFullYear").val(year);

        $("#site_title").html("时间轴");
        //顶部背景图片
        $(".not-index-bg").css("background-image","url("+"${requestScope.HeaderPhoto.aboutPhoto}"+")");

    })
</script>
</body>
</html>

