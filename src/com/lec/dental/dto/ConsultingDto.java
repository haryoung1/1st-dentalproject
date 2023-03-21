package com.lec.dental.dto;

import java.sql.Timestamp;

public class ConsultingDto {
	private int cbno;
	private String mid;
	private String aid;
	private String cbtitle;
	private String cbcontent;
	private String cbfilename;
	private Timestamp cbrdate;
	private int cbhit;
	private int cbgroup;
	private int cbstep;
	private int cbindent;
	private String cbip;

	public ConsultingDto() {

	}

	public ConsultingDto(int cbno, String mid, String aid, String cbtitle, String cbcontent, String cbfilename,
			Timestamp cbrdate, int cbhit, int cbgroup, int cbstep, int cbindent, String cbip) {
		this.cbno = cbno;
		this.mid = mid;
		this.aid = aid;
		this.cbtitle = cbtitle;
		this.cbcontent = cbcontent;
		this.cbfilename = cbfilename;
		this.cbrdate = cbrdate;
		this.cbhit = cbhit;
		this.cbgroup = cbgroup;
		this.cbstep = cbstep;
		this.cbindent = cbindent;
		this.cbip = cbip;
	}

	public int getCbno() {
		return cbno;
	}

	public void setCbno(int cbno) {
		this.cbno = cbno;
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

	public String getCbtitle() {
		return cbtitle;
	}

	public void setCbtitle(String cbtitle) {
		this.cbtitle = cbtitle;
	}

	public String getCbcontent() {
		return cbcontent;
	}

	public void setCbcontent(String cbcontent) {
		this.cbcontent = cbcontent;
	}

	public String getCbfilename() {
		return cbfilename;
	}

	public void setCbfilename(String cbfilename) {
		this.cbfilename = cbfilename;
	}

	public Timestamp getCbrdate() {
		return cbrdate;
	}

	public void setCbrdate(Timestamp cbrdate) {
		this.cbrdate = cbrdate;
	}

	public int getCbhit() {
		return cbhit;
	}

	public void setCbhit(int cbhit) {
		this.cbhit = cbhit;
	}

	public int getCbgroup() {
		return cbgroup;
	}

	public void setCbgroup(int cbgroup) {
		this.cbgroup = cbgroup;
	}

	public int getCbstep() {
		return cbstep;
	}

	public void setCbstep(int cbstep) {
		this.cbstep = cbstep;
	}

	public int getCbindent() {
		return cbindent;
	}

	public void setCbindent(int cbindent) {
		this.cbindent = cbindent;
	}

	public String getCbip() {
		return cbip;
	}

	public void setCbip(String cbip) {
		this.cbip = cbip;
	}

	@Override
	public String toString() {
		return "ConsultingDto [cbno=" + cbno + ", mid=" + mid + ", aid=" + aid + ", cbtitle=" + cbtitle + ", cbcontent="
				+ cbcontent + ", cbfilename=" + cbfilename + ", cbrdate=" + cbrdate + ", cbhit=" + cbhit + ", cbgroup="
				+ cbgroup + ", cbstep=" + cbstep + ", cbindent=" + cbindent + ", cbip=" + cbip + "]";
	}
}