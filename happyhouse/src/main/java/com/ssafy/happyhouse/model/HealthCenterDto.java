package com.ssafy.happyhouse.model;

public class HealthCenterDto {
	private int no;
	private String institute;
	private String address;
	private String oponweek;
	private String oponweekend;
	private String oponholiday;
	private String tel;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOponweek() {
		return oponweek;
	}
	public void setOponweek(String oponweek) {
		this.oponweek = oponweek;
	}
	public String getOponweekend() {
		return oponweekend;
	}
	public void setOponweekend(String oponweekend) {
		this.oponweekend = oponweekend;
	}
	public String getOponholiday() {
		return oponholiday;
	}
	public void setOponholiday(String oponholiday) {
		this.oponholiday = oponholiday;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public HealthCenterDto() {
		// TODO Auto-generated constructor stub
	}
	public HealthCenterDto(int no, String institute, String address, String oponweek, String oponweekend, String oponholiday,
			String tel) {
		super();
		this.no = no;
		this.institute = institute;
		this.address = address;
		this.oponweek = oponweek;
		this.oponweekend = oponweekend;
		this.oponholiday = oponholiday;
		this.tel = tel;
	}
	
}
