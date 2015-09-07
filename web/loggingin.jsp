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
		rs = st.executeQuery("select ID from users where username='" + user + "' and passphrase='" + pwd + "'");
		if (rs.next()) {
			session.setAttribute("LoggedIn", user);
			session.setAttribute("LoggedInID", rs.getInt("ID"));
			response.sendRedirect("index.jsp");
		} else {
			session.setAttribute("WrongUserPass", "Username or password is wrong.");
			response.sendRedirect("login.jsp");
		}
	} catch (SQLException e) {
		out.println("SQL Error: " + e);
	} catch (Exception e) {
		out.println("Error: " + e);
	}
%>