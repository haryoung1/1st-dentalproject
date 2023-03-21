package com.lec.dental.dto;

import java.sql.Timestamp;

public class NoticeDto {
	private int nbno;
	private String aid;
	private String nbtitle;
	private String nbcontent;
	private Timestamp nbrdate;
	private String nbip;
	private String aname;

	public NoticeDto() {

	}

	public NoticeDto(int nbno, String aid, String nbtitle, String nbcontent, Timestamp nbrdate, String nbip,
			String aname) {
		this.nbno = nbno;
		this.aid = aid;
		this.nbtitle = nbtitle;
		this.nbcontent = nbcontent;
		this.nbrdate = nbrdate;
		this.nbip = nbip;
		this.aname = aname;
	}

	public int getNbno() {
		return nbno;
	}

	public void setNbno(int nbno) {
		this.nbno = nbno;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getNbtitle() {
		return nbtitle;
	}

	public void setNbtitle(String nbtitle) {
		this.nbtitle = nbtitle;
	}

	public String getNbcontent() {
		return nbcontent;
	}

	public void setNbcontent(String nbcontent) {
		this.nbcontent = nbcontent;
	}

	public Timestamp getNbrdate() {
		return nbrdate;
	}

	public void setNbrdate(Timestamp nbrdate) {
		this.nbrdate = nbrdate;
	}

	public String getNbip() {
		return nbip;
	}

	public void setNbip(String nbip) {
		this.nbip = nbip;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public String toString() {
		return "NoticeDto [nbno=" + nbno + ", aid=" + aid + ", nbtitle=" + nbtitle + ", nbcontent=" + nbcontent
				+ ", nbrdate=" + nbrdate + ", nbip=" + nbip + ", aname=" + aname + "]";
	}

}