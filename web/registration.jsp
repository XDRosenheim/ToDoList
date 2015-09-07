<%@ page import="java.sql.*" %>
<%@ page import="dk.ToDoList.*" %>

<%
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
	String pwdAgain = request.getParameter("passwordAgain");
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
			DatabaseString.Driver + ":" + 
				DatabaseString.Protocol + ":" + 
				DatabaseString.serverURL, 
			DatabaseString.username, 
			DatabaseString.password);
		Statement st = con.createStatement();

		ResultSet rs;
		rs = st.executeQuery("select * from users where username='" + user + "'");
	
		if (rs.next()){ // Does the user already exsist in the database?
			session.setAttribute("UserExists", "That username is already in use.");
			response.sendRedirect("signup.jsp");
		}
		else if (!pwd.toString().equals(pwdAgain)){ // Are the passwords the same?
			session.setAttribute("PassStupid", "Passwords are not the same.");
			response.sendRedirect("signup.jsp");
		}
		else { // If all is good, make user and go to login.
			int i = st.executeUpdate("insert into users values (NULL, '" + user + "','" + pwd + "');");
			if (i > 0) {
				response.sendRedirect("login.jsp");
			} else {
				System.out.println("Error.... Unknown....");
				out.println("<a href=\"signup.jsp\">Try again?</a>");
			}
		}
		con.close();
	} catch (SQLException e) {
		out.println("SQL Error: " + e);
	} catch (Exception e){
		out.println("Error: " + e);
	}
%>
