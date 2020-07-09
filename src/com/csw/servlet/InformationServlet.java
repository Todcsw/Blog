package com.csw.servlet;

import com.csw.entity.*;
import com.csw.service.CommentService;
import com.csw.service.DescriptionService;
import com.csw.service.InformationService;
import com.csw.service.PhotoService;
import com.csw.service.impl.CommentServiceImpl;
import com.csw.service.impl.DescriptionServiceImpl;
import com.csw.service.impl.InformationServiceImpl;
import com.csw.service.impl.PhotoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Queue;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/9 12:59 星期二
 * @Description: ${PACKAGE_NAME}
 * @version: 1.0
 */
@WebServlet("/InformationServlet")
public class InformationServlet extends HttpServlet {

    CommentService commentService=new CommentServiceImpl();
    PhotoService photoService=new PhotoServiceImpl();
    DescriptionService descriptionService=new DescriptionServiceImpl();

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            boolean flag=true;
            request.setAttribute("comment",commentService.selComment());
            request.setAttribute("photo",photoService.selPhoto(1));
            request.setAttribute("description",descriptionService.selDescription());

            String op = request.getParameter("op");
            if(op!=null&&!"null".equals(op)){
                flag=false;
                switch (op) {
                    // 更新site信息
                    case "updComment":
                        updComment(request, response);
                        break;
                    // 更新information信息
                    case "updPhoto":
                        updPhoto(request, response);
                        break;
                    // 更新footer信息
                    case "updDescription":
                        updDescription(request, response);
                        break;
                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }
            if(flag) {
                request.getRequestDispatcher("information.jsp").forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void updComment(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession hs=request.getSession();
        boolean flag=false;
        String Flag = request.getParameter("Flag");
        if(Flag.equals("true")||Flag.equals("TRUE")){
            flag=true;
        }else{
            flag=false;
        }
        String appId = request.getParameter("appId");
        String appKey = request.getParameter("appKey");
        String placeholder = request.getParameter("placeholder");
        String placePhoto = request.getParameter("placePhoto");

        if(commentService.selComment()==null){
            Comment comment=new Comment(1,flag,appId,appKey,placeholder,placePhoto);
            int i = commentService.insComment(comment);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("InformationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("InformationServlet");
            }
        }else{
            Comment comment=new Comment(1,flag,appId,appKey,placeholder,placePhoto);
            int i =commentService.updComment(comment);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("InformationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("InformationServlet");
            }
        }
    }

    protected void updPhoto(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession hs=request.getSession();

        String indexPhoto=request.getParameter("indexPhoto");
        String tagPhoto=request.getParameter("tagPhoto");
        String catalogPhoto=request.getParameter("catalogPhoto");
        String linkPhoto=request.getParameter("linkPhoto");
        String aboutPhoto=request.getParameter("aboutPhoto");

        if(photoService.selPhoto(1)==null){
            Photo photo=new Photo(
                    1,linkPhoto,aboutPhoto,tagPhoto,indexPhoto,catalogPhoto);

            int i = photoService.insPhoto(photo);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("InformationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("InformationServlet");
            }
        }else{
            Photo photo=new Photo(

                    1,linkPhoto,aboutPhoto,tagPhoto,indexPhoto,catalogPhoto);

            int i =photoService.updPhoto(photo);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("InformationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("InformationServlet");
            }
        }

    }

    protected void updDescription(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession hs=request.getSession();

        String descriptionName=request.getParameter("descriptionName");
        String descriptionConstellation=request.getParameter("descriptionConstellation");
        String descriptionExperience=request.getParameter("descriptionExperience");
        String descriptionSentence=request.getParameter("descriptionSentence");
        String descriptionIdol=request.getParameter("descriptionIdol");
        String descriptionCharacter=request.getParameter("descriptionCharacter");
        String descriptionContact=request.getParameter("descriptionContact");
        String descriptionLanguage=request.getParameter("descriptionLanguage");
        String descriptionInformation=request.getParameter("descriptionInformation");

        if(descriptionService.selDescription()==null){
            Description description=new Description(
                    1,descriptionName,descriptionConstellation,
                    descriptionExperience,descriptionSentence,descriptionIdol,
                    descriptionCharacter,descriptionContact,descriptionInformation,
                    descriptionLanguage
            );
            int i = descriptionService.insDescription(description);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("InformationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("InformationServlet");
            }
        }else{
            Description description=new Description(
                    1,descriptionName,descriptionConstellation,
                    descriptionExperience,descriptionSentence,descriptionIdol,
                    descriptionCharacter,descriptionContact,descriptionInformation,
                    descriptionLanguage
            );
            int i = descriptionService.updDescription(description);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("InformationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("InformationServlet");
            }
        }
    }


}
