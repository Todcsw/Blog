<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>}">
<%--style="background-image: url('')"--%>
<div class="not-index-bg" id="nav" >
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
    <div id="page_site-info">
        <h1 id="site_title">关于</h1>
    </div>
</div>
