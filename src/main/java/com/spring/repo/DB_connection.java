package com.spring.repo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB_connection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_shop", "root", "root");

		} catch (Exception e) {
			e.getMessage();
		}
		return con;
	}
}
