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
    private String invalid;
    

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

    public String getInvalid() {
        return invalid;
    }

    public void setInvalid(String invalid) {
        this.invalid = invalid;
    }

    public Message(String id, String date, User user, String text, MyPage myPage, String floorNumber, String invalid) {
        super();
        this.id = id;
        this.date = date;
        this.user = user;
        this.text = text;
        this.myPage = myPage;
        this.floorNumber = floorNumber;
        this.invalid = invalid;
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
    
    public Message(String messageId) {
        super();
        this.id = messageId;
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
            pstmt.close();
            
            pstmt = conn.prepareStatement("insert into message(replyId,userid,text,pageId,floorNumber,haveRead) values (?,?,?,?,?,?)");
            pstmt.setString(1, message.getReplyId());
            pstmt.setString(2, message.getUser().getId());
            pstmt.setString(3, message.getText());
            pstmt.setString(4, message.getMyPage().getId());
            pstmt.setString(5, Integer.parseInt(messageNumber) + 1 + "");
            pstmt.setString(6, message.getRead());
            pstmt.executeUpdate();
            pstmt.close();
            
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
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
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
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
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
            pstmt.close();

            pstmt = conn.prepareStatement("update message inner join (select message.id from (select mypage.id from mypage where userid = ? )as table1,message where pageid = table1.id and userid != ? and haveread != 1  union select message.id from (select id from message where userid = ? )as table1,message where replyid = table1.id and haveread != 1 )as table2 on message.id = table2.id set message.haveread = 1;");
            pstmt.setString(1, userId);
            pstmt.setString(2, userId);
            pstmt.setString(3, userId);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        } 
        return false;
    }
    public static boolean getReplyListEx(String userId, ArrayList<Message> replyList, Connection conn) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select table3.id,table3.date,table3.userid,table3.text,table3.pageid,table3.floornumber,table3.name,mypage.title from(select table2.id,from_unixtime(unix_timestamp(table2.date),'%Y-%m-%d %H:%i') as date,table2.userid,table2.text,table2.pageid,table2.floornumber,user.name from (select message.id,message.date,message.userid,message.text,message.pageid,message.floornumber from (select mypage.id from mypage where userid = ?)as table1,message where pageid=table1.id and userid != ? and message.invalid !=1 union select message.id,message.date,message.userid,message.text,message.pageid,message.floornumber from (select id from message where userid = ? )as table1,message where replyid = table1.id and message.invalid !=1 order by date desc) as table2,user where table2.userid = user.id)as table3,mypage where table3.pageid = mypage.id;");
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
            pstmt.close();

            pstmt = conn.prepareStatement("update message inner join (select message.id from (select mypage.id from mypage where userid = ? )as table1,message where pageid = table1.id and userid != ? and haveread != 1 and message.invalid !=1 union select message.id from (select id from message where userid = ? )as table1,message where replyid = table1.id and haveread != 1 and message.invalid !=1 )as table2 on message.id = table2.id set message.haveread = 1;");
            pstmt.setString(1, userId);
            pstmt.setString(2, userId);
            pstmt.setString(3, userId);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
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
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        } 
        return false;
    }
    public static boolean getMessageListAdminMN(ArrayList<Message> messageList, Connection conn, int pageIndex, int pageLength) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select message.id,userId,text,name,pageid,from_unixtime(unix_timestamp(message.date),'%Y-%m-%d %H:%i') as date,floorNumber,message.invalid from message,user where message.userId = user.id order by message.id desc limit ?,?");
            pstmt.setInt(1, pageIndex);
            pstmt.setInt(2, pageLength);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Message message = new Message(
                        rs.getString("id"),
                        rs.getString("date"),
                        new User(rs.getString("userId"),rs.getString("name")),
                        rs.getString("text"),
                        new MyPage(rs.getString("pageId")),
                        rs.getString("floorNumber"),
                        rs.getString("invalid")
                        );
                messageList.add(message);
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
    public static boolean getMessageListMnEx(ArrayList<Message> messageList, Connection conn, int pageIndex, int pageLength) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select message.id,userId,text,name,pageid,from_unixtime(unix_timestamp(message.date),'%Y-%m-%d %H:%i') as date,floorNumber from message,user where pageid = ? and message.userId = user.id and message.invalid != 1 order by floornumber limit ?,?");
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
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        } 
        return false;
    }
    public static boolean getMessage(Message message, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select message.id,replyId,from_unixtime(unix_timestamp(message.date),'%Y-%m-%d %H:%i') as date,userId,name,text,pageId,floorNumber,haveRead from message,user where message.id = ? and message.userId = user.id");
            pstmt.setString(1, message.getId());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                message.setId(rs.getString("id"));
                message.setReplyId(rs.getString("replyId"));
                message.setDate(rs.getString("date"));
                message.setUser(new User(rs.getString("userId"),rs.getString("name")));
                message.setText(rs.getString("text"));
                message.setMyPage(new MyPage(rs.getString("pageId")));
                message.setFloorNumber(rs.getString("floorNumber"));
                message.setRead(rs.getString("haveRead"));
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
    public static boolean getMessageCount(int[] count,String pageId, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from message where pageId = ?");
            pstmt.setString(1, pageId);
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
    public static boolean getMessageCountEx(int[] count,String pageId, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from message where pageId = ? and invalid !=1");
            pstmt.setString(1, pageId);
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
    public static boolean getMessageCountAdmin(int[] count, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from message");
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
    public static boolean getReplyCount(int[] count, User user, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from (select message.id,haveread from (select mypage.id from mypage where userid = ?)as table1,message where pageid=table1.id and userid != ? union select message.id,haveread from (select id from message where userid = ?)as table1,message where replyid = table1.id) as table2 where haveread = 0 ;");
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getId());
            pstmt.setString(3, user.getId());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count[0] = Integer.parseInt(rs.getString("count(id)"));
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
    public static boolean getReplyCountEx(int[] count, User user, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from (select message.id,haveread from (select mypage.id from mypage where userid = ?)as table1,message where pageid=table1.id and userid != ? and message.invalid !=1 union select message.id,haveread from (select id from message where userid = ?)as table1,message where replyid = table1.id and message.invalid !=1) as table2 where haveread = 0 ;");
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getId());
            pstmt.setString(3, user.getId());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                count[0] = Integer.parseInt(rs.getString("count(id)"));
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
    public static boolean setMessageInvalid(String id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update message set invalid=1 where id=?");
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
    public static boolean setMessageValid(String id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update message set invalid=0 where id=?");
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
    public static boolean deleteMessage(String Id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("delete from message where id = ?");
            pstmt.setString(1, Id);
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
