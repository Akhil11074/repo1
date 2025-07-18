<%@page import="com.User.UserDetails"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom ">
  <a class="navbar-brand" href="#">E-Notes</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addNotes.jsp">Add Note</a>
      </li>

      <li class="nav-item">
        <a class="nav-link " href="showNotes.jsp">Show Notes</a>
      </li>
    </ul>
   
<!-- Code Start (This Code for show User Name as Profile Name and show logout button if User Logged In) -->
		<%
			UserDetails user = (UserDetails) session.getAttribute("userD");
			if (user != null) {
		%>
		
			<a class="btn bg-light text-dark my-2 my-sm-0 mr-3" data-toggle="modal" data-target="#exampleModal" href=""
				type="submit"><%= user.getName() %></a> 
				
			<a class="btn bg-light text-dark my-2 my-sm-0" href="LogoutServlet"
				type="submit">Logout</a>

<!-- Code End (This Code for show User Name as Profile Name and show logout button if User Logged In) -->



		<!-- Button trigger modal Code Start(This code use to get all Details from UserDetails class) -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container text-center">
							<i class="fas fa-user fa-3x"></i>
							<h5></h5>
							<table class="table">
								<tbody>
									<tr>
										<th>User Id</th>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<th>Full Name</th>
										<td><%=user.getName()%></td>
									</tr>

									<tr>
										<th>Email Id</th>
										<td><%=user.getEmail()%></td>
									</tr>

								</tbody>

							</table>

							<div>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- Button trigger modal Code End(This code use to get all Details from UserDetails class) -->


<!-- Code Start (This code show links only when user not Logged In) -->
		<%
		} else {
		%>
				 <form class="form-inline my-2 my-lg-0">
				      <a class="btn bg-light text-dark my-2 my-sm-0 mr-3" href="login.jsp" type="submit">Login</a>
				      <a class="btn bg-light text-dark my-2 my-sm-0" href="register.jsp" type="submit">Register</a>
				 </form>
		<%}

		%>
<!-- Code End (This code show links only when user not Logged In) -->
  </div>
  
  

  
  
  
  
  
</nav>