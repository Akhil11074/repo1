<!-- Code Start for (This page will not be open without Login) -->
    <% 
    	UserDetails user2=(UserDetails)session.getAttribute("userD");
    	if(user2==null)
    	{
    		response.sendRedirect("login.jsp");
    		session.setAttribute("login-error", " Please Login...!!!");
    	}
    %>
<!-- Code Start for (This page will not be open without Login) -->



<%@ include file="all_component/allcss.jsp" %>

<%@ include file="all_component/navbar.jsp" %>

	<div class="container-fluid p-0">
		<div class="card py-5">
			<div class="card-body text-center">
				<img src="img/edit.png" class="img-fluid mx-auto" style="max-width:300px;">
				<h1>Start Your Notes</h1>
				<a href="addNotes.jsp"class="btn btn-outline-primary">Start Here</a>
			</div>
		</div>
	</div>
	
<%@ include file="all_component/footer.jsp" %>