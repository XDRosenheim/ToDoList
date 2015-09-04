package dk.ToDoList;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBTools {
	String connectionURL = "jdbc:mysql://localhost/ToDoList";
	Connection con;
	Statement stmt;
	ResultSet rs;

	public DBTools() {
        
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(connectionURL, "root", DatabaseString.password);
			stmt = con.createStatement();
			System.out.println("Success.");
		} catch (SQLException e) {
			System.out.println("SQL Exception: " + e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("Class not found: " + e.getMessage());
			e.printStackTrace();
		}
	}

	public List getToDoById(int id) {
		List list = null;
		try {
			rs = stmt.executeQuery("select * from todo where id = " + id);
			if(rs.next()) {
				list = new List(
				rs.getInt("Id"),
				rs.getString("textToDo"),
				rs.getBoolean("remind"),
				rs.getDate("dato"),
				rs.getInt("freq"),
				rs.getInt("cat") );
			}
		} catch (SQLException e) {
			System.out.println("Exception!!! " + e.getMessage());
		}
		return list;
	}
        
        public List getAllEntries(){
            try {
                this.stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            } catch (SQLException ex) {
                System.out.println(ex);
            }
            
            List allEntries = null;
            try {
               ResultSet rst;
                rst = this.stmt.executeQuery("select textToDo from todo");
                int rows = 0;   
                if (rst.last()) {
                  rows = rst.getRow();
                // Move to beginning
                rst.beforeFirst();
                }  
                  
                for (int i = 0; i < rows; rows++) {
                    
                    rst.getString(i);
                }   

                
            } catch (SQLException ex) {
               System.out.println(ex);
            }
            
            return allEntries;
        }
}
