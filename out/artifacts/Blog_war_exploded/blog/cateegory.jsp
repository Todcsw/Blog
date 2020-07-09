<%--
  Created by IntelliJ IDEA.
  User: 行路
  Date: 2020/6/11
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-CN" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>目录 | 行路のblog</title>
    <meta property="og:image" content="https://todcsw.github.io/img/post.jpg">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.css">
    <link rel="canonical" href="https://todcsw.github.io/about/">
    <meta name="generator" content="Hexo 4.2.0">
</head>
<body>
<div id="mobile-sidebar">
    <div id="menu_mask"></div>
    <div id="mobile-sidebar-menus">
        <div class="mobile_author_icon"><img class="avatar-img" src="https://s1.ax1x.com/2020/05/08/Yus5vt.jpg" onerror="onerror=null;src='/img/friend_404.gif'"
                                             alt="avatar" /></div>
        <div class="mobile_post_data">
            <div class="mobile_data_item is-center">
                <div class="mobile_data_link"><a href="/archives/">
                    <div class="headline">文章</div>
                    <div class="length_num">37</div>
                </a></div>
            </div>
            <div class="mobile_data_item is-center">
                <div class="mobile_data_link"><a href="/tags/">
                    <div class="headline">标签</div>
                    <div class="length_num">7</div>
                </a></div>
            </div>
            <div class="mobile_data_item is-center">
                <div class="mobile_data_link"><a href="/categories/">
                    <div class="headline">分类</div>
                    <div class="length_num">5</div>
                </a></div>
            </div>
        </div>
        <hr />
        <div class="menus_items">
            <div class="menus_item"><a class="site-page" href="/"><i class="fa-fw fa fa-home"></i><span> 首页</span></a></div>
            <div class="menus_item"><a class="site-page" href="/archives/"><i class="fa-fw fa fa-archive"></i><span> 时间轴</span></a></div>
            <div class="menus_item"><a class="site-page" href="/tags/"><i class="fa-fw fa fa-tags"></i><span> 标签</span></a></div>
            <div class="menus_item"><a class="site-page" href="/categories/"><i class="fa-fw fa fa-folder-open"></i><span> 目录</span></a></div>
            <div class="menus_item"><a class="site-page" href="/link/"><i class="fa-fw fa fa-link"></i><span> 友情链接</span></a></div>
            <div class="menus_item"><a class="site-page" href="/about/"><i class="fa-fw fa fa-heart"></i><span> 关于</span></a></div>
        </div>
    </div>
