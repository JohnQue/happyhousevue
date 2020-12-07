package com.ssafy.happyhouse.model;


public class MemberDto {
	private String userid;
	private String password;
	private String name;
	private String phone;
	private String email;
	private int userType;
	
	public MemberDto() {
		// TODO Auto-generated constructor stub
	}

	public MemberDto(String userid, String password, String name, String phone, String email, int userType) {
		super();
		this.userid = userid;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.userType = userType;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "MemberDto [userid=" + userid + ", password=" + password + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", userType=" + userType + "]";
	}
}