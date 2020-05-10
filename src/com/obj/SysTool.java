package com.obj;
import org.apache.catalina.Context;
import org.apache.catalina.Manager;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.RequestFacade;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
public class SysTool {
    public static boolean isLinux() {
        return System.getProperty("os.name").toLowerCase().indexOf("linux") >= 0; 
    }
    public static int activeSessions(HttpServletRequest request) {
    	int activeSessions = 0;
    	if (request instanceof RequestFacade) {
            Field requestField = null;
            try {
                requestField = request.getClass().getDeclaredField("request");
            } catch (NoSuchFieldException | SecurityException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            requestField.setAccessible(true);
            Request req = null;
            try {
                req = (Request) requestField.get(request);
            } catch (IllegalArgumentException | IllegalAccessException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            Context context = req.getContext();
            Manager manager = context.getManager();
            activeSessions = manager.getActiveSessions();
            return activeSessions;
    	}
    	return activeSessions;
    }
    public static int acitveConnections(Connection conn) {
        int activeConnections = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("show status like 'threads_connected'");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                activeConnections = Integer.parseInt(rs.getString("value"));
                return  activeConnections;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt!=null)pstmt.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
            try {
                if(rs!=null)rs.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        return activeConnections;
    }
    public static int getMaxConnections(Connection conn) {
        int maxConnections = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("show variables like'max_connections'");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                maxConnections = Integer.parseInt(rs.getString("value"));
                return  maxConnections;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt!=null)pstmt.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
            try {
                if(rs!=null)rs.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        return maxConnections;
    }
    public static boolean setMaxConnections(Connection conn, int maxConnections) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("set global max_connections=?;");
            pstmt.setInt(1, maxConnections);
            rs = pstmt.executeQuery();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt!=null)pstmt.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
            try {
                if(rs!=null)rs.close();
            }catch(SQLException e)
            {
                e.printStackTrace();
            }
        }
        return false;
    }
}
