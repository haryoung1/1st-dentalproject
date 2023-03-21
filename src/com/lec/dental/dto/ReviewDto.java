package com.lec.dental.dto;

import java.sql.Timestamp;

public class ReviewDto {
	private int rvno;
	private String mid;
	private String aid;
	private String rvtitle;
	private String rvcontent;
	private String rvfilename;
	private Timestamp rvrdate;
	private int rvhit;
	private int rvgroup;
	private int rvstep;
	private int rvindent;
	private String rvip;

	public ReviewDto() {

	}

	public ReviewDto(int rvno, String mid, String aid, String rvtitle, String rvcontent, String rvfilename,
			Timestamp rvrdate, int rvhit, int rvgroup, int rvstep, int rvindent, String rvip) {
		this.rvno = rvno;
		this.mid = mid;
		this.aid = aid;
		this.rvtitle = rvtitle;
		this.rvcontent = rvcontent;
		this.rvfilename = rvfilename;
		this.rvrdate = rvrdate;
		this.rvhit = rvhit;
		this.rvgroup = rvgroup;
		this.rvstep = rvstep;
		this.rvindent = rvindent;
		this.rvip = rvip;
	}

	public int getRvno() {
		return rvno;
	}

	public void setRvno(int rvno) {
		this.rvno = rvno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getRvtitle() {
		return rvtitle;
	}

	public void setRvtitle(String rvtitle) {
		this.rvtitle = rvtitle;
	}

	public String getRvcontent() {
		return rvcontent;
	}

	public void setRvcontent(String rvcontent) {
		this.rvcontent = rvcontent;
	}

	public String getRvfilename() {
		return rvfilename;
	}

	public void setRvfilename(String rvfilename) {
		this.rvfilename = rvfilename;
	}

	public Timestamp getRvrdate() {
		return rvrdate;
	}

	public void setRvrdate(Timestamp rvrdate) {
		this.rvrdate = rvrdate;
	}

	public int getRvhit() {
		return rvhit;
	}

	public void setRvhit(int rvhit) {
		this.rvhit = rvhit;
	}

	public int getRvgroup() {
		return rvgroup;
	}

	public void setRvgroup(int rvgroup) {
		this.rvgroup = rvgroup;
	}

	public int getRvstep() {
		return rvstep;
	}

	public void setRvstep(int rvstep) {
		this.rvstep = rvstep;
	}

	public int getRvindent() {
		return rvindent;
	}

	public void setRvindent(int rvindent) {
		this.rvindent = rvindent;
	}

	public String getRvip() {
		return rvip;
	}

	public void setRvip(String rvip) {
		this.rvip = rvip;
	}

	@Override
	public String toString() {
		return "ReviewDto [rvno=" + rvno + ", mid=" + mid + ", aid=" + aid + ", rvtitle=" + rvtitle + ", rvcontent="
				+ rvcontent + ", rvfilename=" + rvfilename + ", rvrdate=" + rvrdate + ", rvhit=" + rvhit + ", rvgroup="
				+ rvgroup + ", rvstep=" + rvstep + ", rvindent=" + rvindent + ", rvip=" + rvip + "]";
	}
}