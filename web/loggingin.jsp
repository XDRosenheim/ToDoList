<%@ page import ="java.sql.*" %>
<%@ page import="dk.ToDoList.*" %>

<%
	try {
		String user = request.getParameter("username");    
		String pwd = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				DatabaseString.Driver + ":" + 
					DatabaseString.Protocol + ":" + 
					DatabaseString.serverURL, 
				DatabaseString.username, 
				DatabaseString.password);
		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery("select * from users where username='" + user + "' and passphrase='" + pwd + "'");
		if (rs.next()) {
			session.setAttribute("LoggedIn", user);
			response.sendRedirect("index.jsp");
		} else {
			out.println("Username or password is wrong.");
			out.println("<a href='login.jsp'>try again</a>");
		}
	} catch (SQLException e) {
		out.println("SQL Error: " + e);
	} catch (Exception e) {
		out.println("Error: " + e);
	}
%>