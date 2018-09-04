package com.svl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obj.User;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		User user = new User(
						request.getParameter("name"),
						request.getParameter("password"),
						request.getParameter("birthday"),
						request.getParameter("sex"));
		if(User.insertUser(user, conn)) {
			User.getLastRegisterdUserId(user, conn);
			response.setContentType(getServletContext().getMimeType("*.txt"));
			response.setHeader("Content-Disposition", "attachment;filename=FISHCC.ORG_" + user.getId() + ".txt");
			String path = getServletContext().getRealPath("sys/pic/fish52.png");
			System.out.println(path);
			InputStream in = new FileInputStream(path);
			OutputStream out = response.getOutputStream();
			int len = 0;
			byte[] buffer = new byte[128];
			while((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
				System.out.println(len);
			}
			in.close();
			request.getRequestDispatcher("Login.jsp?userId=" + user.getId()).forward(request, response);
			//response.sendRedirect("Login.jsp?userId=" + user.getId());
		}
		else
			response.sendRedirect("Register.jsp");

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
