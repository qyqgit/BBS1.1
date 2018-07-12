package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Message {
	private String id;
	private String replyId;
	private String date;
	private User user;
	private String text;
	private MyPage myPage;
	private String floorNumber;
	private String read;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public MyPage getMyPage() {
		return myPage;
	}

	public void setMyPage(MyPage myPage) {
		this.myPage = myPage;
	}

	public String getFloorNumber() {
		return floorNumber;
	}

	public void setFloorNumber(String floorNumber) {
		this.floorNumber = floorNumber;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public Message(String id, String date, User user, String text, MyPage myPage, String floorNumber) {
		super();
		this.id = id;
		this.date = date;
		this.user = user;
		this.text = text;
		this.myPage = myPage;
		this.floorNumber = floorNumber;
	}
	
	public Message(String replyId, User user, String text, MyPage myPage, String read) {
		super();
		this.replyId = replyId;
		this.user = user;
		this.text = text;
		this.myPage = myPage;
		this.read = read;
	}
	
	
	public Message(MyPage myPage) {
		super();
		this.myPage = myPage;
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
			pstmt.setString(1, message.getMyPage().getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				messageNumber = rs.getString("messageNumber");
			}
			
			pstmt = conn.prepareStatement("insert into message(replyId,userid,text,pageId,floorNumber,haveRead) values (?,?,?,?,?,?)");
			pstmt.setString(1, message.getReplyId());
			pstmt.setString(2, message.getUser().getId());
			pstmt.setString(3, message.getText());
			pstmt.setString(4, message.getMyPage().getId());
			pstmt.setString(5, Integer.parseInt(messageNumber) + 1 + "");
			pstmt.setString(6, message.getRead());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update mypage set messageNumber=messageNumber+1 where id = ?");
			pstmt.setString(1, message.getMyPage().getId());
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
			pstmt.setString(1, messageList.get(0).getMyPage().getId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Message message = new Message(
						rs.getString("id"),
						rs.getString("date"),
						new User(rs.getString("userId"),rs.getString("name")),
						rs.getString("text"),
						new MyPage(rs.getString("pageId")),
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
	public static boolean getReplyList(String userId, ArrayList<Message> replyList, Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select table3.id,table3.date,table3.userid,table3.text,table3.pageid,table3.floornumber,table3.name,mypage.title from(select table2.id,from_unixtime(unix_timestamp(table2.date),'%Y-%m-%d %H:%i') as date,table2.userid,table2.text,table2.pageid,table2.floornumber,user.name from (select message.id,message.date,message.userid,message.text,message.pageid,message.floornumber from (select mypage.id from mypage where userid = ?)as table1,message where pageid=table1.id and userid != ? union select message.id,message.date,message.userid,message.text,message.pageid,message.floornumber from (select id from message where userid = ? )as table1,message where replyid = table1.id order by date desc) as table2,user where table2.userid = user.id)as table3,mypage where table3.pageid = mypage.id;");
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			pstmt.setString(3, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Message message = new Message(
						rs.getString("id"),
						rs.getString("date"),
						new User(rs.getString("userId"), rs.getString("name")),
						rs.getString("text"),
						new MyPage(rs.getString("pageId"), rs.getString("title")),
						rs.getString("floorNumber")
						);
				replyList.add(message);
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
			pstmt.setString(1, messageList.get(0).getMyPage().getId());
			pstmt.setInt(2, pageIndex);
			pstmt.setInt(3, pageLength);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Message message = new Message(
						rs.getString("id"),
						rs.getString("date"),
						new User(rs.getString("userId"),rs.getString("name")),
						rs.getString("text"),
						new MyPage(rs.getString("pageId")),
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
			pstmt = conn.prepareStatement("select count(id) from message where pageId = ?");
			pstmt.setString(1, message.getMyPage().getId());
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
