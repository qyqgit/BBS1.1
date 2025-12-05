package com.lsr;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.Cookie;
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
        se.getSession().setMaxInactiveInterval(60 * 25);
        if(se.getSession().getAttribute("conn") == null) {
            Properties profile = (Properties)se.getSession().getServletContext().getAttribute("profile");
            Connection conn = Database.getProfileConn(profile);
            if(conn!=null) {
                se.getSession().setAttribute("conn", conn);
            }
        }
    }

    /**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
        HttpSession session = se.getSession();;
        Connection conn = (Connection)session.getAttribute("conn");
        if(conn == null) {
            Method method = getClass().getEnclosingMethod();
            System.out.println("conn null " + method.getName());
        }
        else
            Database.closeConnection(conn);
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
        int maxConnections = 0;
        String etcPath = sce.getServletContext().getRealPath("/WEB-INF");
        String sysPath = sce.getServletContext().getRealPath("/sys");
        String profilePath = null;
        String emojiPath = null;
        String codePagePath = null;
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
        if(!SysTool.isLinux())
            codePagePath = sysPath + "\\codepg\\" + profile.getProperty("language");
        else
            codePagePath = sysPath + "/codepg/" + profile.getProperty("language");
        Map<String, String> codePageMap = new HashMap<String, String>();
        Properties codePage = Profile.getProfile(codePagePath);
        Set<Entry<Object, Object>> entrySet = codePage.entrySet();
        for (Entry<Object, Object> entry : entrySet)
            codePageMap.put((String) entry.getKey(), (String) entry.getValue());
        //Map<String, String> codePageMap = new HashMap<String, String>((Map)Profile.getProfile(codePagePath));
        sce.getServletContext().setAttribute("codePageMap", codePageMap);
        Connection conn = Database.getProfileConn(profile);
        maxConnections = Integer.parseInt(profile.getProperty("db_max_connections"));
        if(conn != null) {
            SysTool.setMaxConnections(conn, maxConnections);
            Database.closeConnection(conn);
        }else {
            Method method = getClass().getEnclosingMethod();
            System.out.println("conn null " + method.getName());
        }
        
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
        Connection conn = (Connection)request.getSession().getAttribute("conn");
        if(user == null) {
            user = new User("");
            Cookie[] cookies = request.getCookies();
            if(cookies != null) {
                for(Cookie cookie : cookies) {
                    if(cookie.getName().equalsIgnoreCase("TOKEN"))
                        user.setToken(cookie.getValue());
                }
                if(User.getUserByToken(user, conn)) {
                    String userIp = user.getIpAddress();
                    String remoteIp = request.getRemoteAddr();
                    System.out.println("userIp:" + userIp);
                    System.out.println("remoteIp:" + remoteIp);
                    if(userIp.indexOf(':') ==-1 && remoteIp.indexOf(':') == -1) {//ipv4
                        String userIps[] = userIp.split("\\.");
                        String remoteIps[] = remoteIp.split("\\.");
                        if(userIps[0].compareTo(remoteIps[0]) == 0 && userIps[1].compareTo(remoteIps[1]) == 0)
                            request.getSession().setAttribute("user", user);
                    }else {//ipv6 ???
                        String userIps[] = userIp.split(":");
                        String remoteIps[] = remoteIp.split(":");
                        if(userIps[0].compareTo(remoteIps[0]) == 0 && userIps[1].compareTo(remoteIps[1]) == 0)
                            request.getSession().setAttribute("user", user);
                    }
                }
                else
                    user = null;
            }else
                user = null;
        }
        if(user != null) {
            int count[] = {0};
            Message.getReplyCountEx(count, user, conn);
            request.getSession().setAttribute("count", count);
        }
        int numMembers = SysTool.activeSessions(request);
        int numConn = SysTool.acitveConnections(conn);
        sre.getServletContext().setAttribute("numMembers", numMembers);
        sre.getServletContext().setAttribute("numConn", numConn);
    }
    
}