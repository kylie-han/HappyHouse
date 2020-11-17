package com.ssafy.happyhouse.dto;

public class InterestAreaDTO {
	private String userid;
	private String sidoName;
	private String gugunName;
	private String dongName;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSidoName() {
		return sidoName;
	}
	public void setSidoName(String sidoName) {
		this.sidoName = sidoName;
	}
	public String getGugunName() {
		return gugunName;
	}
	public void setGugunName(String gugunName) {
		this.gugunName = gugunName;
	}
	public String getDongName() {
		return dongName;
	}
	public void setDongName(String dongName) {
		this.dongName = dongName;
	}
	@Override
	public String toString() {
		return "InterestAreaDTO [userid=" + userid + ", sidoName=" + sidoName + ", gugunName=" + gugunName + ", dongName="
				+ dongName + "]";
	}
	
	
}
