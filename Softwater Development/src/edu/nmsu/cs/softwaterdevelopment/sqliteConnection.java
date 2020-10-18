package edu.nmsu.cs.softwaterdevelopment;
import java.sql.*;
import javax.swing.*;

public class sqliteConnection {
	
	Connection conn = null;
	
	public static Connection dbConnector() {
		try {
			//define class for connection
			Class.forName("org.sqlite.JDBC");
			//create connection
			Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\dcaesar\\cs371\\Softwater-Development\\Softwater Development\\water.sqbpro)");
			//Message to verify the connection is successful
			JOptionPane.showMessageDialog(null, "Connection successful");
			//return the connection
			return conn;
			
			
		} catch(Exception e) {
			JOptionPane.showMessageDialog(null, e);
			return null;
		}
	}

}
