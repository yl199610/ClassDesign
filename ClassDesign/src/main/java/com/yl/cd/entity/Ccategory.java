package com.yl.cd.entity;

import java.util.List;

public class Ccategory {
	private Integer ccid;
	private String levels;
	private String ccname;
	private String description;
	private Integer parentid;
	private String cafree;
	private List<Ccategory> ccategory;
	public Ccategory() {
	}

	public Ccategory(Integer ccid, String levels, String ccname, String description, Integer parentid, String cafree,
			List<Ccategory> ccategory) {
		super();
		this.ccid = ccid;
		this.levels = levels;
		this.ccname = ccname;
		this.description = description;
		this.parentid = parentid;
		this.cafree = cafree;
		this.ccategory = ccategory;
	}

	public Integer getCcid() {
		return ccid;
	}
	public void setCcid(Integer ccid) {
		this.ccid = ccid;
	}
	public String getLevels() {
		return levels;
	}
	public void setLevels(String levels) {
		this.levels = levels;
	}
	public String getCcname() {
		return ccname;
	}
	public void setCcname(String ccname) {
		this.ccname = ccname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public String getCafree() {
		return cafree;
	}
	public void setCafree(String cafree) {
		this.cafree = cafree;
	}

	public List<Ccategory> getCcategory() {
		return ccategory;
	}

	public void setCcategory(List<Ccategory> ccategory) {
		this.ccategory = ccategory;
	}

	@Override
	public String toString() {
		return "Ccategory [ccid=" + ccid + ", levels=" + levels + ", ccname=" + ccname + ", description=" + description
				+ ", parentid=" + parentid + ", cafree=" + cafree + ", ccategory=" + ccategory + "\n]";
	}


	
}
