package com.obj;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Media {
    private String id;
    private User user;
    private String name;
    private String url;
    private String type;
    private String date;
    private String invalid;
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
    public String getInvalid() {
        return invalid;
    }
    public void setInvalid(String invalid) {
        this.invalid = invalid;
    }
    public Media(String id, User user, String name, String url, String type, String date, String invalid) {
        super();
        this.id = id;
        this.user = user;
        this.name = name;
        this.url = url;
        this.type = type;
        this.date = date;
        this.invalid = invalid;
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
    public static boolean getMediaListMN(String userId, ArrayList<Media> mediaList, Connection conn, int pageIndex, int pageLength) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select id,userId,name,url,type,from_unixtime(unix_timestamp(date),'%Y-%m-%d %H:%i') as date from media where userId = ? limit ?,?");
            pstmt.setString(1, userId);
            pstmt.setInt(1, pageIndex);
            pstmt.setInt(2, pageLength);
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
    public static boolean getMediaListAdminMN(ArrayList<Media> mediaList, Connection conn, int pageIndex, int pageLength) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select media.id,userId,media.name,url,type,from_unixtime(unix_timestamp(media.date),'%Y-%m-%d %H:%i') as date,media.invalid,user.name from media,user where userId=user.id limit ?,?");
            pstmt.setInt(1, pageIndex);
            pstmt.setInt(2, pageLength);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Media media = new Media(
                        rs.getString("id"),
                        new User(rs.getString("userId"), rs.getString("user.name")),
                        rs.getString("name"),
                        rs.getString("url"),
                        rs.getString("type"),
                        rs.getString("date"),
                        rs.getString("invalid")
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
    public static boolean getMediaListMnEx(String userId, ArrayList<Media> mediaList, Connection conn, int pageIndex, int pageLength) {
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select id,userId,name,url,type,from_unixtime(unix_timestamp(date),'%Y-%m-%d %H:%i') as date from media where userId = ? and media.invalid !=1 limit ?,?");
            pstmt.setString(1, userId);
            pstmt.setInt(2, pageIndex);
            pstmt.setInt(3, pageLength);
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
    public static boolean getMediaCount(int[] count,String userId, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from media where userId = ?");
            pstmt.setString(1, userId);
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
    public static boolean getMediaCountEx(int[] count,String userId, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from media where userId = ? and invalid !=1");
            pstmt.setString(1, userId);
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
    public static boolean getMediaCountAdmin(int[] count, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("select count(id) from media");
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
    public static boolean setMediaInvalid(String id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update media set invalid=1 where id=?");
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
    public static boolean setMediaValid(String id, Connection conn) {
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("update media set invalid=0 where id=?");
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
	public static boolean uploadMedia(HttpServletRequest request, Properties profile) throws IOException {	
		User user = (User)request.getSession().getAttribute("user");
        Media media = new Media(user);
        int fileSizeMax = Integer.parseInt(profile.getProperty("file_size_max"));
        int uploadSizeMax = Integer.parseInt(profile.getProperty("upload_size_max"));
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setFileSizeMax(fileSizeMax * 1024 * 1024);//50M
        upload.setSizeMax(uploadSizeMax * 1024 * 1024); //100M
        if (ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> list = upload.parseRequest(request);
                for (FileItem item : list){
                    if (item.isFormField()){
                        String fieldName = item.getFieldName();
                        String value = item.getString("UTF-8");
                        System.out.println(fieldName + " : " + value);

                    }else {
                        String fileName = item.getName();
                        String[] splitName = fileName.split("\\\\");
                        fileName = splitName[splitName.length-1];
                        String id = UUID.randomUUID().toString();
                        fileName = fileName.substring(0,fileName.lastIndexOf(".")) + "_" + id + fileName.substring(fileName.lastIndexOf("."));
                        String realPath = request.getServletContext().getRealPath("/");
                        File tempFile = new File(realPath);
                        if(!SysTool.isLinux())
                            realPath =  tempFile.getParent() + "\\" + profile.getProperty("media_path_win") + "\\" + user.getId() + "\\";
                        else
                            realPath = tempFile.getParent() + "/" + profile.getProperty("media_path_linux") + "/" + user.getId() + "/";
                        File dir = new File(realPath);
                        if(!dir.exists()) dir.mkdirs();
                        File file = new File(realPath, fileName);
                        item.write(file);
                        item.delete();

                        String mediaPath = null;
                        if(!SysTool.isLinux())
                            mediaPath = profile.getProperty("media_path_win");
                        else
                            mediaPath = profile.getProperty("media_path_linux");
                        if(mediaPath.startsWith("ROOT"))
                            mediaPath = mediaPath.substring(5);
                        String url = profile.getProperty("host_url");
                        if(!SysTool.isLinux())
                            url = url + "/" + mediaPath.replace("\\", "/");
                        else
                            url = url + "/" + mediaPath;
                        media.setName(splitName[splitName.length-1]);
                        media.setUrl(url + "/" + user.getId() + "/" + fileName);
                        media.setType("0");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            HttpSession session = request.getSession();
            Connection conn = (Connection)session.getAttribute("conn");
            Media.insertMedia(media, conn);
        }else {
            System.out.println("do nothing!");
            return false;
        }
        return true;
	}
	public static boolean deleteMediaFile(String realPath, Media media, Connection conn, Properties profile) {
        File tempFile = new File(realPath);
        if(!SysTool.isLinux())
            realPath = tempFile.getParent() + "\\" + profile.getProperty("media_path_win") + "\\" + media.getUser().getId() + "\\" + media.getUrl().substring(media.getUrl().lastIndexOf("/") + 1);
        else
            realPath = tempFile.getParent() + "/" + profile.getProperty("media_path_linux") + "/" + media.getUser().getId() + "/" + media.getUrl().substring(media.getUrl().lastIndexOf("/") + 1);
        File dir = new File(realPath);
        if(dir.exists()) {
            if(dir.delete()) {
                Media.deleteMedia(media.getId(), conn);
                return true;
            }
            return false;
        }
		return false;
	}
}
