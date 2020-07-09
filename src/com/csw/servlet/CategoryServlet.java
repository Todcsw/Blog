package com.csw.servlet;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.text.StrSpliter;
import cn.hutool.log.Log;
import com.csw.entity.Category;
import com.csw.entity.Link;
import com.csw.entity.Tag;
import com.csw.service.CategoryService;
import com.csw.service.impl.CategoryServiceImpl;
import org.omg.PortableInterceptor.INACTIVE;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 23:33 星期二
 * @Description: ${PACKAGE_NAME} 后台管理目录控制页面
 * @version: 1.0
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {

    /**
     * 调用义务层获得首页相关信息
     */
    CategoryService categoryService=new CategoryServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            //flag默认没有操作传入为true
            boolean flag=true;

            HttpSession hs=request.getSession();

            //将目录的信息存入,请求转发即可显示数据
            request.setAttribute("categoryList",categoryService.selAllCategory());

            //获得操作博客的op
            String op = request.getParameter("op");

            if(op!=null&&!"null".equals(op)&&!"".equals(op)){
                flag=false;
                switch (op) {
                    // 增加category信息
                    case "insCategory":
                        insCategory(request,response,hs);
                        break;
                    // 删除category信息
                    case "delCategory":
                        delCategory(request,response,hs);
                        break;
                    //修改category信息
                    case "updCategory":
                        updCategory(request,response,hs);
                        break;
                     //查询category信息根据id
                    case "selCategoryById":
                        selCategoryById(request,response,hs);
                        break;
                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }

            //没有操作传入,请求转发,展示blog信息
            if(flag) {
                request.getRequestDispatcher("category.jsp").forward(request, response);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }


    /**
     * 新增目录信息,
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void insCategory(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {
        //获得目录名称
        String categoryName = request.getParameter("categoryName");
        Category category=new Category(1,categoryName, DateTime.now());
        int i = categoryService.insCategory(category);

        if(i==1){
            hs.setAttribute("MSG",200);
            //新增成功后跳转自己这个servlet，再次查询展示
            response.sendRedirect("CategoryServlet");
        }else{
            hs.setAttribute("MSG",201);
            //新增失败后跳转自己这个servlet，再次查询展示
            response.sendRedirect("CategoryServlet");
        }

    }

    /**
     * 删除目录信息
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void delCategory(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {
        //获得要删除目录的id
        String categoryId=request.getParameter("categoryId");
        List<String> list = StrSpliter.splitTrim(categoryId, ',', true);
        for(String a:list){
            int i = categoryService.delCategory(Integer.parseInt(a));
            if(i!=1){
                hs.setAttribute("MSG","201");
                response.sendRedirect("CategoryServlet");
                break;
            }
        }
        //删除成功后再次重定向查询后,再请求转发展示
        response.sendRedirect("CategoryServlet");
    }

    /**
     * 更新目录信息
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void updCategory(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {

            //获得需要更新的信息
            String categoryId=(String)hs.getAttribute("categoryId");
            String categoryName=request.getParameter("categoryName");
            Category category = new Category(Integer.parseInt(categoryId), categoryName, DateTime.now());
            int i = categoryService.updCategory(category);

            //更新成功或失败后再次重定向查询后,再请求转发展示
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("CategoryServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("CategoryServlet");
            }

    }

    /**
     * 查询目录的信息根据id
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void selCategoryById(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {

        String categoryId = request.getParameter("categoryId");
        Category category = categoryService.selCategoryById(Integer.parseInt(categoryId));
        hs.setAttribute("category",category);
        hs.setAttribute("show","true");
        hs.setAttribute("categoryId",categoryId);
        //查询成功后重定向,再次查询
        response.sendRedirect("CategoryServlet");
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
