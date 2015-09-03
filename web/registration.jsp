<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("inputUsername");
    String pwd = request.getParameter("inputPassword");
	String pwdAgain = request.getParameter("inputPasswordAgain");
	
	if (pwd != pwdAgain){
		response.sendRedirect("index.jsp");
	}
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ToDoList", "root", "rootPassword");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into users values (NULL, '" + user + "','" + pwd + "');");
    if (i > 0) {
        response.sendRedirect("login.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
