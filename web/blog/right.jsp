<%@ page import="com.csw.service.BlogService" %>
<%@ page import="com.csw.service.impl.BlogServiceImpl" %>
<%@ page import="com.csw.service.TagService" %>
<%@ page import="com.csw.service.impl.TagServiceImpl" %>
<%@ page import="com.csw.service.UserService" %>
<%@ page import="com.csw.service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    TagService tagService=new TagServiceImpl();
    UserService userService=new UserServiceImpl();
    request.setAttribute("rightTag",tagService.selAllTag());


%>
<div class="aside_content" id="aside_content">
    <div class="card-widget card-info">
        <div class="card-content">
            <div class="card-info-avatar is-center"><img class="avatar-img" src="${requestScope.right.avatar}"
                                                         onerror="this.onerror=null;this.src='/img/friend_404.gif'" alt="avatar" />
                <div class="author-info__name">${requestScope.right.name}</div>
                <div class="author-info__description">${requestScope.right.sentence}</div>
            </div>
            <div class="card-info-data">
                <div class="card-info-data-item is-center"><a href="blog/archives.jsp">
                    <div class="headline">文章</div>
                    <div class="length_num">${requestScope.right.blogCount}</div>
                </a></div>
                <div class="card-info-data-item is-center"> <a href="blog/tag.jsp">
                    <div class="headline">标签</div>
                    <div class="length_num">${requestScope.right.tagCount}</div>
                </a></div>
                <div class="card-info-data-item is-center"> <a href="blog/category.jsp">
                    <div class="headline">分类</div>
                    <div class="length_num">${requestScope.right.categoryCount}</div>
                </a></div>
            </div>
            <div class="card-info-bookmark is-center"><a class="bookmark button--primary button--animated" id="bookmark-it"
                                                         href="javascript:;" title="加入书签" target="_self"><i class="fa fa-bookmark" aria-hidden="true"></i><span>加入书签</span></a></div>
            <div class="card-info-social-icons is-center">
                <a class="social-icon" href="${requestScope.right.github}" target="_blank" title="Github">
                    <i class="fa fa-github" aria-hidden="true"></i>
                </a>
                <a class="social-icon" id="emailMailto" href="mailto:${requestScope.right.email}" target="_blank" title="Email">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                </a>
                <a class="social-icon" href="/" target="_blank" title="RSS">
                    <i class="fa fa-rss" aria-hidden="true"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="card-widget card-announcement">
        <div class="card-content">
            <div class="item-headline"><i class="fa fa-bullhorn card-announcement-animation" aria-hidden="true"></i><span>公告</span></div>
            <div class="announcement_content">${requestScope.right.notice}</div>
        </div>
    </div>
    <div class="card-widget card-recent-post">
        <div class="card-content">
            <div class="item-headline"><i class="fa fa-history" aria-hidden="true"></i><span>最新文章</span></div>
            <div class="aside-recent-item">
                <c:forEach items="${requestScope.right.blogs}" var="blog">
                <div class="aside-recent-post">
                    <a href="BlogShowServlet?blogID=${blog.id}">
                    <div class="aside-post-cover">
                        <img class="aside-post-bg lazyload" data-src="${blog.photo}" onerror="this.onerror=null;this.src='img/404.jpg'" title="${blog.title}" alt="${blog.title}" src="${blog.photo}" />
                    </div>
                    <div class="aside-post-title">
                        <div class="aside-post_title" href="BlogShowServlet?blogID=${blog.id}" title="${blog.title}">${blog.title}</div>
                        <time class="aside-post_meta post-meta__date" title="发表于 ${blog.uploadTime}">${blog.uploadTime}</time>
                    </div>
                </a>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="card-widget card-categories">
        <div class="card-content">
            <div class="item-headline"><i class="fa fa-folder-open" aria-hidden="true"></i>
                <span>分类</span>
            </div>
            <ul class="aside-category-item">
                <c:forEach items="${requestScope.right.categories}" var="category" begin="0" end="4" step="1">
                <li class="aside-category-list">
                    <a class="aside-category-list_link" href="blog/detailCategory.jsp?CategoryName=${category.name}"><span class="aside-category-list_name">${category.name}</span><span class="aside-category-list_length">${category.count}</span></a>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="card-widget card-tags">
        <div class="card-content">
            <div class="item-headline"><i class="fa fa-tags" aria-hidden="true"></i><span>标签</span></div>
            <div class="card-tag-cloud">

                <c:forEach items="${requestScope.rightTag}" var="tag">
                <a href="blog/detailTag.jsp?tagName=${tag.name}">${tag.name}</a>
                </c:forEach>
            </div>
        </div>
    </div>


    <div class="card-widget card-webinfo">



    <footer class="page-footer bg-color">
        <div class="waifu" style="right: 30px;">

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
        <script>live2d_settings.hitokotoAPI = "hitokoto.cn", live2d_settings.modelId = 2, live2d_settings.modelTexturesId = 60, live2d_settings.modelStorage = !1, live2d_settings.waifuSize = "300x267", live2d_settings.waifuTipsSize = "285x75", live2d_settings.waifuFontSize = "15px", live2d_settings.waifuToolFont = "18px", live2d_settings.waifuToolLine = "25px", live2d_settings.waifuToolTop = "-30px", live2d_settings.waifuEdgeSide = "right:30", live2d_settings.waifuDraggable = "axis-x", live2d_settings.canTurnToAboutPage = !1, live2d_settings.canTakeScreenshot = !1, live2d_settings.homePageUrl = "http://localhost:8080/Blog/blog/index.jsp", initModel("https://cdn.jsdelivr.net/gh/Tokisaki-Galaxy/res/site/waifu/waifu-tips.json")</script>
    </footer>


    </div>




</div>
<script src="blog/js/jquery.min.js"></script>
<script>
    function randomColor1(){
        var r = Math.floor(Math.random()*256);
        var g = Math.floor(Math.random()*256);
        var b = Math.floor(Math.random()*256);
        if(r < 16){
            r = "0"+r.toString(16);
        }else{
            r = r.toString(16);
        }
        if(g < 16){
            g = "0"+g.toString(16);
        }else{
            g = g.toString(16);
        }
        if(b < 16){
            b = "0"+b.toString(16);
        }else{
            b = b.toString(16);
        }
        return "#"+r+g+b;
    }


    $(".card-tag-cloud a").each(function () {
        $(this).css("font-size",Math.random() * 10 + 18);
        $(this).css("color",randomColor1());
    })
</script>
