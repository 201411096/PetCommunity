package com.mycompany.domain;

public class FindHospitalVO {
	private int findhospitalId;
	private String findhospitalName;
	private String findhospitalTel;
	private String cityName;
	private String province;
	private String findhospitalAddress;
	private String findhospitalX;
	private String findhospitalY;
	private String keyWord;//검색어
	private String searchType;//검색타입
	
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public int getFindhospitalId() {
		return findhospitalId;
	}
	public void setFindhospitalId(int findhospitalId) {
		this.findhospitalId = findhospitalId;
	}
	public String getFindhospitalName() {
		return findhospitalName;
	}
	public void setFindhospitalName(String findhospitalName) {
		this.findhospitalName = findhospitalName;
	}
	public String getFindhospitalTel() {
		return findhospitalTel;
	}
	public void setFindhospitalTel(String findhospitalTel) {
		this.findhospitalTel = findhospitalTel;
	}
	public String getFindhospitalAddress() {
		return findhospitalAddress;
	}
	public void setFindhospitalAddress(String findhospitalAddress) {
		this.findhospitalAddress = findhospitalAddress;
	}
	public String getFindhospitalX() {
		return findhospitalX;
	}
	public void setFindhospitalX(String findhospitalX) {
		this.findhospitalX = findhospitalX;
	}
	public String getFindhospitalY() {
		return findhospitalY;
	}
	public void setFindhospitalY(String findhospitalY) {
		this.findhospitalY = findhospitalY;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	
}
