<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>Connection with mysql database</title>
</head>
<body>
<h1>Connection status</h1>
<%
try {
    String connectionURL = "jdbc:mysql://localhost/ToDoList";
	Connection connection = DriverManager.getConnection(connectionURL, "root", "rootPassword");
    if(!connection.isClosed())
        connection.close();
    }catch(Exception ex){
        out.println("Unable to connect "+ex);
    }
%>
</body>
</html>
