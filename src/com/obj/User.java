package com.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class User {
    private String id;
    private String name;
    private String password;
    private String age;
    private String sex;
    private String date;
    private String invalid;
    private String token;
    private String ipAddress;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAge() {
        return age;
    }
    public void setAge(String age) {
        this.age = age;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    
    public String getInvalid() {
        return invalid;
    }
    public void setInvalid(String invalid) {
        this.invalid = invalid;
    }
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    public String getIpAddress() {
        return ipAddress;
    }
    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }
    public User(String id, String name, String password, String age, String sex, String date, String invalid) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.age = age;
        this.sex = sex;
        this.date = date;
        this.invalid = invalid;
    }
    public User(String id, String name, String password, String age, String sex, String date) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.age = age;
        this.sex = sex;
        this.date = date;
    }
    
    public User(String id, String name, String password, String date, String invalid) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.date = date;
        this.invalid = invalid;
    }
    public User(String name, String password, String age, String sex) {
        super();
        this.name = name;
        this.password = password;
        this.age = age;
        this.sex = sex;
    }
    
    public User(String name, String password, String sex) {
        super();
        this.name = name;
        this.password = password;
        this.sex = sex;
    }
    
    public User(String id, String name) {
        super();
        this.id = id;
        this.name = name;
    }
    public User(String id) {
        super();
        this.id = id;
    }
    public static boolean insertUser(User user,Connection conn)
    {
        if(user.name == null || user.name.length() == 0)
            return false;
        if(user.password == null || user.password.length() == 0)
            return false;
        if(user.age == null || user.age.length() == 0) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement("insert into user(name,password,sex) values (?,?,?)");
                pstmt.setString(1, user.getName());
                pstmt.setString(2, user.getPassword());
                pstmt.setString(3, user.getSex());
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
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("insert into user(name,password,birthday,sex) values (?,?,?,?)");
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getAge());
            //SET SESSION sql_mode=NO_ZERO_IN_DATE;
            pstmt.setString(4, user.getSex());
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
    public static boolean getUser(User user,Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select id,name,password,birthday,sex,from_unixtime(unix_timestamp(date),'%Y-%m-%d %H:%i') as date,invalid,token,ipAddress from user where id = ?");
            pstmt.setString(1, user.getId());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setAge(rs.getString("birthday"));
                user.setSex(rs.getString("sex"));
                user.setDate(rs.getString("date"));
                user.setInvalid(rs.getString("invalid"));
                user.setToken(rs.getString("token"));
                user.setIpAddress(rs.getString("ipAddress"));
                return true;
            }
            return false;
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getUserByToken(User user,Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select id,name,password,birthday,sex,from_unixtime(unix_timestamp(date),'%Y-%m-%d %H:%i') as date,invalid,token,ipAddress from user where token = ?");
            pstmt.setString(1, user.getToken());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setAge(rs.getString("birthday"));
                user.setSex(rs.getString("sex"));
                user.setDate(rs.getString("date"));
                user.setInvalid(rs.getString("invalid"));
                user.setToken(rs.getString("token"));
                user.setIpAddress(rs.getString("ipAddress"));
                return true;
            }
            return false;
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean updateUser(User user,Connection conn) {
        //password->5f4dcc3b5aa765d61d8327deb882cf99->696d29e0940a4957748fe3fc9efd22a3
        if(user.name == null || user.name.length() == 0)
            return false;
        if(user.password == null || user.password.length() == 0)
            return false;
        if(user.age == null || user.age.length() == 0) {
            if("696d29e0940a4957748fe3fc9efd22a3".equalsIgnoreCase(user.password)) {
                PreparedStatement pstmt = null;
                try {
                    pstmt = conn.prepareStatement("update user set name=?,birthday=?,sex=? where id=?");
                    pstmt.setString(1, user.getName());
                    pstmt.setString(2, null);
                    pstmt.setString(3, user.getSex());
                    pstmt.setString(4, user.getId());
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
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement("update user set name=?,password=?,birthday=?,sex=? where id=?");
                pstmt.setString(1, user.getName());
                pstmt.setString(2, user.getPassword());
                pstmt.setString(3, null);
                pstmt.setString(4, user.getSex());
                pstmt.setString(5, user.getId());
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
        if("696d29e0940a4957748fe3fc9efd22a3".equalsIgnoreCase(user.password)) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement("update user set name=?,birthday=?,sex=? where id=?");
                pstmt.setString(1, user.getName());
                pstmt.setString(2, user.getAge());
                pstmt.setString(3, user.getSex());
                pstmt.setString(4, user.getId());
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
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update user set name=?,password=?,birthday=?,sex=? where id=?");
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getAge());
            pstmt.setString(4, user.getSex());
            pstmt.setString(5, user.getId());
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
    public static boolean updateUserTokenAndIp(User user, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update user set token=?,ipAddress=? where id=?");
            pstmt.setString(1, user.getToken());
            pstmt.setString(2, user.getIpAddress());
            pstmt.setString(3, user.getId());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean invalidUserTokenAndIp(User user, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update user set token=?,ipAddress=? where id=?");
            pstmt.setString(1, "");
            pstmt.setString(2, "");
            pstmt.setString(3, user.getId());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getLastRegisterdUserId(User user, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select last_insert_id();");
            rs = pstmt.executeQuery();
            while(rs.next()) {
                user.setId(rs.getString("last_insert_id()"));
                return true;
            }
            return false;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getLastSendMessageUserList(ArrayList<User> userList, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select user.id,name from (select mypage.date,message.userid from mypage left join message on messagenumber=floornumber and mypage.id=message.pageid order by mypage.date desc)as table1 left join user on table1.userid=user.id order by table1.date desc");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getString("user.id"),
                        rs.getString("name")
                        );
                userList.add(user);
            }
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getLastSendMessageUserListMN(ArrayList<User> userList, Connection conn, int pageIndex, int pageLength) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select user.id,name from (select mypage.date,message.userid from mypage left join message on messagenumber=floornumber and mypage.id=message.pageid order by mypage.date desc)as table1 left join user on table1.userid=user.id order by table1.date desc limit ?,?");
            pstmt.setInt(1, pageIndex);
            pstmt.setInt(2, pageLength);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                User user = new User(
                        rs.getString("user.id"),
                        rs.getString("name")
                        );
                userList.add(user);
            }
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getLastSendMessageUserListMnEx(ArrayList<User> userList, Connection conn, int pageIndex, int pageLength) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select user.id,name from (select table2.date,message.userid from (select * from mypage where mypage.invalid != 1)as table2 left join message on messagenumber=floornumber and table2.id=message.pageid order by table2.date desc)as table1 left join user on table1.userid=user.id order by table1.date desc limit ?,?");
            pstmt.setInt(1, pageIndex);
            pstmt.setInt(2, pageLength);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                User user = new User(
                        rs.getString("user.id"),
                        rs.getString("name")
                        );
                userList.add(user);
            }
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getUserListAdminMN(ArrayList<User> userList, Connection conn, int pageIndex, int pageLength) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select * from user order by id desc limit ?,?");
            pstmt.setInt(1, pageIndex);
            pstmt.setInt(2, pageLength);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                User user = new User(
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("password"),
                        rs.getString("birthday"),
                        rs.getString("sex"),
                        rs.getString("date"),
                        rs.getString("invalid")
                        );
                userList.add(user);
            }
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
    }
    public static boolean getUserCountAdmin(int[] count, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from user");
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
    public static boolean setUserInvalid(String id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update user set invalid=1 where id=?");
            pstmt.setString(1, id);
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
    public static boolean setUserValid(String id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update user set invalid=0 where id=?");
            pstmt.setString(1, id);
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
    public static boolean deleteUser(String id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("delete from user where id = ?");
            pstmt.setString(1, id);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            Database.closePreparedStatement(pstmt);
        } 
        return false;
    }
}
