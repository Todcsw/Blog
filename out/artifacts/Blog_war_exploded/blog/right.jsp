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
    request.setAttribute("runTime",userService.Login("1759864302@qq.com","485226"));
    request.setAttribute("rightTag",tagService.selAllTag());


%>
<div class="aside_content" id="aside_content">
    <div class="card-widget card-info">
        <div class="card-content">
            <div class="card-info-avatar is-center"><img class="avatar-img" src="https://s1.ax1x.com/2020/05/08/Yus5vt.jpg"
                                                         onerror="this.onerror=null;this.src='/img/friend_404.gif'" alt="avatar" />
                <div class="author-info__name">${requestScope.right.name}</div>
                <div class="author-info__description">${requestScope.right.sentence}</div>
            </div>
            <div class="card-info-data">
                <div class="card-info-data-item is-center"><a href="archives.jsp">
                    <div class="headline">文章</div>
                    <div class="length_num">${requestScope.right.blogCount}</div>
                </a></div>
                <div class="card-info-data-item is-center"> <a href="tag.jsp">
                    <div class="headline">标签</div>
                    <div class="length_num">${requestScope.right.tagCount}</div>
                </a></div>
                <div class="card-info-data-item is-center"> <a href="category.jsp">
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
                    <a class="aside-category-list_link" href="blog/detailCategory.jsp?CategoryName=${category.name}"><span class="aside-category-list_name">${category.name}</span><span class="aside-category-list_length">4</span></a>
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
<%--    <div class="card-widget card-archives">--%>
<%--        <div class="card-content">--%>
<%--            <div class="item-headline"><i class="fa fa-archive" aria-hidden="true"></i><span>时间轴</span></div>--%>
<%--            <ul class="archive-list">--%>
<%--                <li class="archive-list-item"><a class="archive-list-link" href="/archives/2020/05/"><span class="archive-list-date">2020年05月</span><span--%>
<%--                        class="archive-list-count">13</span></a></li>--%>
<%--                <li class="archive-list-item"><a class="archive-list-link" href="/archives/2020/04/"><span class="archive-list-date">2020年04月</span><span--%>
<%--                        class="archive-list-count">24</span></a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="card-widget card-webinfo">
<%--        <div class="card-content">--%>
<%--            <div class="item-headline"><i class="fa fa-line-chart" aria-hidden="true"></i><span>网站资讯</span></div>--%>
<%--            <div class="webinfo">--%>
<%--                <div class="webinfo-item">--%>
<%--                    <div class="webinfo-article-name">文章数目 :</div>--%>
<%--                    <div class="webinfo-article-count">${requestScope.right.blogCount}</div>--%>
<%--                </div>--%>
<%--                <div class="webinfo-item">--%>
<%--                    <div class="webinfo-runtime-name">已运行时间 :</div>--%>
<%--                    <div class="webinfo-runtime-count" id="webinfo-runtime-count" start_date="${runTime.createTime}"></div>--%>
<%--                </div>--%>
<%--                <div class="webinfo-item">--%>
<%--                    <div class="webinfo-site-wordcount-name">本站总字数 :</div>--%>
<%--                    <div class="webinfo-site-wordcount">54.6k</div>--%>
<%--                </div>--%>
<%--                <div class="webinfo-item">--%>
<%--                    <div class="webinfo-site-uv-name">本站访客数 :</div>--%>
<%--                    <div class="webinfo-site-uv-count" id="busuanzi_value_site_uv"></div>--%>
<%--                </div>--%>
<%--                <div class="webinfo-item">--%>
<%--                    <div class="webinfo-site-name">本站总访问量 :</div>--%>
<%--                    <div class="webinfo-site-pv-count" id="busuanzi_value_site_pv"></div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>


    <footer class="page-footer bg-color">
        <div class="waifu" style="right: 30px;">
            <%--            <div class="waifu-tips" style="width: 307px; height: 87px; top: -30px; font-size: 15px; opacity: 0;">这句一言来自--%>
            <%--                <span style="color:#0099cc;">『网易云』</span>，是 <span style="color:#0099cc;">破晓之雪</span> 在 hitokoto.cn 投稿的。--%>
            <%--            </div>--%>
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
    function DateDiff(sDate) { //sDate和eDate是yyyy-MM-dd格式
        var date1 = new Date(sDate);
        var date2 = new Date();
        var date3=date2.getTime()-date1.getTime();
        var days=Math.floor(date3/(24*3600*1000));
        return days;
    }
    $("#webinfo-runtime-count").html(DateDiff("${runTime.createTime}"));

    $(".card-tag-cloud a").each(function () {
        $(this).css("font-size",Math.random() * 10 + 18);
        $(this).css("color",randomColor1());
    })
</script>
