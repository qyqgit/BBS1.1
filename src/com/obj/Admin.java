package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Admin extends User {
	
	public Admin(String id, String name, String password, String date, String invalid) {
		super(id, name, password, date, invalid);
		// TODO Auto-generated constructor stub
	}
	
	public Admin(String name, String password, String sex) {
		super(name, password, sex);
		// TODO Auto-generated constructor stub
	}

	public Admin(String id) {
		super(id);
		// TODO Auto-generated constructor stub
	}
	public static boolean insertAdmin(Admin admin,Connection conn) {
		if(admin.getName() == null || admin.getName().length() == 0)
			return false;
		if(admin.getPassword() == null || admin.getPassword().length() == 0)
			return false;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into admin(name,password) values (?,?)");
			pstmt.setString(1, admin.getName());
			pstmt.setString(2, admin.getPassword());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
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
	public static boolean updateAdmin(Admin admin,Connection conn) {
		//password->5f4dcc3b5aa765d61d8327deb882cf99->696d29e0940a4957748fe3fc9efd22a3
		if(admin.getName() == null || admin.getName().length() == 0)
			return false;
		if(admin.getPassword() == null || admin.getPassword().length() == 0)
			return false;
		if("696d29e0940a4957748fe3fc9efd22a3".equalsIgnoreCase(admin.getPassword())) {
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement("update admin set name=? where id=?");
				pstmt.setString(1, admin.getName());
				pstmt.setString(2, admin.getId());
				pstmt.executeUpdate();
				return true;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if(pstmt!=null)pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			return false;
		}
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update admin set name=?,password=? where id=?");
			pstmt.setString(1, admin.getName());
			pstmt.setString(2, admin.getPassword());
			pstmt.setString(3, admin.getId());
			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	public static boolean getAdminListAdminMN(ArrayList<Admin> adminList, Connection conn, int pageIndex, int pageLength) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from admin order by id desc limit ?,?");
			pstmt.setInt(1, pageIndex);
			pstmt.setInt(2, pageLength);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Admin admin = new Admin(
						rs.getString("id"),
						rs.getString("name"),
						rs.getString("password"),
						rs.getString("date"),
						rs.getString("invalid")
						);
				adminList.add(admin);
			}
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			try {
				if(rs!=null)rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	public static boolean getAdminCountAdmin(int[] count, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select count(id) from admin");
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
	public static boolean setAdminInvalid(String id, Connection conn) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update admin set invalid=1 where id=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
	public static boolean setAdminValid(String id, Connection conn) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update admin set invalid=0 where id=?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
	}
	public static boolean deleteAdmin(String id, Connection conn) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("delete from admin where id = ?");
			pstmt.setString(1, id);
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
