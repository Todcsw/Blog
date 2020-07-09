package com.csw.servlet;

import cn.hutool.core.date.DateTime;
import com.csw.entity.Blog;
import com.csw.entity.Category;
import com.csw.service.BlogService;
import com.csw.service.CategoryService;
import com.csw.service.impl.BlogServiceImpl;
import com.csw.service.impl.CategoryServiceImpl;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ref.ReferenceQueue;
import java.util.UUID;

import static java.lang.Thread.sleep;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/10 9:53 星期三
 * @Description: ${PACKAGE_NAME} 修改blog的控制页面
 * @version: 1.0
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * 调用义务层获得首页相关信息
     */
    BlogService blogService = new BlogServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            HttpSession hs = request.getSession();

            //查询所有目录,用户修改或新增时选择
            hs.setAttribute("categorys", categoryService.selAllCategory());

            //flag默认没有操作传入为true
            boolean flag = true;

            //获得操作的op
            String op = request.getParameter("op");

            if (op != null && !"null".equals(op) && !"".equals(op)) {
                flag = false;
                switch (op) {
                    //修改blog信息
                    case "updBlogById":
                        updBlogById(request, response, hs);
                        break;
                    //增加blog信息
                    case "insBlog":
                        insBlog(request, response, hs);
                        break;
                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }

            //获得是否需要先进行查询的op1,然后进行修改
            String op1 = (String) hs.getAttribute("op1");

            /**
             * 用于判断BlogServlet传来的修改操作
             */
            if (op1 != null && !"null".equals(op1) && !"".equals(op1)) {
                flag = false;
                hs.setAttribute("op1", "");
                switch (op1) {

                    //先根据id查询信息到页面展示
                    case "selBlogById":
                        selBlogById(request, response, hs);
                        op1 = "";
                        break;
                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }
            if (flag) {
                request.getRequestDispatcher("edit.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询blog信息根据id
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void selBlogById(HttpServletRequest request, HttpServletResponse response, HttpSession hs)
            throws Exception {

        String blogId = (String) hs.getAttribute("blogId");
        Blog blog = blogService.selBlogById(Integer.parseInt(blogId));
        hs.setAttribute("blog", blog);
        response.sendRedirect("EditServlet");

    }

    /**
     * 更新blog信息
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void updBlogById(HttpServletRequest request, HttpServletResponse response, HttpSession hs)
            throws Exception {

        //获得上传的图片信息
        String photo = uploadFile(request, response);
        if(photo==null){
            hs.setAttribute("MSG", 201);
            response.sendRedirect("BlogServlet");
        }else{
            String blogId = request.getParameter("blogId");
            String catalog = request.getParameter("catalog");
            String blogName = request.getParameter("blogName");
            String blogTags = request.getParameter("blogTags");
            String content = request.getParameter("blogContentEdit");
            DateTime uploadTime = DateTime.of(request.getParameter("uploadTime"), "yyyy-MM-dd HH:mm:ss");
            String view = request.getParameter("view");
            DateTime updateTime = DateTime.now();
            Blog blog = new Blog(Integer.parseInt(blogId), blogName, photo, Integer.parseInt(view), blogTags, catalog, uploadTime, content, updateTime);

            int i = blogService.updBlog(blog);
            hs.setAttribute("blog", blogService.selBlogById(Integer.parseInt(blogId)));
            if (i == 1) {
                hs.setAttribute("MSG", 200);
                response.sendRedirect("BlogServlet");
            } else {
                hs.setAttribute("MSG", 201);
                response.sendRedirect("BlogServlet");
            }
        }
    }

    /**
     * 新增blog信息
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void insBlog(HttpServletRequest request, HttpServletResponse response, HttpSession hs)
            throws Exception {

        //获得上传的图片信息
        String photo = uploadFile(request, response);
        if(photo==null){
            hs.setAttribute("MSG", 201);
            response.sendRedirect("BlogServlet");
        }else{
            String catalog = request.getParameter("catalog");
            String blogName = request.getParameter("blogName");
            String blogTags = request.getParameter("blogTags");
            String content = request.getParameter("blogContent");

            DateTime updateTime = DateTime.now();
            Blog blog = new Blog(1, blogName, photo, 0, blogTags, catalog, updateTime, content, updateTime);

            int i = blogService.insBlog(blog);
            if (i == 1) {
                hs.setAttribute("MSG", 200);
                response.sendRedirect("BlogServlet");
            } else {
                hs.setAttribute("MSG", 201);
                response.sendRedirect("BlogServlet");
            }
        }
    }


    /**
     * 判断是否存在非法登录
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TagServlet.isIllegalLogin(request, response);
        HttpSession session = request.getSession();
        String placeLogin = (String) session.getAttribute("illegalLogin");
        if (placeLogin.equals("请登录")) {
            return;
        }
        doPost(request, response);
    }

    /**
     * 将上传的文件存入的方法,并返回文件存入的路径
     * @param request
     * @param response
     * @return
     * @throws IOException
     * @throws ServletException
     */
    protected String uploadFile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //获得存储路径
        String savePath = request.getServletContext().getRealPath("BlogPhoto");
        //获得part对象
        Part part = request.getPart("file1");
        //获得请求头信息
        String header = part.getHeader("content-disposition");
        //获得文件名称
        String fileName = getFileName(header);
        //修改文件名称使其唯一
        UUID uuid = UUID.randomUUID();
        fileName = uuid + "-" + fileName;

        if (!fileName.equals("")) {
            part.write(savePath + File.separator + fileName);
            fileName="BlogPhoto"+File.separator+fileName;
        }

        return fileName;
    }


    /**
     * 分割得到文件名称
     *
     * @param header
     * @return
     */
    public String getFileName(String header) {
        String fileName = "";
        try {
            String[] tempArr1 = header.split(";");
            String[] tempArr2 = tempArr1[2].split("=");
            fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\") + 1).replaceAll("\"", "");
        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

}
