package com.svl;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.obj.Media;
import com.obj.SysTool;
import com.obj.User;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        User user = (User)request.getSession().getAttribute("user");
        HttpServletResponse res = (HttpServletResponse)response;
        if(user == null) {
            res.sendRedirect("Login.jsp");
            return;
        };
        Properties profile = (Properties)getServletContext().getAttribute("profile");
        int fileSizeMax = Integer.parseInt(profile.getProperty("file_size_max"));
        int uploadSizeMax = Integer.parseInt(profile.getProperty("upload_size_max"));
        //1.�����ļ��ϴ�������
        DiskFileItemFactory fac = new DiskFileItemFactory();
        //2.�����ļ��ϴ����������
        ServletFileUpload upload = new ServletFileUpload(fac);
        //��һ�����õ����ļ����50M��
        upload.setFileSizeMax(fileSizeMax*1024*1024);//50M
        //�������������ļ���С��100M��
        upload.setSizeMax(uploadSizeMax*1024*1024); //100M

        //�жϣ���ǰ���Ƿ�Ϊ�ļ��ϴ���
        if (ServletFileUpload.isMultipartContent(request)){

            try {
                //3.����������ת��ΪFileItem����ļ���
                List<FileItem> list = upload.parseRequest(request);
                //�������õ�ÿһ���ϴ���
                for (FileItem item : list){
                    //�жϣ�����ͨ��������ļ��ϴ�����
                    if (item.isFormField()){
                        //��ͨ��x
                        String fieldName = item.getFieldName();//��ȡԪ������
                        String value = item.getString("UTF-8"); //��ȡԪ��ֵ
                        System.out.println(fieldName+" : "+value);

                    }else {
                        //�ļ��ϴ���
                        String fileName = item.getName(); //�ϴ����ļ�����
                        String[] a = fileName.split("\\\\");
                        fileName = a[a.length-1];
                        /**
                         * ���ġ��ļ�������
                         * ���ڲ�ͬ���û���test.txt�ļ�����ϣ�����ǣ�
                         * ��̨�������û����һ��Ψһ��ǣ�
                         */
                        //a.�������һ��Ψһ���
                        String id = UUID.randomUUID().toString();
                        //���ļ���ƴ��
                        fileName = id +"_"+ fileName;
                        //�������ϴ���ָ��Ŀ¼����ȡ�ϴ�Ŀ¼·����
                        String realPath = getServletContext().getRealPath("/");
                        File tempFile = new File(realPath);
                        if(!SysTool.isLinux())
                            realPath =  tempFile.getParent() + "\\" + profile.getProperty("media_path_win") + "\\" + user.getId() + "\\";
                        else
                            realPath = tempFile.getParent() + "/" + profile.getProperty("media_path_linux") + "/" + user.getId() + "/";
                        //�����ļ�����
                        File dir = new File(realPath);
                        if(!dir.exists()) dir.mkdirs();
                        File file = new File(realPath, fileName);
                        item.write(file);
                        item.delete();
                        
                        String url = profile.getProperty("host_url");
                        String mediaPath = null;
                        if(!SysTool.isLinux())
                            mediaPath = profile.getProperty("media_path_win");
                        else
                            mediaPath = profile.getProperty("media_path_linux");
                        if(mediaPath.startsWith("ROOT"))
                            mediaPath = mediaPath.substring(5);
                        if(!SysTool.isLinux())
                            url = url + "/" + mediaPath.replace("\\", "/");
                        else
                            url = url + "/" + mediaPath;
                        Media media = new Media(user, a[a.length-1], url + "/" + user.getId() + "/" + fileName,"0");
                        HttpSession session = request.getSession();
                        Connection conn = (Connection)session.getAttribute("conn");
                        Media.insertMedia(media, conn);
                    }
                }
                res.sendRedirect("Home?id=" + user.getId());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            System.out.println("������");
        }
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
