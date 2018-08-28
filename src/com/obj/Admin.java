package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Admin extends User {
	
	public Admin(String id, String name, String password, String date, String invalid) {
		super(id, name, password, date, invalid);
		// TODO Auto-generated constructor stub
	}
	public Admin(String id) {
		super(id);
		// TODO Auto-generated constructor stub
	}

	public static boolean getAdmin(Admin admin,Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select id,name,password,date,invalid from admin where id = ?");
			pstmt.setString(1, admin.getId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				admin.setId(rs.getString("id"));
				admin.setName(rs.getString("name"));
				admin.setPassword(rs.getString("password"));
				admin.setDate(rs.getString("date"));
				admin.setInvalid(rs.getString("invalid"));
				return true;
			}
			return false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
			try {
				if(rs!=null)rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

}
