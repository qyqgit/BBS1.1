package com.obj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Database {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://127.0.0.1:3306/temp";
	private static String user = "root";
	private static String password = "qin123";
	private static Connection conn;
	
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
		conn = null;
		try {

			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static Connection getProfileConn(Properties profile) {
		String driver = profile.getProperty("db_driver");
		String url = profile.getProperty("db_url");
		String user = profile.getProperty("db_user");
		String password = profile.getProperty("db_password");
		conn = null;
		try {
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void setConn(Connection conn) {
		Database.conn = conn;
	}
	
	

}
