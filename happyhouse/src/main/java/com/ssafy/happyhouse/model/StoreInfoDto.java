package com.ssafy.happyhouse.model;

public class StoreInfoDto {
	private String dong;
	private String storename;
	private String roadname;
	private double lat;
	private double lng;
	
	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getRoadname() {
		return roadname;
	}

	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}

	public String getStorename() {
		return storename;
	}

	public void setStorename(String storename) {
		this.storename = storename;
	}
	
	public Double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public StoreInfoDto() {
		// TODO Auto-generated constructor stub
	}

	public StoreInfoDto(String dong, String roadname, String storename, double lat, double lng) {
		super();
		this.dong = dong;
		this.roadname = roadname;
		this.storename = storename;
		this.lat = lat;
		this.lng = lng;
	}
}
