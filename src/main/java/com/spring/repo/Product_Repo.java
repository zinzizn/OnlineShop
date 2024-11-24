package com.spring.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.spring.model.ProductBean;
import com.spring.model.category_bean;





public class Product_Repo {

	public int product_category(category_bean category) throws SQLException {
		int i=0;
		Connection con=DB_connection.getConnection();
		PreparedStatement p=con.prepareStatement("Insert into product_category (category_name) values (?)");
		p.setString(1, category.getName());
		
		i=p.executeUpdate();
		return i;
	}
	
	public List<category_bean> getCategory () {
	    List<category_bean> cbeans   = new ArrayList<category_bean>();
	    Connection con = DB_connection.getConnection();
	    String sql = "SELECT * FROM product_category";
	    try {
	       PreparedStatement ps = con.prepareStatement(sql);
	       ResultSet rs = ps.executeQuery();
	       while(rs.next()) {
	    	   category_bean cbean = new category_bean();
	         cbean.setId(rs.getInt("id"));
	         
	         cbean.setName(rs.getString("category_name"));
	         cbeans.add(cbean);
	         
	       }
	      // System.out.println("Get successful");
	    } catch (Exception e) {
	    	e.printStackTrace();
	     // System.out.println("Get Category Fail : " + e.getMessage());
	    }
	    return cbeans;
	  } 
	
	public List<ProductBean> getProduct() {
	    List<ProductBean> cbeans = new ArrayList<>();
	    Connection con = DB_connection.getConnection();
	    String sql = "SELECT product.id AS product_id, product.p_brand AS product_brand, product.p_name AS product_name, " +
	                 "product.p_quantity AS product_quantity, product.p_price AS product_price, product.p_photo AS product_photo, " +
	                 "product.c_id AS category_id, product_category.category_name AS category_name " +
	                 "FROM product INNER JOIN product_category ON product.c_id = product_category.id";

	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            ProductBean pbean = new ProductBean();
	            pbean.setId(rs.getInt("product_id")); 
	            pbean.setBrand(rs.getString("product_brand"));
	            pbean.setProduct_name(rs.getString("product_name"));
	            pbean.setQuantity(rs.getInt("product_quantity"));
	            pbean.setPrice(rs.getDouble("product_price"));
	            pbean.setPhoto(rs.getString("product_photo"));
	            pbean.setC_id(rs.getInt("category_id"));
	            pbean.setC_name(rs.getString("category_name"));
	            cbeans.add(pbean);
	        }
	       // System.out.println("Get successful");
	    } catch (Exception e) {
	        e.printStackTrace();
	        //System.out.println("Get Product Fail: " + e.getMessage());
	    }
	    return cbeans;
	}

	
	public int insert_product(ProductBean product) throws SQLException {
		int i=0;
		Connection con=DB_connection.getConnection();
		PreparedStatement p=con.prepareStatement("Insert into product (p_name,p_quantity,p_price,p_brand,p_photo,c_id) values (?,?,?,?,?,?)");
		p.setString(1,product.getProduct_name());
		p.setInt(2, product.getQuantity());
		p.setDouble(3, product.getPrice());
		p.setString(4, product.getBrand());
		p.setString(5, product.getPhoto());
		p.setInt(6, product.getC_id());
		
		i=p.executeUpdate();
		return i;
	}
	
	public ProductBean findProductById(int id) {
        ProductBean product = null;
        Connection con = DB_connection.getConnection();
        String query = "SELECT * FROM product WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                product = new ProductBean();
                product.setId(id);
                product.setProduct_name(rs.getString("p_name"));
                product.setBrand(rs.getString("p_brand"));
                product.setPrice(rs.getDouble("p_price"));
                product.setQuantity(rs.getInt("p_quantity"));
                product.setPhoto(rs.getString("p_photo"));
                product.setMaxQuantity(rs.getInt("p_quantity"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
	
	public List<ProductBean> getCartItems() {
        List<ProductBean> cartItems = new ArrayList<>();
        String query = "SELECT ci.product_id, ci.quantity, p.p_name, p.p_price, p.p_photo FROM cart_items ci " +
                       "JOIN product p ON ci.product_id = p.id"; 

        try (Connection con = DB_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setId(rs.getInt("product_id"));
                product.setProduct_name(rs.getString("p_name"));
                product.setPrice(rs.getDouble("p_price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPhoto(rs.getString("p_photo"));
                product.setMaxQuantity(rs.getInt("quantity"));
                cartItems.add(product);
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving cart items: " + e.getMessage());
        }
        return cartItems;
    }
	
	
	public List<ProductBean> searchProductsByName(String name) {
	    List<ProductBean> pbeans = new ArrayList<>();
	    Connection con = DB_connection.getConnection();
	    String sql = "SELECT product.id AS product_id, product.p_brand AS product_brand, product.p_name AS product_name, " +
	                 "product.p_quantity AS product_quantity, product.p_price AS product_price, product.p_photo AS product_photo, " +
	                 "product.c_id AS category_id, product_category.category_name AS category_name " +
	                 "FROM product INNER JOIN product_category ON product.c_id = product_category.id " +
	                 "WHERE product_category.category_name LIKE ?";

	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, "%" + name + "%"); // Use LIKE for partial matches
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            ProductBean pbean = new ProductBean();
	            pbean.setId(rs.getInt("product_id"));
	            pbean.setBrand(rs.getString("product_brand"));
	            pbean.setProduct_name(rs.getString("product_name"));
	            pbean.setQuantity(rs.getInt("product_quantity"));
	            pbean.setPrice(rs.getDouble("product_price"));
	            pbean.setPhoto(rs.getString("product_photo"));
	            pbean.setC_id(rs.getInt("category_id"));
	            pbean.setC_name(rs.getString("category_name"));
	            pbeans.add(pbean);
	        }
	        System.out.println("Search successful");
	    } catch (Exception e) {
	        System.out.println("Search Product Fail: " + e.getMessage());
	    }
	    return pbeans;
	}

}
