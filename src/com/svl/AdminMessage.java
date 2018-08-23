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

/**
 * Servlet implementation class AdminMessage
 */
@WebServlet("/AdminMessage")
public class AdminMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMessage() {
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
			Message.setMessageInvalid(request.getParameter("id"), conn);
		} else if("valid".equalsIgnoreCase(request.getParameter("method"))) {
			Message.setMessageValid(request.getParameter("id"), conn);
		} else if("delete".equalsIgnoreCase(request.getParameter("method"))){
			Message.deleteMessage(request.getParameter("id"), conn);
		}
		
		Properties profile = (Properties)request.getServletContext().getAttribute("profile");
		int pageLength;
		int[] count = {0};
		int listLength =  Integer.parseInt(profile.getProperty("page_listlength"));
		int pageNumber;
		Message.getMessageCountAdmin(count, conn);
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
		
		ArrayList<Message> messageList = new ArrayList<Message>();
		if(Message.getMessageListAdminMN(messageList, conn, eachPage.getPageIndex(), pageLength))
			request.setAttribute("messageList", messageList);
		request.getRequestDispatcher("admin/admin_message.jsp").forward(request, response);
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
