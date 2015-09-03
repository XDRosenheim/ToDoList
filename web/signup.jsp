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
        <title>ToDoList</title>
    </head>
    <body style="background-color: lightgray">
        <div class="container">
			<form class="form-signin">
				<h2 class="form-signin-heading">Register</h2>
				<label for="inputEmail" class="sr-only" id="txtUsername">Username</label>
				<input type="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
				<label for="inputPassword" class="sr-only" id="txtPassword">Password</label>
				<label for="inputPassword" class="sr-only" id="txtPasswordAgain">Confirm password</label>
				<input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
				<br />
				<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
			</form>
		</div>
    </body>
</html>
