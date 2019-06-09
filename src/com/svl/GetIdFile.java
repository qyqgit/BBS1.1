package com.svl;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetIdFile
 */
@WebServlet("/GetIdFile")
public class GetIdFile extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetIdFile() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String id = request.getParameter("id");
        response.setContentType(getServletContext().getMimeType("*.txt"));
        response.setHeader("Content-Disposition", "attachment;filename=FISHCC.ORG_" + id + ".txt");
        InputStream in = new ByteArrayInputStream(("Congratulations,Your fishcc ID is:" + id + "\r\n").getBytes());
        OutputStream out = response.getOutputStream();
        int len = 0;
        byte[] buffer = new byte[128];
        while((len = in.read(buffer)) > 0) {
            out.write(buffer, 0, len);
        }
        in.close();
        //response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
