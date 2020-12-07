package com.ssafy.happyhouse.model;

public class InterestedAreaDto {
	private int no;
	private String userid;
	private String sido;
	private String sidoName;
	private String gugun;
	private String gugunName;
	private String dong;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getGugunName() {
		return gugunName;
	}
	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	
	public InterestedAreaDto() {
		super();
	}
	public InterestedAreaDto(String userid, String sido, String sidoName, String gugun, String gugunName, String dong) {
		super();
		this.userid = userid;
		this.sido = sido;
		this.sidoName = sidoName;
		this.gugun = gugun;
		this.gugunName = gugunName;
		this.dong = dong;
	}
}