package com.obj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class Database {
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://127.0.0.1:3306/temp";
    private static String user = "root";
    private static String password = "qin123";
    
    public static String getDriver() {
        return driver;
    }
    public static void setDriver(String driver) {
        Database.driver = driver;
    }
    public static String getUrl() {
        return url;
    }
    public static void setUrl(String url) {
        Database.url = url;
    }
    public static String getUser() {
        return user;
    }
    public static void setUser(String user) {
        Database.user = user;
    }
    public static String getPassword() {
        return password;
    }
    public static void setPassword(String password) {
        Database.password = password;
    }
    public static Connection getConn() {
        String driver = Database.getDriver();
        String url = Database.getUrl();
        String user = Database.getUser();
        String password = Database.getPassword();
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    public static Connection getProfileConn(Properties profile) {
        String driver = profile.getProperty("db_driver");
        String url = profile.getProperty("db_url");
        String user = profile.getProperty("db_user");
        String password = profile.getProperty("db_password");
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
    public static boolean closeResultSet(ResultSet rs) {
        if(rs != null) {
            try {
                rs.close();
                return true;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return false;
        
    }
    public static boolean closePreparedStatement(PreparedStatement pstmt) {
        if(pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return false;
        
    }
    public static boolean closeConnection(Connection conn) {
        if(conn != null) {
            try {
                conn.close();
                System.out.println("conn close");
                return true;
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else {
            String method = Thread.currentThread().getStackTrace()[1].getMethodName();
            System.out.println("conn null " + method);
        }
        return false;
    }
    
}
