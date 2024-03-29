package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MyLog {
    private String id;
    private String date;
    private String ip;
    private User user;
    private String url;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getIp() {
        return ip;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    
    public MyLog(String id, String date, String ip, User user, String url) {
        super();
        this.id = id;
        this.date = date;
        this.ip = ip;
        this.user = user;
        this.url = url;
    }
    public MyLog(String ip, User user, String url) {
        super();
        this.ip = ip;
        this.user = user;
        this.url = url;
    }
    public static boolean insertMyLog(MyLog myLog, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("insert into log(ip,userid,url) values (?,?,?)");
            pstmt.setString(1, myLog.getIp());
            pstmt.setString(2, myLog.getUser() == null ? null : myLog.getUser().getId());
            pstmt.setString(3, myLog.getUrl());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getLogListAdminMN(ArrayList<MyLog> myLogList, Connection conn, int pageIndex, int pageLength) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select * from (select log.id,log.date,ip,userId,url,name from log,user where userId=user.id union select log.id,log.date,log.ip,userId,url,name from log,admin where userId=admin.id)as table1 order by table1.id desc limit ?,?");
            pstmt.setInt(1, pageIndex);
            pstmt.setInt(2, pageLength);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                MyLog myLog = new MyLog(
                        rs.getString("table1.id"),
                        rs.getString("table1.date"),
                        rs.getString("ip"),
                        new User(rs.getString("userId"), rs.getString("table1.name")),
                        rs.getString("url")
                        );
                myLogList.add(myLog);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        } 
        return false;
    }
    public static boolean getLogCountAdmin(int[] count, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from log");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count[0] = Integer.parseInt(rs.getString("count(id)"));
                if(count[0]==0)
                    count[0]++;
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
}
