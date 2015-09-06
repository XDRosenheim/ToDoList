<%@ page import="java.sql.*" %>
<%@ page import="dk.ToDoList.*" %>

<%
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
	String pwdAgain = request.getParameter("passwordAgain");

	if (!pwd.toString().equals(pwdAgain)){
		out.println("Passwords are not the same."); 
                out.println("<a href=\"signup.jsp\">Try again.</a>");
	}
	else {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(DatabaseString.Driver + ":" +
                        DatabaseString.Protocol + ":" + 
                        DatabaseString.serverURL, DatabaseString.username, DatabaseString.password);
		Statement st = con.createStatement();

		ResultSet rs;
		rs = st.executeQuery("select * from users where username='" + user + "'");
		
                try {
                    if (rs.next()){
                        out.println("User already exists.");
                        out.println("<a href=\"signup.jsp\">Try again.</a>");
                    }

                    int i = st.executeUpdate("insert into users values (NULL, '" + user + "','" + pwd + "');");
                    if (i > 0) {
                        response.sendRedirect("login.jsp");
                    } else {
                            System.out.println("Error.... Unknown");
                            out.println("<a href=\"signup.jsp\">Try again.</a>");
                    }
                    con.close();
                } catch (SQLException e) {
                    out.println("SQL Error: " + e);
                }
	}
%>
