package com.svl;

import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obj.Message;
import com.obj.MyPage;
import com.obj.User;

/**
 * Servlet implementation class SendMessage
 */
@WebServlet("/SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessage() {
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
		String replyId = null;
		User user = (User)session.getAttribute("user");
		String text = request.getParameter("textarea");
		int replyStart = text.indexOf("$reply");
		int replyEnd = text.indexOf("reply$");
		if(replyStart != -1 && replyStart != -1) {
			String replyHtml = "<a href='MyPageSvl?id=****&pageNumber=***&pageLength=**#*' >Reply</a> *:";
			String reply = text.substring(replyStart, replyEnd + 6);
			String[] temp = reply.split("'");
			String replyFloor = temp[1];
			replyId = temp[3];
			replyHtml = replyHtml.replace("****", request.getParameter("id"));
			Properties profile = (Properties)request.getServletContext().getAttribute("profile");
			int messageLength = Integer.parseInt(profile.getProperty("message_length"));
			String pageNumber = (Integer.parseInt(replyFloor) % messageLength == 0 ? Integer.parseInt(replyFloor) / messageLength : Integer.parseInt(replyFloor) / messageLength + 1) + "";
			replyHtml = replyHtml.replace("***", pageNumber);
			String pageLength = messageLength + "";
			replyHtml = replyHtml.replace("**", pageLength);
			replyHtml = replyHtml.replace("*", replyFloor);
			text = text.replace(reply, replyHtml);
		}
		Message message = new Message(replyId, new User(user.getId(),user.getName()),text,new MyPage(request.getParameter("id")), "0");
		if(!Message.insertMessage(message, conn))
			response.sendRedirect("MyPageSvl?id=" + request.getParameter("id") + "&pageNumber=" + request.getParameter("pageNumber") + "&pageLength=" + request.getParameter("pageLength"));
		else {
			int count[] = {0};
			int pageLength = Integer.parseInt(request.getParameter("pageLength"));
			Message.getMessageCount(count, message, conn);
			int howManyPage = count[0] % pageLength == 0 ? count[0] / pageLength : (count[0] / pageLength) +1 ;
			response.sendRedirect("MyPageSvl?id=" + request.getParameter("id") + "&pageNumber=" + howManyPage + "&pageLength=" + request.getParameter("pageLength"));
		}
		
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
