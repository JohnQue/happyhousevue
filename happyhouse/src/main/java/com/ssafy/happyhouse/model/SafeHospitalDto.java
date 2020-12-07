package com.ssafy.happyhouse.model;

public class SafeHospitalDto {
	private String basedate;
	private String sido;
	private String gugun;
	private String hospitalname;
	private String address;
	private String diagnosistype;
	private String tel;
	
	public String getBasedate() {
		return basedate;
	}

	public void setBasedate(String basedate) {
		this.basedate = basedate;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getHospitalname() {
		return hospitalname;
	}

	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDiagnosistype() {
		return diagnosistype;
	}

	public void setDiagnosistype(String diagnosistype) {
		this.diagnosistype = diagnosistype;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public SafeHospitalDto() {	}
	
	public SafeHospitalDto(String basedate, String sido, String gugun, String hospitalname, String address, String diagnosistype,
			String tel) {
		super();
		this.basedate = basedate;
		this.sido = sido;
		this.gugun = gugun;
		this.hospitalname = hospitalname;
		this.address = address;
		this.diagnosistype = diagnosistype;
		this.tel = tel;
	}
	
}
