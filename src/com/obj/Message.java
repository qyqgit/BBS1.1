package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Message {
	private String id;
	private String date;
	private User user;
	private String text;
	private String pageId;
	private String floorNumber;
	public String getPageId() {
		return pageId;
	}
	public void setPageId(String pageId) {
		this.pageId = pageId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getFloorNumber() {
		return floorNumber;
	}
	public void setFloorNumber(String floorNumber) {
		this.floorNumber = floorNumber;
	}
	public Message(String id, String date, User user, String text, String pageId, String floorNumber) {
		super();
		this.id = id;
		this.date = date;
		this.user = user;
		this.text = text;
		this.pageId = pageId;
		this.floorNumber = floorNumber;
	}
	
	public Message(User user, String text, String pageId) {
		super();
		this.user = user;
		this.text = text;
		this.pageId = pageId;
	}
	
	
	public Message(String pageId) {
		super();
		this.pageId = pageId;
	}
	public static boolean insertMessage(Message message, Connection conn) {
		
		if(message.text==null||message.text.length()==0)
			return false;
		String messageNumber = "0";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			int transaction = conn.getTransactionIsolation();
			boolean autoCommit = conn.getAutoCommit();
			conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("select messageNumber from mypage where id = ?");
			pstmt.setString(1, message.getPageId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				messageNumber = rs.getString("messageNumber");
			}
			
			pstmt = conn.prepareStatement("insert into message(userid,text,pageId,floorNumber) values (?,?,?,?)");
			pstmt.setString(1, message.getUser().getId());
			pstmt.setString(2, message.getText());
			pstmt.setString(3, message.getPageId());
			pstmt.setString(4, Integer.parseInt(messageNumber) + 1 + "");
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update mypage set messageNumber=messageNumber+1 where id = ?");
			pstmt.setString(1, message.getPageId());
			pstmt.executeUpdate();
			
			conn.commit();
			conn.setAutoCommit(autoCommit);
			conn.setTransactionIsolation(transaction);
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			try {
				if(conn!=null)conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch(SQLException  e){
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch(SQLException  e){
				e.printStackTrace();
			}
		}
		return false;
	}
	public static boolean getMessageList(ArrayList<Message> messageList, Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select message.id,userId,text,name,pageid,from_unixtime(unix_timestamp(message.date),'%Y-%m-%d %H:%i') as date,floorNumber from message,user where pageid = ? and message.userId = user.id order by floornumber");
			pstmt.setString(1, messageList.get(0).getPageId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Message message = new Message(
						rs.getString("id"),
						rs.getString("date"),
						new User(rs.getString("userId"),rs.getString("name")),
						rs.getString("text"),
						rs.getString("pageId"),
						rs.getString("floorNumber")
						);
				messageList.add(message);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		return false;
	}
	public static boolean getMessageListMN(ArrayList<Message> messageList, Connection conn, int pageIndex, int pageLength) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select message.id,userId,text,name,pageid,from_unixtime(unix_timestamp(message.date),'%Y-%m-%d %H:%i') as date,floorNumber from message,user where pageid = ? and message.userId = user.id order by floornumber limit ?,?");
			pstmt.setString(1, messageList.get(0).getPageId());
			pstmt.setInt(2, pageIndex);
			pstmt.setInt(3, pageLength);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Message message = new Message(
						rs.getString("id"),
						rs.getString("date"),
						new User(rs.getString("userId"),rs.getString("name")),
						rs.getString("text"),
						rs.getString("pageId"),
						rs.getString("floorNumber")
						);
				messageList.add(message);
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		return false;
	}
	public static boolean getMessageCount(int[] count,Message message, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(*) from message where pageId = ?");
			pstmt.setString(1, message.getPageId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count[0] = Integer.parseInt(rs.getString("count(*)"));
				if(count[0]==0)
					count[0]++;
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
