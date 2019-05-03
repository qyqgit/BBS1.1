package com.svl;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.obj.EachPage;
import com.obj.Media;

/**
 * Servlet implementation class AdminMedia
 */
@WebServlet("/AdminMedia")
public class AdminMedia extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMedia() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Connection conn = (Connection)request.getSession().getAttribute("conn");
        if("invalid".equalsIgnoreCase(request.getParameter("method"))) {
            Media.setMediaInvalid(request.getParameter("id"), conn);
        } else if("valid".equalsIgnoreCase(request.getParameter("method"))) {
            Media.setMediaValid(request.getParameter("id"), conn);
        } else if("delete".equalsIgnoreCase(request.getParameter("method"))){
            Media media = new Media(request.getParameter("id"));
            if(Media.getMedia(media, conn)) {
                Properties profile = (Properties)getServletContext().getAttribute("profile");
                String realPath = getServletContext().getRealPath("/");
                File tempFile = new File(realPath);
                realPath = tempFile.getParent() + "\\" + profile.getProperty("media_path") + "\\" + media.getUser().getId() + "\\" + media.getUrl().substring(media.getUrl().lastIndexOf("/") + 1);
                //创建文件对象
                File dir = new File(realPath);
                if(dir.exists()) dir.delete();
                Media.deleteMedia(request.getParameter("id"), conn);
            }
        }
        
        Properties profile = (Properties)request.getServletContext().getAttribute("profile");
        int pageLength;
        int[] count = {0};
        int listLength =  Integer.parseInt(profile.getProperty("page_listlength"));
        int pageNumber;
        Media.getMediaCountAdmin(count, conn);
        try {
            pageLength = Integer.parseInt(request.getParameter("pageLength"));
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        } catch (NumberFormatException e) {
            // TODO Auto-generated catch block
            pageLength = Integer.parseInt(profile.getProperty("page_length"));
            pageNumber = Integer.parseInt(profile.getProperty("page_number"));
        }
        EachPage eachPage = new EachPage(pageLength,count[0],listLength,pageNumber);
        int howManyPage = eachPage.getHowManyPage();
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("howManyPage", howManyPage);
        
        ArrayList<EachPage> eachPageList = eachPage.getEachPageList();
        request.setAttribute("eachPageList", eachPageList);
        
        ArrayList<Media> mediaList = new ArrayList<Media>();
        if(Media.getMediaListAdminMN(mediaList, conn, eachPage.getPageIndex(), pageLength))
            request.setAttribute("mediaList", mediaList);
        request.getRequestDispatcher("admin/admin_media.jsp").forward(request, response);
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
