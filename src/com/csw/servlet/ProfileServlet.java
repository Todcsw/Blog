package com.csw.servlet;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.date.DateTime;
import com.csw.entity.Link;
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
import java.io.PrintWriter;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/14 17:27 星期日
 * @Description: ${PACKAGE_NAME}
 * @version: 1.0
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            HttpSession hs=request.getSession();

            String op = request.getParameter("op");

            if(op!=null&&!"null".equals(op)){
                switch (op) {
                    // 增加link信息
                    case "editPassword":
                        editPassword(request,response,hs);
                        break;
                    // 更新tag信息
                    case "editAccount":
                        editAccount(request,response,hs);
                        break;

                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }


        }catch (Exception e){
            e.printStackTrace();
        }

    }

    /**
     * 修改密码
     * @param request
     * @param response
     * @param hs
     * @throws Exception
     */
    protected void editPassword(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {

        try {

            response.setContentType("application/json;charset=UTF-8");
            String newPassword = request.getParameter("newPassword");

            UserService userService=new UserServiceImpl();
            User user =(User) hs.getAttribute("user");

            int i = userService.updPassword(user.getAccount(), user.getPassword(), Base64.encode(newPassword));


            PrintWriter out = response.getWriter();
            if (i > 0) {
                user.setPassword(newPassword);
                hs.setAttribute("user",user);
                out.println("{\"code\":\"200\",\"message\":\"密码修改成功,请重新登录\"}");
            } else {
                out.println("{\"code\":\"202\",\"message\":\"密码修改失败\"}");
            }

        }catch (Exception e){
            e.printStackTrace();
        }


    }

    protected void editAccount(HttpServletRequest request, HttpServletResponse response,HttpSession hs)
            throws Exception {

        try {

            PrintWriter out = response.getWriter();
            response.setContentType("application/json;charset=UTF-8");
            String nickName = request.getParameter("nickName");
            UserService userService=new UserServiceImpl();
            User user = (User)hs.getAttribute("user");
            int i = userService.selUserByAccount(nickName);
            if(i==0){ //为0说明账号不存在
                user.setAccount(nickName);
                int i1 = userService.updUser(user);
                if (i1 > 0) {
                    hs.setAttribute("user",user);
                    out.println("{\"code\":\"200\",\"message\":\"修改成功\"}");
                } else {
                    out.println("{\"code\":\"202\",\"message\":\"修改失败\"}");
                }
            }else{
                out.println("{\"code\":\"202\",\"message\":\"该账号已经存在,换一个吧\"}");
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
