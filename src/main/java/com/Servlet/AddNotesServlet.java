package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DAO.PostDAO;
import com.Db.DBConnect;
import com.User.Post;
import com.User.UserDetails;


@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		PostDAO dao=new PostDAO(DBConnect.getConn());
		boolean f=dao.AddNotes(title, content, uid);
		
		if(f)
		{
			System.out.println("Data Inserted");
			response.sendRedirect("showNotes.jsp");
		}
		else {
			System.out.println("Data Not Inserted");
		}
	}

}
