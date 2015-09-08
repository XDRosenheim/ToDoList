<%@ page import="java.sql.*" %>
<%@ page import="dk.ToDoList.*" %>

<%
    String text = request.getParameter("ToDoText");
    if (request.getParameter("remind") != null){
        boolean remind = true;
    }
    else {
        boolean remind = false;
    }
    String pwdAgain = request.getParameter("passwordAgain");
%>
