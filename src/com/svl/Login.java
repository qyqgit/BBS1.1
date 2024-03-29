package com.svl;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obj.MyLog;
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
            if(User.getUser(user, conn) && user.getPassword().equals(request.getParameter("password")) && "0".equals(user.getInvalid())) {
                loginSuccess(request, response, session, user);
            } else {
                loginFail(request, response, passCodeNeed, session);
            }
        } else {
            String code = (String)session.getAttribute("code");
            String passCode = request.getParameter("passcode");
            if(code.equalsIgnoreCase(passCode)) {
                if(User.getUser(user, conn) && user.getPassword().equals(request.getParameter("password")) && "0".equals(user.getInvalid())) {
                    loginSuccess(request, response, session, user);
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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    private void loginSuccess(HttpServletRequest request, HttpServletResponse response, HttpSession session, User user) throws IOException {
        session.removeAttribute("passCodeNeed");
        session.setAttribute("user", user);
        MyLog myLog = new MyLog(request.getRemoteAddr(), user, request.getRequestURI() + "?" + request.getQueryString());
        Connection conn = (Connection)session.getAttribute("conn");
        MyLog.insertMyLog(myLog, conn);
        Cookie ck = new Cookie("TOKEN", session.getId());
        ck.setMaxAge(3600 * 24 * 31);
        ck.setHttpOnly(true);
        //ck.setSecure(true);
        response.addCookie(ck);
        user.setToken(session.getId());
        user.setIpAddress(request.getRemoteAddr());
        User.updateUserTokenAndIp(user, conn);
        response.sendRedirect("index");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
