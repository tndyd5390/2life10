package com.cl.dto;

public class VisitStatisticsDTO {
	private String visitId;
	private String seq;
	private String url;
	private String uType;
	private String reg_dt;
	private String reg_member_no;
	private String chg_dt;
	private String chg_member_no;
	private String ip;
	public String getVisitId() {
		return visitId;
	}
	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getuType() {
		return uType;
	}
	public void setuType(String uType) {
		this.uType = uType;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getReg_member_no() {
		return reg_member_no;
	}
	public void setReg_member_no(String reg_member_no) {
		this.reg_member_no = reg_member_no;
	}
	public String getChg_dt() {
		return chg_dt;
	}
	public void setChg_dt(String chg_dt) {
		this.chg_dt = chg_dt;
	}
	public String getChg_member_no() {
		return chg_member_no;
	}
	public void setChg_member_no(String chg_member_no) {
		this.chg_member_no = chg_member_no;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
