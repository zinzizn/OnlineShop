package com.spring.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.spring.model.Customer_bean;
import com.spring.model.LoginBean;





public class Customer_Login {
	
	public int cust_register(Customer_bean customer) throws SQLException {
		int i=0;
		Connection con=DB_connection.getConnection();
		PreparedStatement p=con.prepareStatement("Insert into customer (cust_name,cust_email,cust_password) values (?,?,?)");
		p.setString(1, customer.getName());
		p.setString(2, customer.getEmail());
		p.setString(3, customer.getPassword());
		i=p.executeUpdate();
		return i;
	}
	
	public Customer_bean doLogin(LoginBean login){
		Customer_bean user=null;
		Connection con=DB_connection.getConnection();
		
		try {
			
			PreparedStatement ps=con.prepareStatement("select * from customer where cust_email=? and cust_password=?");
			ps.setString(1, login.getEmail());
			ps.setString(2, login.getPassword());
			
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				user=new Customer_bean();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("cust_email"));
				user.setPassword(rs.getString("cust_password"));
				user.setName(rs.getString("cust_name"));
			}
		} catch (SQLException e) {
			System.out.println("Login Error: "+e.getMessage());
		}
		
		return user;
	}
	
	public boolean checkEmail(String email) {
		boolean flag=false;
		Connection con=DB_connection.getConnection();
		
		try {
			PreparedStatement ps=con.prepareStatement("select * from customer where cust_email=?");
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				flag=true;
			}
		} catch (SQLException e) {
			System.out.println("Check Email Error: "+e.getMessage());
		}	
		return flag;
	}
	
	
	public Customer_bean getUserByEmail(String email) {
		Customer_bean user = null;
	    String sql = "SELECT * FROM customer WHERE cust_email = ?";
	    
	    try (Connection con = DB_connection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            user = new Customer_bean();
	            user.setId(rs.getInt("id"));
	            user.setEmail(rs.getString("cust_email"));
	            user.setName(rs.getString("cust_name"));
	            user.setPassword(rs.getString("cust_password"));
	           
	           
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return user;
	}
	
	public int updateUserProfile(Customer_bean user) {
	    int i = 0;
	    // Fixed the SQL statement by adding a comma
	    String sql = "UPDATE customer SET cust_name = ? WHERE cust_email = ?";
	    try (Connection con = DB_connection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, user.getName());
	        ps.setString(2, user.getEmail());

	        i = ps.executeUpdate();
	        System.out.println("Update profile is successful");
	    } catch (SQLException e) {
	        System.out.println("Error updating admin: " + e.getMessage());
	    }
	    return i;
	}
	
	public int deleteUser(int id) {
		int i = 0;
		Connection con = DB_connection.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement("delete from customer where id=?");

			ps.setInt(1, id);

			i = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete user : " + e.getMessage());

		}

		return i;
 }
}
