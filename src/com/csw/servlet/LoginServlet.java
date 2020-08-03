package com.csw.servlet;

import cn.hutool.core.codec.Base64;
import com.csw.entity.User;
import com.csw.service.UserService;
import com.csw.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/10 20:11 星期三
 * @Description: ${PACKAGE_NAME} 登录页面控制
 * @version: 1.0
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    UserService userService=new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");


            String name = request.getParameter("userName");
            String password = Base64.encode(request.getParameter("password"));
            HttpSession hs=request.getSession();
            boolean flag=true;
            User user = userService.Login(name,password);

            if(user!=null){
                    flag=false;
                    hs.setAttribute("user",user);
                    hs.setAttribute("tan","1");
                    response.sendRedirect("IndexServlet");
            }else{
                hs.setAttribute("errorMsg","账号或密码不正确");
                response.sendRedirect("login.jsp");
            }
            if(flag){
                request.getRequestDispatcher("login.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
