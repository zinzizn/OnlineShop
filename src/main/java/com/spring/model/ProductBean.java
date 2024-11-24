package com.spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class ProductBean {

	private int id;
	private String product_name;
	private int quantity;
	private double price;
	private String brand;
	private String photo;
	private int c_id;
	private String c_name;
	private MultipartFile product_image;
	private int maxQuantity; 
	
}
