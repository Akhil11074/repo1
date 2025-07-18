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
<title>Add Notes</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<%@ include file="all_component/navbar.jsp" %>
		<h1 class="text-center mt-5">Add Your Notes</h1>
		<div class="container mb-5">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
					  <div class="form-group">
					  	<%
					  		UserDetails us=(UserDetails)session.getAttribute("userD");
					  		if(us!=null){%>
					  			
					  			<input type="hidden" value="<%=us.getId()%>" name="uid">
					  	<%}
					  	
					  	%>
					  
					    <label for="">Enter Title</label>
					    <input type="text" class="form-control" id="" aria-describedby="" name="title">
					  </div>
					  
					  <div class="form-group">
					    <label for="">Enter Message</label>
					    <textarea rows="9" cols="" class="form-control" id="" aria-describedby="" name="content"></textarea>
					  </div>
					 
					  <button type="submit" class="btn btn-primary">Add Note</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp" %>
</body>
</html>