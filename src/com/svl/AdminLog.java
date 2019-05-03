package com.svl;

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
import com.obj.MyLog;

/**
 * Servlet implementation class AdminLog
 */
@WebServlet("/AdminLog")
public class AdminLog extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLog() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Connection conn = (Connection)request.getSession().getAttribute("conn");
        Properties profile = (Properties)request.getServletContext().getAttribute("profile");
        int pageLength;
        int[] count = {0};
        int listLength =  Integer.parseInt(profile.getProperty("page_listlength"));
        int pageNumber;
        MyLog.getLogCountAdmin(count, conn);
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
        
        ArrayList<MyLog> myLogList = new ArrayList<MyLog>();
        if(MyLog.getLogListAdminMN(myLogList, conn, eachPage.getPageIndex(), pageLength))
            request.setAttribute("myLogList", myLogList);
        request.getRequestDispatcher("admin/admin_log.jsp").forward(request, response);
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
