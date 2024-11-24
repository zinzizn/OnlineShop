package com.spring.model;


import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class Customer_bean {

	private int id;
	@NotEmpty
	private String name;
	@NotEmpty
	private String email;
	private String c_password;
	@NotEmpty
	private String password;
	private boolean addToCartstatus;
}
