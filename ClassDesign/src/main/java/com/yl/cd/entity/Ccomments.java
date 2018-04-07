package com.yl.cd.entity;

public class Ccomments {
	private Integer cid;
	private Integer cfp;
	private Integer cuserid;
	private String ccontent;
	private String ccdate;
	public Ccomments() {
	}
	public Ccomments(Integer cid, Integer cfp, Integer cuserid, String ccontent, String ccdate) {
		super();
		this.cid = cid;
		this.cfp = cfp;
		this.cuserid = cuserid;
		this.ccontent = ccontent;
		this.ccdate = ccdate;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getCfp() {
		return cfp;
	}
	public void setCfp(Integer cfp) {
		this.cfp = cfp;
	}
	public Integer getCuserid() {
		return cuserid;
	}
	public void setCuserid(Integer cuserid) {
		this.cuserid = cuserid;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCcdate() {
		return ccdate;
	}
	public void setCcdate(String ccdate) {
		this.ccdate = ccdate;
	}
	@Override
	public String toString() {
		return "Ccomments [cid=" + cid + ", cfp=" + cfp + ", cuserid=" + cuserid + ", ccontent=" + ccontent
				+ ", ccdate=" + ccdate + "]";
	}
	
}
