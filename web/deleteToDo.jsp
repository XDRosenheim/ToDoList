<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dk.ToDoList.*" %>  




<%

try{
    Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
			DatabaseString.Driver + ":" + 
				DatabaseString.Protocol + ":" + 
				DatabaseString.serverURL, 
			DatabaseString.username, 
			DatabaseString.password);
		Statement st = con.createStatement();
                
                String s = request.getParameter("ID");
                
                int i = Integer.parseInt(s);
            
               st.executeUpdate("DELETE FROM ToDo WHERE ID=" + i );  
               
               
               
}
                catch(SQLException e){
                        out.println(e);
                        }
                catch(Exception e){
                    out.println(e);
                }

        
                    response.sendRedirect("index.jsp");
                
                %>