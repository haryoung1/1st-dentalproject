package com.lec.dental.dto;

import java.sql.Timestamp;

public class MedicalDto {
	private int mrno;
	private String mid;
	private String aid;
	private String mrtitle;
	private String mrcontent;
	private Timestamp mrrdate;
	private int mrhit;
	private int mrgroup;
	private int mrstep;
	private int mrindent;
	private String mrip;
	private String mname;
	private String aname;

	public MedicalDto() {

	}

	public MedicalDto(int mrno, String mid, String aid, String mrtitle, String mrcontent, Timestamp mrrdate, int mrhit,
			int mrgroup, int mrstep, int mrindent, String mrip, String mname, String aname) {
		this.mrno = mrno;
		this.mid = mid;
		this.aid = aid;
		this.mrtitle = mrtitle;
		this.mrcontent = mrcontent;
		this.mrrdate = mrrdate;
		this.mrhit = mrhit;
		this.mrgroup = mrgroup;
		this.mrstep = mrstep;
		this.mrindent = mrindent;
		this.mrip = mrip;
		this.mname = mname;
		this.aname = aname;
	}

	public int getMrno() {
		return mrno;
	}

	public void setMrno(int mrno) {
		this.mrno = mrno;
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

	public String getMrtitle() {
		return mrtitle;
	}

	public void setMrtitle(String mrtitle) {
		this.mrtitle = mrtitle;
	}

	public String getMrcontent() {
		return mrcontent;
	}

	public void setMrcontent(String mrcontent) {
		this.mrcontent = mrcontent;
	}

	public Timestamp getMrrdate() {
		return mrrdate;
	}

	public void setMrrdate(Timestamp mrrdate) {
		this.mrrdate = mrrdate;
	}

	public int getMrhit() {
		return mrhit;
	}

	public void setMrhit(int mrhit) {
		this.mrhit = mrhit;
	}

	public int getMrgroup() {
		return mrgroup;
	}

	public void setMrgroup(int mrgroup) {
		this.mrgroup = mrgroup;
	}

	public int getMrstep() {
		return mrstep;
	}

	public void setMrstep(int mrstep) {
		this.mrstep = mrstep;
	}

	public int getMrindent() {
		return mrindent;
	}

	public void setMrindent(int mrindent) {
		this.mrindent = mrindent;
	}

	public String getMrip() {
		return mrip;
	}

	public void setMrip(String mrip) {
		this.mrip = mrip;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public String toString() {
		return "MedicalDto [mrno=" + mrno + ", mid=" + mid + ", aid=" + aid + ", mrtitle=" + mrtitle + ", mrcontent="
				+ mrcontent + ", mrrdate=" + mrrdate + ", mrhit=" + mrhit + ", mrgroup=" + mrgroup + ", mrstep="
				+ mrstep + ", mrindent=" + mrindent + ", mrip=" + mrip + ", mname=" + mname + ", aname=" + aname + "]";
	}	
	
}