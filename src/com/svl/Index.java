package com.svl;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obj.EachPage;
import com.obj.MyPage;
import com.obj.User;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
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
		int pageLength;
		int[] count = {0};
		int listLength =  10;
		int pageNumber;
		MyPage.getMyPageCount(count, conn);
		try {
			pageLength = Integer.parseInt(request.getParameter("pageLength"));
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			pageLength = 30;
			pageNumber = 1;
		}
		EachPage eachPage = new EachPage(pageLength,count[0],listLength,pageNumber);
		int howManyPage = eachPage.getHowManyPage();
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("howManyPage", howManyPage);
		
		ArrayList<EachPage> eachPageList = eachPage.getEachPageList();
		request.setAttribute("eachPageList", eachPageList);
		
		ArrayList<MyPage> myPageList = new ArrayList<MyPage>();
		if(MyPage.getMyPageListMN(myPageList, conn, eachPage.getPageIndex(), pageLength))
			request.setAttribute("myPageList", myPageList);

		ArrayList<User> lastSendMessageUserList = new ArrayList<User>();
		if(User.getLastSendMessageUserListMN(lastSendMessageUserList, conn, eachPage.getPageIndex(), pageLength))
			request.setAttribute("lastSendMessageUserList", lastSendMessageUserList);


		request.getRequestDispatcher("index.jsp").forward(request, response);
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