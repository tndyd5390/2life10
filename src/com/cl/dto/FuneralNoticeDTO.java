package com.cl.dto;

public class FuneralNoticeDTO {
	private String funeralNoticeNo;
	private String funeralNoticeName;
	private String funeralNoticeMember;
	private String funeralNoticeDay;
	private String funeralNoticePlace;
	private String regMemberNo;
	private String regDt;
	private String chgMemberNo;
	private String chgDt;
	private int page;
	private int splitPage;
	private String searchBox;
	private String search;
	
	public String getRegMemberNo() {
		return regMemberNo;
	}
	public void setRegMemberNo(String regMemberNo) {
		this.regMemberNo = regMemberNo;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public String getChgMemberNo() {
		return chgMemberNo;
	}
	public void setChgMemberNo(String chgMemberNo) {
		this.chgMemberNo = chgMemberNo;
	}
	public String getChgDt() {
		return chgDt;
	}
	public void setChgDt(String chgDt) {
		this.chgDt = chgDt;
	}
	public String getFuneralNoticeMember() {
		return funeralNoticeMember;
	}
	public void setFuneralNoticeMember(String funeralNoticeMember) {
		this.funeralNoticeMember = funeralNoticeMember;
	}
	
	public String getFuneralNoticeNo() {
		return funeralNoticeNo;
	}
	public void setFuneralNoticeNo(String funeralNoticeNo) {
		this.funeralNoticeNo = funeralNoticeNo;
	}
	public String getFuneralNoticeName() {
		return funeralNoticeName;
	}
	public void setFuneralNoticeName(String funeralNoticeName) {
		this.funeralNoticeName = funeralNoticeName;
	}
	public String getFuneralNoticeDay() {
		return funeralNoticeDay;
	}
	public void setFuneralNoticeDay(String funeralNoticeDay) {
		this.funeralNoticeDay = funeralNoticeDay;
	}
	public String getFuneralNoticePlace() {
		return funeralNoticePlace;
	}
	public void setFuneralNoticePlace(String funeralNoticePlace) {
		this.funeralNoticePlace = funeralNoticePlace;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSplitPage() {
		return splitPage;
	}
	public void setSplitPage(int splitPage) {
		this.splitPage = splitPage;
	}
	public String getSearchBox() {
		return searchBox;
	}
	public void setSearchBox(String searchBox) {
		this.searchBox = searchBox;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
}
