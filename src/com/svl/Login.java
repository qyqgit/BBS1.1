package com.svl;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obj.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		User user = new User(request.getParameter("id"));
		if(session.getAttribute("passCodeNeed")== null) {
			if(User.getUser(user, conn)&&user.getPassword().equals(request.getParameter("password"))) {
				session.removeAttribute("passCodeNeed");
				session.setAttribute("user", user);
				response.sendRedirect("index");
			} else {
				session.setAttribute("passCodeNeed", passCodeNeed);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		} else {
			String code = (String)session.getAttribute("code");
			String passCode = request.getParameter("passcode");
			if(code.equalsIgnoreCase(passCode)) {
				if(User.getUser(user, conn)&&user.getPassword().equals(request.getParameter("password"))) {
					session.removeAttribute("passCodeNeed");
					session.setAttribute("user", user);
					response.sendRedirect("index");
				} else {
					session.setAttribute("passCodeNeed", passCodeNeed);
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}
			} else {
				session.setAttribute("passCodeNeed", passCodeNeed);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
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
