package com.csw.servlet;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.date.DateTime;
import com.csw.entity.User;
import com.csw.service.UserService;
import com.csw.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/14 8:58 星期日
 * @Description: ${PACKAGE_NAME} 注册和找回密码控制器
 * @version: 1.0
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        // 操作动作
        String op = request.getParameter("op");

        switch (op) {
            case "registerCheck":
                registerCheck(request, response);
                break;
            case "findPassword":
                findPassword(request, response);
                break;
            case "register":
                register(request,response);
            case "findProblem":
                findProblem(request,response);
        }
    }

    /**
     * 注册检验
     */
    protected void registerCheck(HttpServletRequest request, HttpServletResponse response) {
        try {

            response.setContentType("application/json;charset=UTF-8");
            String registerAccount = request.getParameter("registerAccount");
            UserService userService=new UserServiceImpl();
            int i = userService.selUserByAccount(registerAccount);

            PrintWriter out = response.getWriter();
            if (i > 0) {
                out.println("{\"code\":\"202\",\"message\":\"该账号已被注册,请重新填写\"}");
            } else {
                out.println("{\"code\":\"200\",\"message\":\"该账号未被注册\"}");
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    protected void findPassword(HttpServletRequest request, HttpServletResponse response) {
        try {

            response.setContentType("application/json;charset=UTF-8");
            String findPassword = request.getParameter("findPassword");
            String findName = request.getParameter("findName");
            UserService userService=new UserServiceImpl();
            User user=new User(1,findName,"1","1",findPassword,DateTime.now(),"hehe");
            user = userService.findPassword(user);
            PrintWriter out = response.getWriter();

            if (user!=null) {
                out.println("{\"code\":\"200\",\"message\":\""+Base64.decodeStr(user.getPassword())+"\"}");
                out.close();
            } else {
                out.println("{\"code\":\"202\",\"message\":\"回答错误,找不到呀,\"}");
                out.close();
            }

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    protected void register(HttpServletRequest request, HttpServletResponse response) {
        try {



            response.setContentType("application/json;charset=UTF-8");
            String registerAccount = request.getParameter("registerAccount");
            String password1 = Base64.encode(request.getParameter("password1"));
            String problem = request.getParameter("problem");
            String userIdentify = request.getParameter("userIdentify");
            String answer = request.getParameter("answer");

            User user=new User(1,registerAccount,password1,problem,answer, DateTime.now(),userIdentify);

            UserService userService=new UserServiceImpl();
            int i = userService.register(user);
            PrintWriter out = response.getWriter();
            if (i > 0) {
                out.println("{\"code\":\"200\",\"message\":\"注册成功\"}");
                out.close();
            } else {
                out.println("{\"code\":\"202\",\"message\":\"注册失败,未知错误\"}");
                out.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }


    protected void findProblem(HttpServletRequest request, HttpServletResponse response) {
        try {

            response.setContentType("application/json;charset=UTF-8");
            String findName = request.getParameter("findName");
            UserService userService=new UserServiceImpl();
            String problem = userService.findProblem(findName);
            PrintWriter out = response.getWriter();
            if (!"null".equals(problem)) {
                out.println("{\"code\":\"200\",\"message\":\""+problem+"\"}");
                out.close();
            } else {
                out.println("{\"code\":\"202\",\"message\":\"没有该账户\"}");
                out.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }





    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }


}
