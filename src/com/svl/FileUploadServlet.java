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
		//1.创建文件上传工厂类
        DiskFileItemFactory fac = new DiskFileItemFactory();
        //2.创建文件上传核心类对象
        ServletFileUpload upload = new ServletFileUpload(fac);
        //【一、设置单个文件最大50M】
        upload.setFileSizeMax(50*1024*1024);//50M
        //【二、设置总文件大小：100M】
        upload.setSizeMax(100*1024*1024); //100M

        //判断，当前表单是否为文件上传表单
        if (ServletFileUpload.isMultipartContent(request)){

            try {
                //3.把请求数据转换为FileItem对象的集合
                List<FileItem> list = upload.parseRequest(request);
                //遍历，得到每一个上传项
                for (FileItem item : list){
                    //判断：是普通表单项，还是文件上传表单项
                    if (item.isFormField()){
                        //普通表单x
                        String fieldName = item.getFieldName();//获取元素名称
                        String value = item.getString("UTF-8"); //获取元素值
                        System.out.println(fieldName+" : "+value);

                    }else {
                        //文件上传表单
                        String fileName = item.getName(); //上传的文件名称
                        String[] a = fileName.split("\\\\");
                        fileName = a[a.length-1];
                        /**
                         * 【四、文件重名】
                         * 对于不同的用户的test.txt文件，不希望覆盖，
                         * 后台处理：给用户添加一个唯一标记！
                         */
                        //a.随机生成一个唯一标记
                        String id = UUID.randomUUID().toString();
                        //与文件名拼接
                        fileName = id +"_"+ fileName;
                        //【三、上传到指定目录：获取上传目录路径】
                        String realPath = getServletContext().getRealPath("/upload");
                        realPath =  realPath + "\\user\\" + user.getId() + "\\";
                        //创建文件对象
                        File dir = new File(realPath);
                        if(!dir.exists()) dir.mkdirs();
                        File file = new File(realPath, fileName);
                        item.write(file);
                        item.delete();
                        
                        Properties profile = (Properties)getServletContext().getAttribute("profile");
                        String url = profile.getProperty("url");
                        Media media = new Media(user, a[a.length-1], url + user.getId() + "/" + fileName,"0");
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
            System.out.println("不处理！");
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
