package com.csw.servlet;

import cn.hutool.core.text.StrSpliter;
import com.csw.entity.Blog;
import com.csw.service.BlogService;
import com.csw.service.impl.BlogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/10 11:18 星期三
 * @Description: ${PACKAGE_NAME} 博客管理页面的控制器
 * @version: 1.0
 */
@WebServlet("/BlogServlet")
public class BlogServlet extends HttpServlet {

    /**
     * 调用义务层获得首页相关信息
     */
    BlogService blogService=new BlogServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            //flag默认没有操作传入为true
            boolean flag=true;
            HttpSession hs=request.getSession();

            //获得操作博客的op
            String op = request.getParameter("op");

            //将博客的信息存入,请求转发即可显示数据
            request.setAttribute("blogList",blogService.selAllBlog());

            if(op!=null&&!"null".equals(op)){
                //有操作传入,修改flag
                flag=false;
                switch (op) {
                    // 增加blog信息
                    case "insBlog":
                        insBlog(request,response,hs);
                        break;
                    // 更新blog信息
                    case "updBlog":
                        updBlog(request,response,hs);
                        break;
                     //删除blog信息
                    case "delBlog":
                        delBlog(request,response,hs);
                        break;
                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }

            //没有操作传入,请求转发,展示blog信息
            if(flag) {
                request.getRequestDispatcher("blog.jsp").forward(request, response);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 新增博客的方法 ,数据存入session中,重定向,新增博客页面
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void insBlog(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {
        hs.setAttribute("blogId","");
        hs.setAttribute("blog",new Blog());
        response.sendRedirect("EditServlet");
    }

    /**
     * 修改博客方法,将id传入,用户查询需要修改的blog，存入查询的操作,重定向到修改页面
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void updBlog(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {
        hs.setAttribute("blogId",request.getParameter("blogId"));
        hs.setAttribute("op1","selBlogById");
        response.sendRedirect("EditServlet");
    }

    /**
     * 删除blog信息,获得需要删除的id号,进行删除,删除成功后重定向到blogServlet，再请求转发到blog.jsp进行页面显示
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void delBlog(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {


        String blogId = request.getParameter("blogId");
        List<String> list = StrSpliter.splitTrim(blogId, ',', true);
        for(String a:list){
            //删除该博客对应文章的封面图文件
            File file=new File(request.getServletContext().getRealPath(blogService.selBlogById(Integer.parseInt(a)).getPhoto()));
            if (file.exists()){
                //如果存在就删除
                file.delete();
            }
            int i = blogService.delBlog(Integer.parseInt(a));
            if(i!=1){
                hs.setAttribute("MSG","201");
                break;
            }
        }
        response.sendRedirect("BlogServlet");
    }

    /**
     * 存在一个判断是否为分发登录用户的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TagServlet.isIllegalLogin(request,response);
        HttpSession session=request.getSession();
        String placeLogin =(String) session.getAttribute("illegalLogin");
        if(placeLogin.equals("请登录")){
            return;
        }
        doPost(request,response);
    }
}
