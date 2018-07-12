package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyPage {
	private String id;
	private String title;
	private String text;
	private User user;
	private String date;
	private String createDate;
	private String messageNumber;
	
	public MyPage(String id, String title, String text, User user, String date, String createDate, String messageNumber) {
		super();
		this.id = id;
		this.title = title;
		this.text = text;
		this.user = user;
		this.date = date;
		this.createDate = createDate;
		this.messageNumber = messageNumber;
	}
	
	public MyPage(String title, String text, User user) {
		super();
		this.title = title;
		this.text = text;
		this.user = user;
	}
	

	public MyPage(String id, String title) {
		super();
		this.id = id;
		this.title = title;
	}

	public MyPage(String id) {
		super();
		this.id = id;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getMessageNumber() {
		return messageNumber;
	}
	public void setMessageNumber(String messageNumber) {
		this.messageNumber = messageNumber;
	}
	public static boolean insertMyPage(MyPage myPage, Connection conn) {
		if(myPage.getTitle()==null||myPage.getTitle().length()==0) {
			return false;
		}
		if(myPage.getText()==null||myPage.getText().length()==0) {
			return false;
		}
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into mypage(title,text,userid,messageNumber) values (?,?,?,?)");
			pstmt.setString(1, myPage.getTitle());
			pstmt.setString(2, myPage.getText());
			pstmt.setString(3, myPage.getUser().getId());
			pstmt.setString(4, "0");
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
	public static boolean getMyPageList(ArrayList<MyPage> myPageList, Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select mypage.id,text,messageNumber,title,name,userId,from_unixtime(unix_timestamp(mypage.createDate),'%Y-%m-%d %H:%i') as createDate,from_unixtime(unix_timestamp(mypage.date),'%Y-%m-%d %H:%i:%S') as date from mypage,user where mypage.userId=user.id order by mypage.date desc;");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MyPage myPage = new MyPage(
						rs.getString("id"),
						rs.getString("title"),
						rs.getString("text"),
						new User(rs.getString("userId"),rs.getString("name")),
						rs.getString("date"),
						rs.getString("createDate"),
						rs.getString("messageNumber"));
				myPageList.add(myPage);
			}
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			try {
				if(pstmt!=null)pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	public static boolean getMyPageListMN(ArrayList<MyPage> myPageList, Connection conn, int pageIndex, int pageLength) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select mypage.id,text,messageNumber,title,name,userId,from_unixtime(unix_timestamp(mypage.createDate),'%m-%d %H:%i') as createDate,from_unixtime(unix_timestamp(mypage.date),'%m-%d %H:%i:%S') as date from mypage,user where mypage.userId=user.id order by mypage.date desc limit ?,?;");
			pstmt.setInt(1, pageIndex);
			pstmt.setInt(2, pageLength);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MyPage myPage = new MyPage(
						rs.getString("id"),
						rs.getString("title"),
						rs.getString("text"),
						new User(rs.getString("userId"),rs.getString("name")),
						rs.getString("date"),
						rs.getString("createDate"),
						rs.getString("messageNumber"));
				myPageList.add(myPage);
			}
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			try {
				if(pstmt!=null)pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	public static boolean getMyPage(MyPage myPage, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select mypage.id,title,text,userId,name,from_unixtime(unix_timestamp(mypage.createDate),'%Y-%m-%d %H:%i') as createDate,messageNumber from mypage,user where mypage.id = ? and mypage.userId = user.id");
			pstmt.setString(1, myPage.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				myPage.setId(rs.getString("id"));
				myPage.setTitle(rs.getString("title"));
				myPage.setText(rs.getString("text"));
				myPage.setUser(new User(rs.getString("userId"),rs.getString("name")));
				myPage.setDate(rs.getString("createDate"));
				myPage.setMessageNumber(rs.getString("messageNumber"));
				return true;
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
		return false;
	}
	public static boolean getMyPageCount(int[] count, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from mypage");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count[0] = Integer.parseInt(rs.getString("count(*)"));
				return true;
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
		return false;
	}
}