</div>
<div id="body-wrap">
    <div class="not-index-bg" id="nav" style="background-image: url(/img/index3.jpg)">
        <div id="page-header"><span class="pull_left" id="blog_name"><a class="blog_title" id="site-name" href="/">行路のblog</a></span><span
                class="pull_right menus">
						<div class="menus_items">
							<div class="menus_item"><a class="site-page" href="/"><i class="fa-fw fa fa-home"></i><span> 首页</span></a></div>
							<div class="menus_item"><a class="site-page" href="/archives/"><i class="fa-fw fa fa-archive"></i><span> 时间轴</span></a></div>
							<div class="menus_item"><a class="site-page" href="/tags/"><i class="fa-fw fa fa-tags"></i><span> 标签</span></a></div>
							<div class="menus_item"><a class="site-page" href="/categories/"><i class="fa-fw fa fa-folder-open"></i><span>
										目录</span></a></div>
							<div class="menus_item"><a class="site-page" href="/link/"><i class="fa-fw fa fa-link"></i><span> 友情链接</span></a></div>
							<div class="menus_item"><a class="site-page" href="/about/"><i class="fa-fw fa fa-heart"></i><span> 关于</span></a></div>
						</div><span class="toggle-menu close"><a class="site-page"><i class="fa fa-bars fa-fw" aria-hidden="true"></i></a></span>
					</span></div>
        <div id="page_site-info">
            <h1 id="site_title">目录</h1>
        </div>
    </div>
    <main class="layout_page" id="content-inner">
        <div class="category-content">
            <div class="category-lists">
                <div class="category__title">分类 - <span class="category__amount">5</span></div>
                <div>
                    <ul class="category-list">
                        <li class="category-list-item"><a class="category-list-link" href="/categories/mysql/">mysql</a><span class="category-list-count">4</span></li>
                        <li class="category-list-item"><a class="category-list-link" href="/categories/%E4%BD%9C%E4%B8%9A/">作业</a><span
                                class="category-list-count">1</span></li>
                        <li class="category-list-item"><a class="category-list-link" href="/categories/%E6%95%99%E7%A8%8B/">教程</a><span
                                class="category-list-count">1</span></li>
                        <li class="category-list-item"><a class="category-list-link" href="/categories/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/">数据结构</a><span
                                class="category-list-count">29</span></li>
                        <li class="category-list-item"><a class="category-list-link" href="/categories/%E7%94%9F%E6%B4%BB/">生活</a><span
                                class="category-list-count">1</span></li>
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
                    appId: '4nM0zEpMHezlRD7JsbR0HeA0-gzGzoHsz',
                    appKey: 'UAXBe9xReElHLthIeF6P3a0x',
                    placeholder: '欢迎留言！在这里说出你的想法！',
                    avatar: 'monsterid',
                    meta: guest_info,
                    pageSize: '10',
                    lang: 'zh-cn',
                    recordIP: false,
                    serverURLs: ''
                });</script>
            </div>
        </div>
        <div class="aside_content" id="aside_content">
            <div class="card-widget card-info">
                <div class="card-content">
                    <div class="card-info-avatar is-center"><img class="avatar-img" src="https://s1.ax1x.com/2020/05/08/Yus5vt.jpg"
                                                                 onerror="this.onerror=null;this.src='/img/friend_404.gif'" alt="avatar" />
                        <div class="author-info__name">Todcsw</div>
                        <div class="author-info__description">学深夜的习,读清晨的书</div>
                    </div>
                    <div class="card-info-data">
                        <div class="card-info-data-item is-center"><a href="/archives">
                            <div class="headline">文章</div>
                            <div class="length_num">37</div>
                        </a></div>
                        <div class="card-info-data-item is-center"> <a href="/tags">
                            <div class="headline">标签</div>
                            <div class="length_num">7</div>
                        </a></div>
                        <div class="card-info-data-item is-center"> <a href="/categories">
                            <div class="headline">分类</div>
                            <div class="length_num">5</div>
                        </a></div>
                    </div>
                    <div class="card-info-bookmark is-center"><a class="bookmark button--primary button--animated" id="bookmark-it"
                                                                 href="javascript:;" title="加入书签" target="_self"><i class="fa fa-bookmark" aria-hidden="true"></i><span>加入书签</span></a></div>
                    <div class="card-info-social-icons is-center"><a class="social-icon" href="https://github.com/Todcsw" target="_blank"
                                                                     title="Github"><i class="fa fa-github" aria-hidden="true"></i></a><a class="social-icon" href="mailto:1759864302@qq.com"
                                                                                                                                          target="_blank" title="Email"><i class="fa fa-envelope" aria-hidden="true"></i></a><a class="social-icon" href="/"
                                                                                                                                                                                                                                target="_blank" title="RSS"><i class="fa fa-rss" aria-hidden="true"></i></a></div>
                </div>
            </div>
            <div class="card-widget card-announcement">
                <div class="card-content">
                    <div class="item-headline"><i class="fa fa-bullhorn card-announcement-animation" aria-hidden="true"></i><span>公告</span></div>
                    <div class="announcement_content">感谢访问本站，若喜欢请收藏 ^_^不喜欢的话我再想想办法</div>
                </div>
            </div>
            <div class="card-widget card-recent-post">
                <div class="card-content">
                    <div class="item-headline"><i class="fa fa-history" aria-hidden="true"></i><span>最新文章</span></div>
                    <div class="aside-recent-item">
                        <div class="aside-recent-post"><a href="/2020/05/13/mysql-mysql-transaction/">
                            <div class="aside-post-cover"><img class="aside-post-bg lazyload" data-src="https://s1.ax1x.com/2020/05/08/YuyiaF.jpg"
                                                               onerror="this.onerror=null;this.src='/img/404.jpg'" title="mysql事务" alt="mysql事务" /></div>
                            <div class="aside-post-title">
                                <div class="aside-post_title" href="/2020/05/13/mysql-mysql-transaction/" title="mysql事务">mysql事务</div><time
                                    class="aside-post_meta post-meta__date" title="发表于 2020-05-13 12:29:32">2020-05-13</time>
                            </div>
                        </a></div>
                        <div class="aside-recent-post"><a href="/2020/05/12/mysql-mysql-event/">
                            <div class="aside-post-cover"><img class="aside-post-bg lazyload" data-src="https://s1.ax1x.com/2020/05/08/YuyAPJ.jpg"
                                                               onerror="this.onerror=null;this.src='/img/404.jpg'" title="mysql事件" alt="mysql事件" /></div>
                            <div class="aside-post-title">
                                <div class="aside-post_title" href="/2020/05/12/mysql-mysql-event/" title="mysql事件">mysql事件</div><time class="aside-post_meta post-meta__date"
                                                                                                                                       title="发表于 2020-05-12 17:52:32">2020-05-12</time>
                            </div>
                        </a></div>
                        <div class="aside-recent-post"><a href="/2020/05/11/mysql-mysql-trigger/">
                            <div class="aside-post-cover"><img class="aside-post-bg lazyload" data-src="https://s1.ax1x.com/2020/05/08/YuyEG9.jpg"
                                                               onerror="this.onerror=null;this.src='/img/404.jpg'" title="mysql触发器" alt="mysql触发器" /></div>
                            <div class="aside-post-title">
                                <div class="aside-post_title" href="/2020/05/11/mysql-mysql-trigger/" title="mysql触发器">mysql触发器</div><time
                                    class="aside-post_meta post-meta__date" title="发表于 2020-05-11 11:06:48">2020-05-11</time>
                            </div>
                        </a></div>
                        <div class="aside-recent-post"><a href="/2020/05/10/dataStructure-%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E5%92%8C%E7%AE%97%E6%B3%95%E5%B0%8F%E7%BB%93/">
                            <div class="aside-post-cover"><img class="aside-post-bg lazyload" data-src="https://s1.ax1x.com/2020/05/08/Yu2PyR.jpg"
                                                               onerror="this.onerror=null;this.src='/img/404.jpg'" title="数据结构和算法小结" alt="数据结构和算法小结" /></div>
                            <div class="aside-post-title">
                                <div class="aside-post_title" href="/2020/05/10/dataStructure-%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84%E5%92%8C%E7%AE%97%E6%B3%95%E5%B0%8F%E7%BB%93/"
                                     title="数据结构和算法小结">数据结构和算法小结</div><time class="aside-post_meta post-meta__date" title="发表于 2020-05-10 23:50:43">2020-05-10</time>
                            </div>
                        </a></div>
                        <div class="aside-recent-post"><a href="/2020/05/09/dataStructure-java%E5%AE%9E%E7%8E%B0%E9%A9%AC%E8%B8%8F%E6%A3%8B%E7%9B%98%E7%AE%97%E6%B3%95-%E9%AA%91%E5%A3%AB%E5%91%A8%E6%B8%B8%E9%97%AE%E9%A2%98/">
                            <div class="aside-post-cover"><img class="aside-post-bg lazyload" data-src="https://s1.ax1x.com/2020/05/08/Yuy8Gd.jpg"
                                                               onerror="this.onerror=null;this.src='/img/404.jpg'" title="java实现马踏棋盘算法(骑士周游问题)" alt="java实现马踏棋盘算法(骑士周游问题)" /></div>
                            <div class="aside-post-title">
                                <div class="aside-post_title" href="/2020/05/09/dataStructure-java%E5%AE%9E%E7%8E%B0%E9%A9%AC%E8%B8%8F%E6%A3%8B%E7%9B%98%E7%AE%97%E6%B3%95-%E9%AA%91%E5%A3%AB%E5%91%A8%E6%B8%B8%E9%97%AE%E9%A2%98/"
                                     title="java实现马踏棋盘算法(骑士周游问题)">java实现马踏棋盘算法(骑士周游问题)</div><time class="aside-post_meta post-meta__date" title="发表于 2020-05-09 18:04:43">2020-05-09</time>
                            </div>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-widget card-categories">
                <div class="card-content">
                    <div class="item-headline"><i class="fa fa-folder-open" aria-hidden="true"></i><span>分类</span></div>
                    <ul class="aside-category-item">
                        <li class="aside-category-list"><a class="aside-category-list_link" href="/categories/mysql/"><span class="aside-category-list_name">mysql</span><span
                                class="aside-category-list_length">4</span></a></li>
                        <li class="aside-category-list"><a class="aside-category-list_link" href="/categories/%E4%BD%9C%E4%B8%9A/"><span
                                class="aside-category-list_name">作业</span><span class="aside-category-list_length">1</span></a></li>
                        <li class="aside-category-list"><a class="aside-category-list_link" href="/categories/%E6%95%99%E7%A8%8B/"><span
                                class="aside-category-list_name">教程</span><span class="aside-category-list_length">1</span></a></li>
                        <li class="aside-category-list"><a class="aside-category-list_link" href="/categories/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/"><span
                                class="aside-category-list_name">数据结构</span><span class="aside-category-list_length">29</span></a></li>
                        <li class="aside-category-list"><a class="aside-category-list_link" href="/categories/%E7%94%9F%E6%B4%BB/"><span
                                class="aside-category-list_name">生活</span><span class="aside-category-list_length">1</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-widget card-tags">
                <div class="card-content">
                    <div class="item-headline"><i class="fa fa-tags" aria-hidden="true"></i><span>标签</span></div>
                    <div class="card-tag-cloud"><a href="/tags/java/" style="font-size: 21.33px; color: #99a4b2">java</a> <a href="/tags/mysql/"
                                                                                                                             style="font-size: 18.67px; color: #999ea6">mysql</a> <a href="/tags/%E4%BD%9C%E4%B8%9A/" style="font-size: 16px; color: #999">作业</a>
                        <a href="/tags/%E5%AD%A6%E4%B9%A0/" style="font-size: 24px; color: #99a9bf">学习</a> <a href="/tags/%E6%95%99%E7%A8%8B/"
                                                                                                              style="font-size: 16px; color: #999">教程</a> <a href="/tags/%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84/" style="font-size: 21.33px; color: #99a4b2">数据结构</a>
                        <a href="/tags/%E7%94%9F%E6%B4%BB/" style="font-size: 16px; color: #999">生活</a></div>
                </div>
            </div>
            <div class="card-widget card-archives">
                <div class="card-content">
                    <div class="item-headline"><i class="fa fa-archive" aria-hidden="true"></i><span>时间轴</span></div>
                    <ul class="archive-list">
                        <li class="archive-list-item"><a class="archive-list-link" href="/archives/2020/05/"><span class="archive-list-date">2020年05月</span><span
                                class="archive-list-count">13</span></a></li>
                        <li class="archive-list-item"><a class="archive-list-link" href="/archives/2020/04/"><span class="archive-list-date">2020年04月</span><span
                                class="archive-list-count">24</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="card-widget card-webinfo">
                <div class="card-content">
                    <div class="item-headline"><i class="fa fa-line-chart" aria-hidden="true"></i><span>网站资讯</span></div>
                    <div class="webinfo">
                        <div class="webinfo-item">
                            <div class="webinfo-article-name">文章数目 :</div>
                            <div class="webinfo-article-count">37</div>
                        </div>
                        <div class="webinfo-item">
                            <div class="webinfo-runtime-name">已运行时间 :</div>
                            <div class="webinfo-runtime-count" id="webinfo-runtime-count" start_date="6/7/2019 00:00:00"> </div>
                        </div>
                        <div class="webinfo-item">
                            <div class="webinfo-site-wordcount-name">本站总字数 :</div>
                            <div class="webinfo-site-wordcount">54.6k</div>
                        </div>
                        <div class="webinfo-item">
                            <div class="webinfo-site-uv-name">本站访客数 :</div>
                            <div class="webinfo-site-uv-count" id="busuanzi_value_site_uv"></div>
                        </div>
                        <div class="webinfo-item">
                            <div class="webinfo-site-name">本站总访问量 :</div>
                            <div class="webinfo-site-pv-count" id="busuanzi_value_site_pv"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer id="footer" data-type="color">
        <div id="footer-wrap">
            <div class="copyright">&copy;2020 By Todcsw</div>
            <div class="framework-info"><span>驱动 </span><a href="https://hexo.io" target="_blank" rel="noopener"><span>Hexo</span></a><span
                    class="footer-separator">|</span><span>主题 </span><a href="https://github.com/jerryc127/hexo-theme-butterfly"
                                                                        target="_blank" rel="noopener"><span>Butterfly</span></a></div>
        </div>
    </footer>
