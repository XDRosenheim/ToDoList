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
        <title>ToDoList</title>
    </head>
    <body style="background-color: lightgray">
        <div class="container">
			<form class="form-signin">
				<h2 class="form-signin-heading">Register</h2>
				<label for="inputEmail" class="sr-only" id="txtUsername">Username</label>
				<input type="email" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
				<label for="inputPasswordAgain" class="sr-only">Confirm password</label>
				<input type="password" id="inputPasswordAgain" class="form-control" placeholder="Confirm Password" required="">
				<br />
				<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
			</form>
		</div>
    </body>
</html>
