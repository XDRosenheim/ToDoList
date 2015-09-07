<%-- 
    Document   : login
    Created on : 03-09-2015, 12:20:56
    Author     : HVF-E308
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% // Go to index if already logged in.
    if (session.getAttribute("LoggedIn") != null) {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="css/bootstrap.min.css" />
            <link rel="stylesheet" href="css/bootstrap.css" />
            <link rel="stylesheet" href="css/style.css" />
        <title>ToDoList</title>
        <script>
            function keyispressed(e){
                var charval= String.fromCharCode(e.keyCode);
                if(isNaN(charval)){
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body style="background-color: lightgray" >
        <div class="container">
            <form class="form-signin" method="post" action="loggingin.jsp">
                <h2 class="form-signin-heading">Please sign in</h2>
                <label for="inputEmail" class="sr-only">Username</label>

                <input name="username" type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus="">

                <label for="inputPassword" class="sr-only">Password</label>
                <input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                <%
                    if(session.getAttribute("WrongUserPass") != null){
                        out.println("<p>" + session.getAttribute("WrongUserPass").toString() + "</p>");
                        session.setAttribute("WrongUserPass", null);
                    }
                    else {
                        out.println("<br />");
                    }
                %>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
                <a href="signup.jsp">Don't have an account?</a>
            </form>
        </div>
    </body>
</html>
