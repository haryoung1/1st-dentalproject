package com.lec.dental.dto;

public class AdminDto {
	private String aid;
	private String apw;
	private String aname;
	private String acode;

	public AdminDto() {
	}

	public AdminDto(String aid, String apw, String aname, String acode) {
		this.aid = aid;
		this.apw = apw;
		this.aname = aname;
		this.acode = acode;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getApw() {
		return apw;
	}

	public void setApw(String apw) {
		this.apw = apw;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAcode() {
		return acode;
	}

	public void setAcode(String acode) {
		this.acode = acode;
	}

	@Override
	public String toString() {
		return "AdminDto [aid=" + aid + ", apw=" + apw + ", aname=" + aname + ", acode=" + acode + "]";
	}
}