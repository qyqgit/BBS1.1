package com.svl;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obj.Admin;
import com.obj.MyLog;
import com.obj.User;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int passCodeNeed = 1;
		HttpSession session = request.getSession();
		Connection conn = (Connection)session.getAttribute("conn");
		Admin admin = new Admin(request.getParameter("id"));
		if(session.getAttribute("passCodeNeed")== null) {
			if(Admin.getAdmin(admin, conn)&&admin.getPassword().equals(request.getParameter("password"))) {
				loginSuccess(request, response, session, admin);
			} else {
				loginFail(request, response, passCodeNeed, session);
			}
		} else {
			String code = (String)session.getAttribute("code");
			String passCode = request.getParameter("passcode");
			if(code.equalsIgnoreCase(passCode)) {
				if(Admin.getAdmin(admin, conn)&&admin.getPassword().equals(request.getParameter("password"))) {
					loginSuccess(request, response, session, admin);
				} else {
					loginFail(request, response, passCodeNeed, session);
				}
			} else {
				loginFail(request, response, passCodeNeed, session);
			}
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void loginFail(HttpServletRequest request, HttpServletResponse response, int passCodeNeed,
			HttpSession session) throws ServletException, IOException {
		session.setAttribute("passCodeNeed", passCodeNeed);
		request.getRequestDispatcher("AdminLogin.jsp").forward(request, response);
	}

	private void loginSuccess(HttpServletRequest request, HttpServletResponse response, HttpSession session, Admin admin) throws IOException {
		session.removeAttribute("passCodeNeed");
		session.setAttribute("admin", admin);
		MyLog myLog = new MyLog(request.getRemoteAddr(), (User)admin, request.getRequestURI() + "?" + request.getQueryString());
		Connection conn = (Connection)session.getAttribute("conn");
		MyLog.insertMyLog(myLog, conn);
		response.sendRedirect("Admin.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
