package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
    private static final String DRIVER_NAME = "org.apache.derby.jdbc.EmbeddedDriver";
    private static final String CONNECTION_STRING = "jdbc:derby:C:\\Users\\AARON\\MyDB;create=true";


    // Private constructor to prevent instantiation
    private DBConnection() {}

    // Method to establish and return a database connection
    public static Connection getCon() throws SQLException {
        try {
            Class.forName(DRIVER_NAME);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database Driver not found!", e);
        }
        return DriverManager.getConnection(CONNECTION_STRING);
    }

    // Method to close connection
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}