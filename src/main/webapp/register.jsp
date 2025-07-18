<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid div-color" style="">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 mb-5">
					<div class="card-header text-center text-white bg-custom">
						<h1>Register</h1>
					</div>
					
					
					<%
						String regMsg=(String)session.getAttribute("reg-sucess");
						if(regMsg!=null)
						{%>
							<div class="alert alert-success" role="alert">
								<%= regMsg %> <a href="login.jsp">Login</a>
							</div>
						<%
							session.removeAttribute("reg-sucess");
						}
					%>
					
					
						<%
							String failedMsg=(String)session.getAttribute("failed-msg");
							if(failedMsg!=null)
							{%>
								<div class="alert alert-danger" role="alert">
									<%= failedMsg %>
								</div>
							<%
								session.removeAttribute("failed-msg");
							}
						%>
						
					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="mb-3">
								<label for="" class="form-label">User Name</label> <input
									type="text" class="form-control" id="" aria-describedby=""
									name="fname">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="uemail">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="upassword">
							</div>

							<button type="submit" class="btn btn-primary">SignUp</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>