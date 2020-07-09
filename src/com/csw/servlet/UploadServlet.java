package com.csw.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.UUID;

/**
 * @Auther: 行路
 * @Date: Created on 2020/6/14 22:37 星期日
 * @Description: ${PACKAGE_NAME} 这是一个用于测试上传文件的类,可以进行删除
 * @version: 1.0
 */
@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //获得存储路径
        String savePath = request.getServletContext().getRealPath("BlogPhoto");
        //获得part对象
        Part part = request.getPart("file1");
        //获得请求头信息
        String header = part.getHeader("content-disposition");
        //获得文件名称
        String fileName = getFileName(header);
        //修改文件名称使其唯一
        UUID uuid= UUID.randomUUID();
        fileName=uuid+"-"+fileName;

        PrintWriter out = response.getWriter();

        if (!fileName.equals("")) {
            part.write(savePath + File.separator + fileName);
            String photo=fileName;
            System.out.println("uploadServlet:"+photo);
            HttpSession session = request.getSession();
            session.setAttribute("photoUpload",photo);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

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
