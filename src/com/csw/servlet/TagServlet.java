package com.csw.servlet;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.text.StrSpliter;
import cn.hutool.db.Session;
import com.csw.entity.Tag;
import com.csw.service.TagService;
import com.csw.service.impl.TagServiceImpl;

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
 * @Date: Created on 2020/6/8 23:16 星期一
 * @Description: ${PACKAGE_NAME}
 * @version: 1.0
 */
@WebServlet("/TagServlet")
public class TagServlet extends HttpServlet {

    TagService tagService=new TagServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            boolean flag=true;
            HttpSession hs=request.getSession();
            request.setAttribute("tagList",tagService.selAllTag());

            String op = request.getParameter("op");
            if(op!=null&&!"null".equals(op)&&!"".equals(op)){
                flag=false;
                switch (op) {
                    // 增加tag信息
                    case "insTag":
                        insTag(request,response,hs);
                        break;
                    // 删除tag信息
                    case "delTag":
                        delTag(request,response,hs);
                        break;
                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }
            if(flag) {
                request.getRequestDispatcher("tag.jsp").forward(request, response);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 新增标签
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void insTag(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {
        String tagName = request.getParameter("tagName");
        Tag tag=new Tag(1,tagName,0, DateTime.now());
        int i = tagService.insTag(tag);

        if(i==1){
            hs.setAttribute("MSG",200);
            response.sendRedirect("TagServlet");
        }else{
            hs.setAttribute("MSG",201);
            response.sendRedirect("TagServlet");
        }

    }

    /**
     * 删除标签
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void delTag(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {
        String tagId=request.getParameter("tagId");
        List<String> list = StrSpliter.splitTrim(tagId, ',', true);
        for(String a:list){
            int i = tagService.delTag(Integer.parseInt(a));
            if(i!=1){
                hs.setAttribute("MSG","201");
                break;
            }
        }
        response.sendRedirect("TagServlet");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TagServlet.isIllegalLogin(request,response);
        doPost(request,response);
    }

    /**
     * 判断是否存在非法登录
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public static void isIllegalLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user")==null){
            HttpSession hs=request.getSession();
            hs.setAttribute("illegalLogin","请登录");
            response.sendRedirect("login.jsp");
        }
    }
}
