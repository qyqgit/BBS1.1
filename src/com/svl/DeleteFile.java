package com.svl;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.obj.Media;
import com.obj.User;

/**
 * Servlet implementation class DeleteFile
 */
@WebServlet("/DeleteFile")
public class DeleteFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mediaId = request.getParameter("id");
		Connection conn = (Connection) request.getSession().getAttribute("conn");
		Media media = new Media(mediaId);
		Media.getMedia(media, conn);
		User user = (User)request.getSession().getAttribute("user");
		if(!user.getId().equals(media.getUser().getId())) {
			response.sendRedirect("Home?id=" + media.getUser().getId());
			return;
		}
		Properties profile = (Properties)getServletContext().getAttribute("profile");
        String realPath = getServletContext().getRealPath("/");
        File tempFile = new File(realPath);
        realPath = tempFile.getParent() + "\\" + profile.getProperty("media_path") + "\\" + user.getId() + "\\" + media.getUrl().substring(media.getUrl().lastIndexOf("/") + 1);
        //创建文件对象
        File dir = new File(realPath);
        if(dir.exists()) {
        	if(dir.delete())
        		Media.deleteMedia(mediaId, conn);
        }
		response.sendRedirect("Home?id=" + user.getId());
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
