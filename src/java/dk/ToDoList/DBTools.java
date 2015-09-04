package dk.ToDoList;

import java.sql.*;
import java.util.ArrayList;

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
			e.printStackTrace();
		}
		return list;
	}
        
        public ArrayList<List> getAllEntries(){
            
            
            
            return null;
        }
}