</div>
<section class="rightside" id="rightside">
    <div id="rightside-config-hide"><a class="translate_chn_to_cht" id="translateLink" href="javascript:translatePage();"
                                       title="简繁转换" target="_self">简</a><i class="darkmode fa fa-moon-o" id="darkmode" title="夜间模式"></i></div>
    <div id="rightside-config-show">
        <div id="rightside_config" title="设置"><i class="fa fa-cog" aria-hidden="true"></i></div><i class="fa fa-arrow-up"
                                                                                                   id="go-up" title="回到顶部" aria-hidden="true"></i>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
<script src="js/utils.js"></script>
<!-- <script src="js/main.js"></script>
<script src="js/tw_cn.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@latest/dist/jquery.fancybox.min.js"></script>
<script defer id="ribbon" src="js/third-party/canvas-ribbon.js" size="150" alpha="0.6" zIndex="-1" mobile="true"
        data-click="false"></script>
<script id="canvas_nest" color="0,0,255" opacity="0.7" zIndex="-1" count="99" mobile="true" src="js/third-party/canvas-nest.js"></script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
<script src="https://cdn.jsdelivr.net/npm/instant.page@latest/instantpage.min.js" type="module"></script>
<script src="https://cdn.jsdelivr.net/npm/lazysizes@latest/lazysizes.min.js" async=""></script>
<script src="js/third-party/click_heart.js"></script>
</body>
</html>

