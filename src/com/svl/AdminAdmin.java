package com.svl;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.obj.Admin;
import com.obj.EachPage;

/**
 * Servlet implementation class AdminAdmin
 */
@WebServlet("/AdminAdmin")
public class AdminAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = (Connection)request.getSession().getAttribute("conn");
		if("invalid".equalsIgnoreCase(request.getParameter("method"))) {
			Admin.setAdminInvalid(request.getParameter("id"), conn);
		} else if("valid".equalsIgnoreCase(request.getParameter("method"))) {
			Admin.setAdminValid(request.getParameter("id"), conn);
		} else if("delete".equalsIgnoreCase(request.getParameter("method"))){
			Admin.deleteAdmin(request.getParameter("id"), conn);
		}
		
		Properties profile = (Properties)request.getServletContext().getAttribute("profile");
		int pageLength;
		int[] count = {0};
		int listLength =  Integer.parseInt(profile.getProperty("page_listlength"));
		int pageNumber;
		Admin.getAdminCountAdmin(count, conn);
		try {
			pageLength = Integer.parseInt(request.getParameter("pageLength"));
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			pageLength = Integer.parseInt(profile.getProperty("page_length"));
			pageNumber = Integer.parseInt(profile.getProperty("page_number"));
		}
		EachPage eachPage = new EachPage(pageLength,count[0],listLength,pageNumber);
		int howManyPage = eachPage.getHowManyPage();
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("howManyPage", howManyPage);
		
		ArrayList<EachPage> eachPageList = eachPage.getEachPageList();
		request.setAttribute("eachPageList", eachPageList);
		
		//change information of admin
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("admin");
		if(admin != null && admin.getPassword().equals(request.getParameter("oldPassword")) && admin.getId().equals(request.getParameter("id")) && "1".equals(request.getParameter("submit"))) {
			admin.setName(request.getParameter("name"));
			admin.setPassword(request.getParameter("password"));
			if(Admin.updateAdmin(admin, conn)) {
				admin.setPassword("696d29e0940a4957748fe3fc9efd22a3".equalsIgnoreCase(request.getParameter("password")) ? request.getParameter("oldPassword") :request.getParameter("password"));
				session.setAttribute("admin", admin);
			}
		}
		//add admin
		if(admin != null && admin.getId().equals(request.getParameter("id")) && "1".equals(request.getParameter("add"))) {
			Admin newAdmin = new Admin(request.getParameter("addName"), request.getParameter("addPassword"), "");
			Admin.insertAdmin(newAdmin, conn);
		}
		
		ArrayList<Admin> adminList = new ArrayList<Admin>();
		if(Admin.getAdminListAdminMN(adminList, conn, eachPage.getPageIndex(), pageLength))
			request.setAttribute("adminList", adminList);
		request.getRequestDispatcher("admin/admin_admin.jsp").forward(request, response);
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
