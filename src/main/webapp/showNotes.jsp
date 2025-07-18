<!-- Code Start for (This page will not be open without Login) -->
<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", " Please Login...!!!");
}
%>
<!-- Code End for (This page will not be open without Login) -->

<%@ include file="all_component/allcss.jsp"%>
<%@ include file="all_component/navbar.jsp"%>
<div class="container">
	<h1 class="text-center mt-5">Show All Notes</h1>
	<%
	if (user3 != null) {
		PostDAO ob = new PostDAO(DBConnect.getConn());
		List<Post> post = ob.getData(user3.getId());
		int count = 0;
		for (Post po : post) {
			if (count % 3 == 0) {
	%>
	<div class="row">
		<%
		}
		%>
		<div class="col-md-4 mb-5 ">
			<div class="card mt-3 w-100 h-100">
				<div class="card-body p-4">
					<h5 class="card-title"><%=po.getTitle()%></h5>
					<p><%=po.getContent()%></p>

					<p>
						<b class="text-success">Published By: <%=user3.getName()%></b>
					</p>

					<p>
						<b class="text-success">Published Date: <%=po.getPdate()%></b>
					</p>

					<div>
						<a href="DeleteServlet?note_id=<%=po.getId()%>"
							class="btn btn-danger">Delete</a> <a
							href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>
					</div>
				</div>
			</div>
		</div>
		<%
		count++;
		if (count % 3 == 0 || count == post.size()) {
		%>
	</div>
	<!-- end row -->
	<%
	}
	}
	}
	%>
</div>

<%@ include file="all_component/footer.jsp"%>