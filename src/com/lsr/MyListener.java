package com.lsr;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.obj.Database;
import com.obj.Emoji;
import com.obj.Message;
import com.obj.Profile;
import com.obj.SysTool;
import com.obj.User;

/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class MyListener implements ServletContextListener, HttpSessionListener, ServletRequestListener {
    private static int numMembers;
    private static int numConn;

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
        //se.getSession().setMaxInactiveInterval(10);
        if(se.getSession().getAttribute("conn") == null) {
            Properties profile = (Properties)se.getSession().getServletContext().getAttribute("profile");
            Connection conn = Database.getProfileConn(profile);
            if(conn!=null) {
                se.getSession().setAttribute("conn", conn);
                numConn++;
                se.getSession().getServletContext().setAttribute("numConn", numConn);
                System.out.println(conn + " created");
            }
        }
    }

    /**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
        System.out.println("sessionDestroyed");
        numMembers--;
        se.getSession().getServletContext().setAttribute("numMembers", numMembers);
        
        HttpSession session = se.getSession();
        Connection conn = (Connection)session.getAttribute("conn");
        try {
            if(conn!=null) {
                conn.close();
                numConn--;
                se.getSession().getServletContext().setAttribute("numConn", numConn);
                System.out.println(conn + " closed");
            } else
            System.out.println(conn + " is null");
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
        String etcPath = sce.getServletContext().getRealPath("/WEB-INF");
        String sysPath = sce.getServletContext().getRealPath("/sys");
        String profilePath = null;
        String emojiPath = null;
        if(!SysTool.isLinux())
            profilePath = etcPath + "\\etc\\config.ini";
        else
            profilePath = etcPath + "/etc/config.ini";
        Properties profile = Profile.getProfile(profilePath);
        sce.getServletContext().setAttribute("profile", profile);
        if(!SysTool.isLinux())
            emojiPath = sysPath + "\\pic\\emoji";
        else
            emojiPath = sysPath + "/pic/emoji";
        ArrayList<Emoji> emojiList = new ArrayList<Emoji>();
        if(Emoji.getEmojiList(emojiPath, emojiList))
            sce.getServletContext().setAttribute("emojiList", emojiList);
    }
    
    /**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent sre)  { 
         // TODO Auto-generated method stub
    }

    /**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent sre)  { 
         // TODO Auto-generated method stub
        HttpServletRequest request = (HttpServletRequest)sre.getServletRequest();
        User user = (User)request.getSession().getAttribute("user");
        if(user != null) {
            Connection conn = (Connection)request.getSession().getAttribute("conn");
            int count[] = {0};
            Message.getReplyCountEx(count, user, conn);
            request.getSession().setAttribute("count", count);
        }
    }
    
}
