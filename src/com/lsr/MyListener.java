package com.lsr;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.obj.Profile;

/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class MyListener implements ServletContextListener, HttpSessionListener {
	private static int numMembers;

    /**
     * Default constructor. 
     */
    public MyListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	System.out.println("sessionCreated");
    	numMembers++;
    	se.getSession().getServletContext().setAttribute("numMembers", numMembers);
    	//se.getSession().setMaxInactiveInterval(2);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	System.out.println("sessionDestroyed");
    	numMembers++;
    	se.getSession().getServletContext().setAttribute("numMembers", numMembers);
    	
    	HttpSession session = se.getSession();
    	Connection conn = (Connection)session.getAttribute("conn");
    	try {
			if(conn!=null) {
				conn.close();
				System.out.println(conn + " closed");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	String realPath = sce.getServletContext().getRealPath("/sys");
    	realPath = realPath + "\\etc\\config.ini";
    	Properties profile = Profile.getProfile(realPath);
    	sce.getServletContext().setAttribute("profile", profile);
    }
	
}
