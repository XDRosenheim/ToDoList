<%@ page import="java.sql.*" %>
<%@ page import="dk.ToDoList.*" %>

<%
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
	String pwdAgain = request.getParameter("passwordAgain");

	if (!pwd.toString().equals(pwdAgain)){
		out.println("Passwords are not the same."); 
	}
	else {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ToDoList", "root", DatabaseString.password);
		Statement st = con.createStatement();

		ResultSet rs;
		rs = st.executeQuery("select * from users where username='" + user + "'");
		
		if (rs.getArray("username").toString().equals(user)){
			
		}

		int i = st.executeUpdate("insert into users values (NULL, '" + user + "','" + pwd + "');");
		if (i > 0) {
		    response.sendRedirect("login.jsp");
		} else {
			System.out.println("Error.... Unknown");
		}
		con.close();
	}
%>
