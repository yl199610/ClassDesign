package com.yl.cd.entity;

public class Corderitem {
	private Integer coiid;
	private String coiname;
	private String coinumber;
	private String ciprice;
	private Integer cobid;
	private Integer corid;
	public Corderitem() {
	}
	public Corderitem(Integer coiid, String coiname, String coinumber, String ciprice, Integer cobid, Integer corid) {
		super();
		this.coiid = coiid;
		this.coiname = coiname;
		this.coinumber = coinumber;
		this.ciprice = ciprice;
		this.cobid = cobid;
		this.corid = corid;
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
	@Override
	public String toString() {
		return "Corderitem [coiid=" + coiid + ", coiname=" + coiname + ", coinumber=" + coinumber + ", ciprice="
				+ ciprice + ", cobid=" + cobid + ", corid=" + corid + "]";
	}
	
}
