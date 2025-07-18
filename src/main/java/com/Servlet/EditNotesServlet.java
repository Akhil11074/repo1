package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("noteid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		PostDAO dao=new PostDAO(DBConnect.getConn());
		boolean f=dao.UpdateNotes(uid, title,content);
		
		if(f)
		{
			System.out.println("Data Updated");
			response.sendRedirect("showNotes.jsp");
		}
		else {
			System.out.println("Data Not Updated");
		}
	}

}
