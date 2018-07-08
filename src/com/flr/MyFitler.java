package com.flr;

import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.obj.Database;
import com.obj.MyLog;
import com.obj.User;

/**
 * Servlet Filter implementation class MyFilter
 */
@WebFilter("/MyFilter")
public class MyFitler implements Filter {

    /**
     * Default constructor. 
     */
    public MyFitler() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
        HttpServletRequest req = (HttpServletRequest)request;  
          
        HttpSession session = req.getSession();
        
        User user = (User)session.getAttribute("user");
        MyLog myLog = new MyLog(req.getRemoteAddr(), user, req.getRequestURI() + "?" + req.getQueryString());
        if(session.getAttribute("conn") == null) {
        	Properties profile = (Properties)req.getServletContext().getAttribute("profile");
        	Connection conn = Database.getProfileConn(profile);
        	if(conn!=null) {
    			session.setAttribute("conn", conn);
    			System.out.println(conn + " created");
        	}
        	MyLog.insertMyLog(myLog, conn);
        }
        Connection conn = (Connection)session.getAttribute("conn");
        MyLog.insertMyLog(myLog, conn);
        
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
