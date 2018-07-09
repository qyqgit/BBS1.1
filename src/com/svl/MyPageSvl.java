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
import com.obj.Message;
import com.obj.MyPage;

/**
 * Servlet implementation class MyPage
 */
@WebServlet("/MyPage")
public class MyPageSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = (Connection)request.getSession().getAttribute("conn");
		MyPage myPage = new MyPage(request.getParameter("id"));
		if(MyPage.getMyPage(myPage, conn))
			request.setAttribute("myPage", myPage);
		Message message = new Message(request.getParameter("id"));
		Properties profile = (Properties)request.getServletContext().getAttribute("profile");
		int pageLength;
		int[] count = {0};
		int listLength =  Integer.parseInt(profile.getProperty("message_listlength"));
		int pageNumber;
		Message.getMessageCount(count, message, conn);
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			pageNumber = Integer.parseInt(profile.getProperty("message_number"));;
		}
		try {
			pageLength = Integer.parseInt(request.getParameter("pageLength"));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			pageLength = Integer.parseInt(profile.getProperty("message_length"));;
		}
		EachPage eachPage = new EachPage(pageLength,count[0],listLength,pageNumber);
		int howManyPage = eachPage.getHowManyPage();
		request.setAttribute("pageId", request.getParameter("id"));
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("howManyPage", howManyPage);
		
		ArrayList<EachPage> eachPageList = eachPage.getEachPageList();
		request.setAttribute("eachPageList", eachPageList);
		
		ArrayList<Message> messageList = new ArrayList<Message>();
		messageList.add(message);
		if(Message.getMessageListMN(messageList, conn, eachPage.getPageIndex(), pageLength))
			request.setAttribute("messageList", messageList);
		
		
		request.getRequestDispatcher("MyPage.jsp").forward(request, response);
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
