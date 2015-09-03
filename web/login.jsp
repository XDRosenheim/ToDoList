<%-- 
    Document   : login
    Created on : 03-09-2015, 12:20:56
    Author     : HVF-E308
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("LoggedIn") != null) {
			response.sendRedirect("/index.jsp");
	}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
