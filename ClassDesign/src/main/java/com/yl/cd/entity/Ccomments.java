package com.yl.cd.entity;

public class Ccomments {
	private Integer cid;
	private Integer cfp;
	private Integer cuserid;
	private String ccontent;
	private String ccdate;
	private Cproduct cproduct;
	private Cuser cuser;
	private String comcount;
	private String theam;
	public Ccomments() {
	}

	public Ccomments(Integer cid, Integer cfp, Integer cuserid, String ccontent, String ccdate, Cproduct cproduct,
			Cuser cuser, String comcount, String theam) {
		super();
		this.cid = cid;
		this.cfp = cfp;
		this.cuserid = cuserid;
		this.ccontent = ccontent;
		this.ccdate = ccdate;
		this.cproduct = cproduct;
		this.cuser = cuser;
		this.comcount = comcount;
		this.theam = theam;
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

	public Cproduct getCproduct() {
		return cproduct;
	}

	public void setCproduct(Cproduct cproduct) {
		this.cproduct = cproduct;
	}

	public Cuser getCuser() {
		return cuser;
	}

	public void setCuser(Cuser cuser) {
		this.cuser = cuser;
	}

	public String getComcount() {
		return comcount;
	}


	public void setComcount(String comcount) {
		this.comcount = comcount;
	}
	
	

	public String getTheam() {
		return theam;
	}

	public void setTheam(String theam) {
		this.theam = theam;
	}

	@Override
	public String toString() {
		return "Ccomments [cid=" + cid + ", cfp=" + cfp + ", cuserid=" + cuserid + ", ccontent=" + ccontent
				+ ", ccdate=" + ccdate + ", cproduct=" + cproduct + ", cuser=" + cuser + ", comcount=" + comcount
				+ ", theam=" + theam + "]";
	}

}
