package com.foodapp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static final String URL = getSetting("FOOD_DB_URL", "jdbc:mysql://localhost:3306/food");
	private static final String USERNAME = getSetting("FOOD_DB_USER", "root");
	private static final String PASSWORD = getSetting("FOOD_DB_PASSWORD", "root");

	private static String getSetting(String name, String defaultValue) {
		String value = System.getenv(name);
		return value == null || value.isBlank() ? defaultValue : value;
	}
	
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL, USERNAME, PASSWORD);
		}
		catch (ClassNotFoundException e) {
			throw new IllegalStateException("MySQL JDBC driver is not available", e);
		} catch (SQLException e) {
			throw new IllegalStateException("Cannot connect to MySQL at " + URL
					+ ". Set FOOD_DB_USER and FOOD_DB_PASSWORD, and create the food database.", e);
		}
	}
}