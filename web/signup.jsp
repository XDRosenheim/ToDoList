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
			<form method="post" action="registration.jsp">
				<table>
					<tr>
						<th colspan="2">Enter Information Here</th>
					</tr>
                                        <input name="username" type="text" id="inputUsername" class="form-control" placeholder="Username" required="" autofocus="" pattern="[A-Za-z]{3}" >
					<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
					<input name="passwordAgain"type="password" id="inputPasswordAgain" class="form-control" placeholder="Confirm Password" required="">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
					<a href="login.jsp">Login Here</a>
				</table>
                            
			</form>
		</div>
    </body>
</html>
