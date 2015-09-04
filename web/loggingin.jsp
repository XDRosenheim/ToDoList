<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ToDoList", "root", "rootPassword");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from users where username='" + userid + "' and passphrase='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("LoggedIn", userid);
        response.sendRedirect("success.jsp");
    } else {
        out.println("s<a href='index.jsp'>try again</a>");
    }
%>