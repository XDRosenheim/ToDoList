<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
	String pwdAgain = request.getParameter("passwordAgain");

	if (!pwd.toString().equals(pwdAgain)){
		out.println("Passwords are not the same.");
	}
	else {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ToDoList", "root", "rootPassword");
		Statement st = con.createStatement();
		
		int i = st.executeUpdate("insert into users values (NULL, '" + user + "','" + pwd + "');");
		if (i > 0) {
		    response.sendRedirect("login.jsp");
		} else {
			System.out.println("Error.... Unknown");
		}
		con.close();
	}
%>
