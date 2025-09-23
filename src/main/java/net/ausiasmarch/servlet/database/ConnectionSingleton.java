package net.ausiasmarch.servlet.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionSingleton {
    
   	private static Connection con;
	
	public static Connection getConnection() throws SQLException {
		
		String url = "jdbc:mysql://localhost:3306/mondublio";
		String user = "root";
		String password = "tiger";
	
		if(con == null || con.isClosed()) {
			con = DriverManager.getConnection(url, user, password);
		}
		
		return con;
	}
}
