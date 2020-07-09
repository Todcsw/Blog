package com.csw.servlet;

import com.csw.entity.Footer;
import com.csw.entity.Information;
import com.csw.entity.Site;
import com.csw.service.FooterService;
import com.csw.service.InformationService;
import com.csw.service.SiteService;
import com.csw.service.impl.FooterServiceImpl;
import com.csw.service.impl.InformationServiceImpl;
import com.csw.service.impl.SiteServiceImpl;

import javax.security.auth.login.Configuration;
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
 * @Date: Created on 2020/6/8 14:01 星期一
 * @Description: com.csw.servlet 网站信息配置页面控制
 * @version: 1.0
 */
@WebServlet("/ConfigurationServlet")
public class ConfigurationServlet extends HttpServlet {

    /**
     * 调用义务层获得首页相关信息
     */
    SiteService siteService=new SiteServiceImpl();
    InformationService informationService=new InformationServiceImpl();
    FooterService footerService=new FooterServiceImpl();

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


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");

            //flag默认没有操作传入为true
            boolean flag=true;

            //将信息存入,请求转发即可显示数据
            request.setAttribute("site",siteService.selSite());
            request.setAttribute("footer",footerService.selFooter());
            request.setAttribute("information",informationService.selInformation());

            //获得操作的op
            String op = request.getParameter("op");

            if(op!=null&&!"null".equals(op)){
                flag=false;
                switch (op) {
                    // 更新site信息
                    case "updSite":
                        updSite(request, response);
                        break;
                    // 更新information信息
                    case "updInformation":
                        updInformation(request, response);
                        break;
                    // 更新footer信息
                    case "updFooter":
                        updFooter(request, response);
                        break;
                    default:
                        PrintWriter out = response.getWriter();
                        out.print("无效的指令");
                        out.close();
                }
            }
            if(flag) {
                request.getRequestDispatcher("configuration.jsp").forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 更新网站信息
     * @param request
     * @param response
     * @throws Exception
     */
    protected void updSite(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession hs=request.getSession();

        String websiteName = request.getParameter("websiteName");
        String websiteDescription = request.getParameter("websiteDescription");
        String websiteLogo = request.getParameter("websiteLogo");
        String websiteNotice = request.getParameter("websiteNotice");
        String websiteIcon = request.getParameter("websiteIcon");

        if(siteService.selSite()==null){
            Site site=new Site(1,websiteName,websiteDescription,websiteLogo,websiteIcon,websiteNotice);
            int i = siteService.insSite(site);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("ConfigurationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("ConfigurationServlet");
            }
        }else{
            Site site=new Site(siteService.selSite().getId(),websiteName,websiteDescription,websiteLogo,websiteNotice,websiteIcon);
            int i = siteService.updSite(site);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("ConfigurationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("ConfigurationServlet");
            }
        }
    }

    /**
     * 更新配置信息
     * @param request
     * @param response
     * @throws Exception
     */
    protected void updInformation(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession hs=request.getSession();

        String yourAvatar=request.getParameter("yourAvatar");
        String yourName=request.getParameter("yourName");
        String yourSentence=request.getParameter("yourSentence");
        String yourEmail=request.getParameter("yourEmail");
        String yourGithub=request.getParameter("yourGithub");

        if(informationService.selInformation()==null){
            Information information=new Information(1,yourAvatar,yourName,yourSentence,yourEmail,yourGithub);
            int i = informationService.insInformation(information);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("ConfigurationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("ConfigurationServlet");
            }
        }else{
            Information information=new Information(informationService.selInformation().getId(),
                    yourAvatar, yourName,
                    yourSentence, yourEmail,
                    yourGithub);

            int i = informationService.updSite(information);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("ConfigurationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("ConfigurationServlet");
            }
        }

    }

    /**
     * 更新页脚信息
     * @param request
     * @param response
     * @throws Exception
     */
    protected void updFooter(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession hs=request.getSession();

        String footerAbout=request.getParameter("footerAbout");
        String footerICP=request.getParameter("footerICP");
        String footerCopyRight=request.getParameter("footerCopyRight");
        String footerPoweredBy=request.getParameter("footerPoweredBy");
        String footerPoweredByURL=request.getParameter("footerPoweredByURL");

        if(footerService.selFooter()==null){
            Footer footer=new Footer(1,
                    footerAbout,
                    footerICP,
                    footerCopyRight,
                    footerPoweredBy,
                    footerPoweredByURL);
            int i = footerService.insFooter(footer);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("ConfigurationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("ConfigurationServlet");
            }
        }else{
            Footer footer=new Footer(footerService.selFooter().getId(),
                    footerAbout,
                    footerICP,
                    footerCopyRight,
                    footerPoweredBy,
                    footerPoweredByURL);

            int i = footerService.updFooter(footer);
            if(i==1){
                hs.setAttribute("MSG",200);
                response.sendRedirect("ConfigurationServlet");
            }else{
                hs.setAttribute("MSG",201);
                response.sendRedirect("ConfigurationServlet");
            }
        }
    }


}
