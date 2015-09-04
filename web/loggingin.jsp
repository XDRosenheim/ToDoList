<%@ page import ="java.sql.*" %>
<%@ page import="dk.ToDoList.*" %>

<%
    String user = request.getParameter("username");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ToDoList", "root", DatabaseString.password);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where username='" + user + "' and passphrase='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("LoggedIn", user);
        response.sendRedirect("success.jsp");
    } else {
		out.println("Username or password is wrong.");
        out.println("<a href='login.jsp'>try again</a>");
    }
%>