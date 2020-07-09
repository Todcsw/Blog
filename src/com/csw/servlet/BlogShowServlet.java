package com.csw.servlet;

import com.csw.entity.Blog;
import com.csw.service.BlogService;
import com.csw.service.CommentService;
import com.csw.service.InformationService;
import com.csw.service.SiteService;
import com.csw.service.impl.BlogServiceImpl;
import com.csw.service.impl.CommentServiceImpl;
import com.csw.service.impl.InformationServiceImpl;
import com.csw.service.impl.SiteServiceImpl;

import com.csw.util.MarkDownUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/11 22:52 星期四
 * @Description: ${PACKAGE_NAME} 查询具体的blog信息展示,博客前台页面
 * @version: 1.0
 */
@WebServlet("/BlogShowServlet")
public class BlogShowServlet extends HttpServlet {

    /**
     * 调用义务层获得首页相关信息
     */
    BlogService blogService=new BlogServiceImpl();
    CommentService commentService=new CommentServiceImpl();
    InformationService informationService=new InformationServiceImpl();
    SiteService siteService=new SiteServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            //获得需要展示的blogId信息,进行查询
            String blogID = request.getParameter("blogID");

            //判断blogID是否为正整数
            if(isNumeric(blogID)){
                if(Integer.parseInt(blogID)<0){
                    response.sendRedirect("error/404.html");
                    return;
                }
            }else{
                response.sendRedirect("error/404.html");
                return;
            }

            //查询blog信息,存入blog对象中
            Blog blog = blogService.selBlogById(Integer.parseInt(blogID));

            //blog信息不为空时,将页面需要的信息存入request中
            if(blog!=null){

                blog.setContent(MarkDownUtil.mdToHtml(blog.getContent()));
                request.setAttribute("BlogShowInBlog",blog);
                request.setAttribute("ShowComment",commentService.selComment());
                request.setAttribute("InformationShowBlog",informationService.selInformation());
                request.setAttribute("SiteShowBlog",siteService.selSite());
                request.setAttribute("tagsList",tagsSplit(blog.getTags()));
                request.setAttribute("FirstOrRecentOrOther",blogService.selBlogPrevNext(blog.getUploadTime()));
                request.setAttribute("isFirstOrRecentOrOther",isFirstOrRecentOrOther(blog));

                List<Blog> blogs=blogService.selAllBlog();
                Collections.sort(blogs,new MyComparator());

                //相关的推荐信息,使用的是按照id号的排序进行推荐,也就是最新发布的文章进行推荐
                request.setAttribute("BlogShowOrderById", blogs);

                //请求转发,页面显示
                request.getRequestDispatcher("blog/blog.jsp").forward(request,response);
            }else{
                response.sendRedirect("error/404.html");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    /**
     * 匹配所有的数字,包括负数(不包括带有小数点的数字)
     * @param str
     * @return
     */
    public static boolean isNumeric(String str) {
        // 该正则表达式可以匹配所有的数字 包括负数(不包括带有小数点的数字)
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
        String bigStr;
        try {
            bigStr = new BigDecimal(str).toString();
        } catch (Exception e) {
            return false;//异常 说明包含非数字。
        }

        Matcher isNum = pattern.matcher(bigStr); // matcher是全匹配
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }

    /**
     * 分割标签
     * @param str
     * @return
     */
    public static List<String> tagsSplit(String str){
        ArrayList<String> list=new ArrayList<>();
        String[] split = str.split(",");
        for(String tag:split){
            list.add(tag);
        }
        return list;
    }

    /**
     * 判断是否为最新发布的文章
     * @param blog
     * @return
     */
    public boolean isRecentBlog(Blog blog) {
        try {
           return blog.getId()==blogService.selAllBlog().get(0).getId();
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 判断是否为发表的第一篇文章
     * @param blog
     * @return
     */
    public boolean isFirstBlog(Blog blog) {
        try {
            return blog.getId()==blogService.selAllBlog().get(blogService.selAllBlog().size()-1).getId();
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 判断是否为发表的第一篇文章,最新发布的文章,或者是处在中间位置的文章
     * 发表的第一篇文章 return 1;
     * 最新发布的文章 return 2;
     * 处在中间位置的文章 return 3;
     * @param blog
     * @return
     */
    public int isFirstOrRecentOrOther(Blog blog){

        if(isFirstBlog(blog)){
            return 1;
        }else if(isRecentBlog(blog)){
            return 2;
        }else{
            return 3;
        }
    }
    /**
     * 重写MyComparator，按照Id从大到小进行排序
     */
    static class MyComparator implements Comparator {
        @Override
        public int compare(Object o1, Object o2) {
            Blog e1=(Blog)o1;
            Blog e2=(Blog)o2;
            if(e1.getId()<e2.getId()){
                return 1;
            } else{
                return 0;
            }
        }
    }


}

