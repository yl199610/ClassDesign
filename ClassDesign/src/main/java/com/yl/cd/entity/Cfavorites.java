package com.yl.cd.entity;

public class Cfavorites {
	private Integer cfid;
	private Integer cuserid;
	private Integer cfp;
	private String cfstatus;
	private Cuser cuser;
	private Cproduct cproduct;
	private String favcount;
	public Cfavorites() {
	}

	
	public Cfavorites(Integer cfid, Integer cuserid, Integer cfp, String cfstatus, Cuser cuser, Cproduct cproduct,
			String favcount) {
		super();
		this.cfid = cfid;
		this.cuserid = cuserid;
		this.cfp = cfp;
		this.cfstatus = cfstatus;
		this.cuser = cuser;
		this.cproduct = cproduct;
		this.favcount = favcount;
	}


	public Integer getCfid() {
		return cfid;
	}
	public void setCfid(Integer cfid) {
		this.cfid = cfid;
	}
	public Integer getCuserid() {
		return cuserid;
	}
	public void setCuserid(Integer cuserid) {
		this.cuserid = cuserid;
	}
	public Integer getCfp() {
		return cfp;
	}
	public void setCfp(Integer cfp) {
		this.cfp = cfp;
	}
	public String getCfstatus() {
		return cfstatus;
	}
	public void setCfstatus(String cfstatus) {
		this.cfstatus = cfstatus;
	}

	public Cuser getCuser() {
		return cuser;
	}

	public void setCuser(Cuser cuser) {
		this.cuser = cuser;
	}

	public Cproduct getCproduct() {
		return cproduct;
	}

	public void setCproduct(Cproduct cproduct) {
		this.cproduct = cproduct;
	}


	public String getFavcount() {
		return favcount;
	}


	public void setFavcount(String favcount) {
		this.favcount = favcount;
	}


	@Override
	public String toString() {
		return "Cfavorites [cfid=" + cfid + ", cuserid=" + cuserid + ", cfp=" + cfp + ", cfstatus=" + cfstatus
				+ ", cuser=" + cuser + ", cproduct=" + cproduct + ", favcount=" + favcount + "]";
	}


	
}
