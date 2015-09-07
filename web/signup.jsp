<%-- 
    Document   : signup
    Created on : 03-09-2015, 12:53:17
    Author     : HVF-E308
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/style.css" />
        <title>ToDoList</title>
    </head>
    <body style="background-color: lightgray">
        <div class="container">
			<form method="post" action="registration.jsp" class="form-signin">
				<h2 class="form-signin-heading">New account.</h2>
				<input name="username" type="text" id="inputUsername" class="form-control form-signin-first" placeholder="Username" required="" autofocus="">
				<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
				<input name="passwordAgain" type="password" id="inputPasswordAgain" class="form-control form-signin-last" placeholder="Confirm Password" required="">
				<%
					if(session.getAttribute("UserExists") != null){
						out.println("<p>" + session.getAttribute("UserExists").toString() + "</p>");
						session.setAttribute("UserExists", null);
						
					}
					else if (session.getAttribute("PassStupid") != null){
						out.println("<p>" + session.getAttribute("PassStupid").toString() + "</p>");
						session.setAttribute("PassStupid", null);
					}
					else {
						out.println("<br />");
					}
				%>
				<button class="btn btn-lg btn-primary btn-block form-sigin-button" type="submit">Sign up</button>
				<a href="login.jsp">Already have an account?</a>
		</div>
    </body>
</html>
