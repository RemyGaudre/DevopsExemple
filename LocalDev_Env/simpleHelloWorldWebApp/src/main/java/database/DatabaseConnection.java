package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection { 
 
	
	public static Connection initializeDatabase() 
        throws SQLException, ClassNotFoundException 
    { 
        String dbDriver = "com.mysql.jdbc.Driver"; 
        String dbURL = "jdbc:mysql://localhost:3306/"; 
        String dbName = "simpleHelloWorlddb"; 
        String dbUsername = "root"; 
        String dbPassword = "12345678"; 
  
        Class.forName(dbDriver); 
        Connection con = DriverManager.getConnection(dbURL + dbName+"?useSSL=false", 
                                                     dbUsername,  
                                                     dbPassword); 
        return con; 
    } 
    
} 
