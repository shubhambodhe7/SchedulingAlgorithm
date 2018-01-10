package com.dto.vesit;

import java.sql.Date;

public class Login {
	private String userId;
	private String roleName;
	private String userPassword;
	private String contact;
	private String userName;
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Login(String userId, String roleName, String userPassword, String contact, String userName) {
		super();
		this.userId = userId;
		this.roleName = roleName;
		this.userPassword = userPassword;
		this.contact = contact;
		this.userName = userName;
	}
	
	
	public Login(String roleName) {
		super();
		this.roleName = roleName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
