package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Media {
	private String id;
	private User user;
	private String name;
	private String url;
	private String type;
	private String date;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	public Media(String id, User user, String name, String url, String type, String date) {
		super();
		this.id = id;
		this.user = user;
		this.name = name;
		this.url = url;
		this.type = type;
		this.date = date;
	}
	public Media(User user, String name, String url, String type) {
		super();
		this.user = user;
		this.name = name;
		this.url = url;
		this.type = type;
	}
	
	public Media(User user) {
		super();
		this.user = user;
	}
	
	public Media(String id) {
		super();
		this.id = id;
	}
	public static boolean insertMedia(Media media, Connection conn) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into media(userId,name,url,type) values (?,?,?,?)");
			pstmt.setString(1, media.getUser().getId());
			pstmt.setString(2, media.getName());
			pstmt.setString(3, media.getUrl());
			pstmt.setString(4, media.getType());
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
	
	public static boolean getMedia(Media media, Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select id,userId,name,url,type,from_unixtime(unix_timestamp(date),'%Y-%m-%d %H:%i') as date from media where Id = ?");
			pstmt.setString(1, media.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				media.setId(rs.getString("id"));
				media.setUser(new User(rs.getString("userId")));
				media.setName(rs.getString("name"));
				media.setUrl(rs.getString("url"));
				media.setType(rs.getString("type"));
				media.setDate(rs.getString("date"));
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
	public static boolean getMediaList(String userId, ArrayList<Media> mediaList, Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select id,userId,name,url,type,from_unixtime(unix_timestamp(date),'%Y-%m-%d %H:%i') as date from media where userId = ?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Media media = new Media(
						rs.getString("id"),
						new User(rs.getString("userId")),
						rs.getString("name"),
						rs.getString("url"),
						rs.getString("type"),
						rs.getString("date")
						);
				mediaList.add(media);
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
	public static boolean getMediaListEx(String userId, ArrayList<Media> mediaList, Connection conn) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("select id,userId,name,url,type,from_unixtime(unix_timestamp(date),'%Y-%m-%d %H:%i') as date from media where userId = ? and media.invalid != 1");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Media media = new Media(
						rs.getString("id"),
						new User(rs.getString("userId")),
						rs.getString("name"),
						rs.getString("url"),
						rs.getString("type"),
						rs.getString("date")
						);
				mediaList.add(media);
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
	public static boolean deleteMedia(String mediaId, Connection conn) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from media where id = ?");
			pstmt.setString(1, mediaId);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		return false;
	}
}
