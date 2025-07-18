<%@page import="com.User.Post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Code Start for (This page will not be open without Login) -->
	    <% 
	    	UserDetails user1=(UserDetails)session.getAttribute("userD");
	    	if(user1==null)
	    	{
	    		response.sendRedirect("login.jsp");
	    		session.setAttribute("login-error", " Please Login First...!!!");
	    	}
	    %>
    <!-- Code End for (This page will not be open without Login) -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Notes</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
	<!-- Start Code For (To get a particular id to edit the note) -->
		<%
			Integer noteid=Integer.parseInt(request.getParameter("note_id"));
    		
    		
    		PostDAO post=new PostDAO(DBConnect.getConn());
    		Post p=post.getDataById(noteid);
		%>
	<!-- Start Code For (To get a particular id to edit the note) -->
	
	
	<div class="container-fluid">
		<%@ include file="all_component/navbar.jsp" %>
		<h1 class="text-center mt-5">Edit Your Notes</h1>
		<div class="container mb-5">
			<div class="row">
				<div class="col-md-12">
					<form action="EditNotesServlet" method="post">
						  <div class="form-group">
						    <input type="hidden" value="<%= noteid %>" name="noteid" class="form-control">
						  </div>
						  
						  <div class="form-group">
						    <label for="">Enter Title</label>
						    <input type="text" class="form-control" id="" aria-describedby="" name="title" value="<%= p.getTitle() %>">
						  </div>
						  
						  <div class="form-group">
						    <label for="">Enter Message</label>
						    <textarea rows="9" cols="" class="form-control" name="content"><%= p.getContent() %></textarea>
						  </div>					 
						  <button type="submit" class="btn btn-primary">Update Note</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp" %>
</body>
</html>