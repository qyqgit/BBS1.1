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
import javax.servlet.http.HttpSession;

import com.obj.EachPage;
import com.obj.Media;
import com.obj.User;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        Connection conn = (Connection)session.getAttribute("conn");
        User user = new User(request.getParameter("id"));
        if(User.getUser(user, conn))
            request.setAttribute("user", user);
        else
            return;
        Properties profile = (Properties)request.getServletContext().getAttribute("profile");
        int pageLength;
        int[] count = {0};
        int listLength =  Integer.parseInt(profile.getProperty("page_listlength"));
        int pageNumber;
        Media.getMediaCountEx(count, user.getId(), conn);
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
        if(Media.getMediaListMnEx(user.getId(), mediaList, conn, eachPage.getPageIndex(), pageLength))
            request.setAttribute("mediaList", mediaList);
        //change information of user
        User loginUser = (User)session.getAttribute("user");
        if(loginUser != null && loginUser.getPassword().equals(request.getParameter("oldPassword")) && loginUser.getId().equals(request.getParameter("id")) && "1".equals(request.getParameter("submit"))) {
            loginUser.setName(request.getParameter("name"));
            loginUser.setPassword(request.getParameter("password"));
            loginUser.setAge(request.getParameter("birthday"));
            loginUser.setSex(request.getParameter("sex"));
            if(User.updateUser(loginUser, conn)) {
                loginUser.setPassword("696d29e0940a4957748fe3fc9efd22a3".equalsIgnoreCase(request.getParameter("password")) ? request.getParameter("oldPassword") :request.getParameter("password"));
                session.setAttribute("user", loginUser);
                request.setAttribute("user", loginUser);
            }
            
        }
        request.getRequestDispatcher("Home.jsp").forward(request, response);
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
