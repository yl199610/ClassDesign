package com.yl.cd.entity;

public class Corderitem {
	private Integer coiid;
	private String coiname;
	private String coinumber;
	private String ciprice;
	private Integer cobid;
	private Integer corid;
	private Cproduct cproduct;
	private Corder corder;
	public Corderitem() {
	}

	public Corderitem(Integer coiid, String coiname, String coinumber, String ciprice, Integer cobid, Integer corid,
			Cproduct cproduct, Corder corder) {
		super();
		this.coiid = coiid;
		this.coiname = coiname;
		this.coinumber = coinumber;
		this.ciprice = ciprice;
		this.cobid = cobid;
		this.corid = corid;
		this.cproduct = cproduct;
		this.corder = corder;
	}

	public Integer getCoiid() {
		return coiid;
	}
	public void setCoiid(Integer coiid) {
		this.coiid = coiid;
	}
	public String getCoiname() {
		return coiname;
	}
	public void setCoiname(String coiname) {
		this.coiname = coiname;
	}
	public String getCoinumber() {
		return coinumber;
	}
	public void setCoinumber(String coinumber) {
		this.coinumber = coinumber;
	}
	public String getCiprice() {
		return ciprice;
	}
	public void setCiprice(String ciprice) {
		this.ciprice = ciprice;
	}
	public Integer getCobid() {
		return cobid;
	}
	public void setCobid(Integer cobid) {
		this.cobid = cobid;
	}
	public Integer getCorid() {
		return corid;
	}
	public void setCorid(Integer corid) {
		this.corid = corid;
	}

	public Cproduct getCproduct() {
		return cproduct;
	}

	public void setCproduct(Cproduct cproduct) {
		this.cproduct = cproduct;
	}

	public Corder getCorder() {
		return corder;
	}

	public void setCorder(Corder corder) {
		this.corder = corder;
	}

	@Override
	public String toString() {
		return "Corderitem [coiid=" + coiid + ", coiname=" + coiname + ", coinumber=" + coinumber + ", ciprice="
				+ ciprice + ", cobid=" + cobid + ", corid=" + corid + ", cproduct=" + cproduct + ", corder=" + corder
				+ "]";
	}

	
}
