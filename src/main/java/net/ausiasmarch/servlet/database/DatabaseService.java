package net.ausiasmarch.servlet.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseService {
    
    private static Connection con;
	
	static Connection getConnection() throws SQLException {
		
		String url = "jdbc:mysql://127.0.0.1:3306/mondublio";
		String user = "root";
		String password = "tiger";
		
		if(con == null || con.isClosed()) {
			con = DriverManager.getConnection(url, user, password);
		}
		
		return con;
	}
}
