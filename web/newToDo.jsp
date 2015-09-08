<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dk.ToDoList.*" %>

<%
    String text = request.getParameter("ToDoText");
    boolean remind = false;
    if (request.getParameter("remind") != null){
        remind = true;
    }
    else {
        remind = false;
    }
    
    String cat = request.getParameter("colour");
    Calendar now = Calendar.getInstance();
    
    int catInt;
    if (cat.equals("apple")) catInt = 1;
    else if (cat.equals("orange")) catInt = 2;
    else if (cat.equals("grapes")) catInt = 3;
    else catInt = 4;
    
    try{
    Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
			DatabaseString.Driver + ":" + 
				DatabaseString.Protocol + ":" + 
				DatabaseString.serverURL, 
			DatabaseString.username, 
			DatabaseString.password);
		Statement st = con.createStatement();

		int i = st.executeUpdate("INSERT INTO ToDo (userOwner, textToDo, remind, dato, freq, cat) "
                        + "values (" + session.getAttribute("LoggedInID") + ","
                        + " '" + text + "',"
                        + " " + remind + ","
                        + " NOW(),"
                        + 1 + ","
                        + catInt + ");");
                
                if (i >= 1){
                    response.sendRedirect("index.jsp");
                }
                
    } catch(SQLException e){
        out.println(e);
    } catch(Exception e) {
        out.println(e);
    }
    
%>
