package dk.ToDoList;

import java.sql.*;

public class NewToDo {
	public void NewToDo(int userOwner, String textToDo, Boolean remind, Date dato, int freq, int cat) {
		
		try {
			
		Connection con = DriverManager.getConnection(
			DatabaseString.Driver + ":" + 
				DatabaseString.Protocol + ":" + 
				DatabaseString.serverURL, 
			DatabaseString.username, 
			DatabaseString.password);
		Statement st = con.createStatement();

		st.executeQuery("INSERT INTO ToDo (userOwner, textToDo, remind, dato, freq, cat) values (" 
			+ userOwner + ", '" + textToDo + "', " + remind + ", " + dato + ", " + freq + ", " + cat);
		
		} catch (SQLException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
