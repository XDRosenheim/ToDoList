<%-- 
    Document   : login
    Created on : 03-09-2015, 12:20:56
    Author     : HVF-E308
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% //Go to index if logged in.
	if (session.getAttribute("LoggedIn") != null) {
			response.sendRedirect("index.jsp");
	}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap.css" />
        <title>ToDoList</title>
    </head>
    <body>
		<div class="container">
			<form class="form-signin">
				<h2 class="form-signin-heading">Please sign in</h2>
				<label for="inputEmail" class="sr-only">Username</label>
				<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
				<br />
				<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
			</form>
		</div>
    </body>
</html>
