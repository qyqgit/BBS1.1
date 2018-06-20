package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
			try {
				if(pstmt!=null)pstmt.close();
			} catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return false;
	}
}
