<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>LOGIN PAGE</title>
    
    <%@ include file="all_component/allcss.jsp" %>
  </head>
  <body>
    <%@ include file="all_component/navbar.jsp" %>
				<div class="container-fluid div-color" style="">
					<div class="row">
						<div class="col-md-4 offset-md-4">
							<div class="card mt-5 mb-5" >
								<div class="card-header text-center text-white bg-custom">
									<h1>Login Page</h1>
								</div>
								
							<!-- Code Start (For Login Error Message Display Using Session) -->	
								
								<%
									String invalidMsg=(String)session.getAttribute("login-failed");
									if(invalidMsg!=null)
									{%>
										<div class="alert alert-danger" role="alert">
											<%= invalidMsg %>
										</div>
									<%
										session.removeAttribute("login-failed");
									}
								%>
								
							<!-- Code End (For Login Error Message Display Using Session) -->		
								
								
							
							<!-- Code Start (For Unauthorized Access Alert) Shows an alert if user tried to access some page without logging in. -->		
								<%
									String withoutLogin=(String)session.getAttribute("login-error");
									if(withoutLogin!=null)
									{%>
										<div class="alert alert-danger" role="alert">
											<%= withoutLogin %>
										</div>
									<%
										session.removeAttribute("login-error");
									}
								%>
							<!-- Code End (For Unauthorized Access Alert) Shows an alert if user tried to access some page without logging in.  -->		
								
								
								
								
								
								<!-- For Session Logout Code Start -->
									<%
										String lgMsg=(String)session.getAttribute("logoutMsg");
										if(lgMsg!=null)
										{%>
											<div class="alert alert-success" role="alert">
												<%= lgMsg %>
											</div>
										<%
											session.removeAttribute("logoutMsg");
										}
									%>
								<!-- For Session Logout Code End -->
								
	
							  <div class="card-body">
							    <form action="LoginServlet" method="post">
						
								  <div class="mb-3">
								    <label for="exampleInputEmail1" class="form-label">Email address</label>
								    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail">
								  </div>
								  <div class="mb-3">
								    <label for="exampleInputPassword1" class="form-label">Password</label>
								    <input type="password" class="form-control" id="exampleInputPassword1" name="upassword">
								  </div>
								  
								  <button type="submit" class="btn btn-primary">Sign-In</button>
								</form>		
							  </div>
							</div>
										
						</div>
					</div>
				</div>
	<%@ include file="all_component/footer.jsp" %>
	
  </body>
</html>