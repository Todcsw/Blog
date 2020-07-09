package com.csw.servlet;

import com.csw.service.BlogService;
import com.csw.service.CategoryService;
import com.csw.service.LinkService;
import com.csw.service.TagService;
import com.csw.service.impl.BlogServiceImpl;
import com.csw.service.impl.CategoryServiceImpl;
import com.csw.service.impl.LinkServiceImpl;
import com.csw.service.impl.TagServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/8 13:05 星期一
 * @Description: ${PACKAGE_NAME}
 * @version: 1.0
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {

    /**
     * 调用义务层获得首页相关信息
     */
    BlogService blogService=new BlogServiceImpl();
    TagService tagService=new TagServiceImpl();
    CategoryService categoryService=new CategoryServiceImpl();
    LinkService linkService=new LinkServiceImpl();



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            request.setAttribute("counts",new int[]{blogService.selAllBlogCount(),categoryService.selAllCategoryCount(),tagService.selAllTagCount(),linkService.selAllLinkCount()});
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 判断是否存在非法用户登录
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
