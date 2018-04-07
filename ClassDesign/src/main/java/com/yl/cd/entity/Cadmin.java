package com.yl.cd.entity;

public class Cadmin {
	private Integer caid;
	private String caname;
	private String capwd;
	private String cpower;
	
	public Cadmin() {
	}

	public Cadmin(Integer caid, String caname, String capwd, String cpower) {
		super();
		this.caid = caid;
		this.caname = caname;
		this.capwd = capwd;
		this.cpower = cpower;
	}

	public Integer getCaid() {
		return caid;
	}

	public void setCaid(Integer caid) {
		this.caid = caid;
	}

	public String getCaname() {
		return caname;
	}

	public void setCaname(String caname) {
		this.caname = caname;
	}

	public String getCapwd() {
		return capwd;
	}

	public void setCapwd(String capwd) {
		this.capwd = capwd;
	}

	public String getCpower() {
		return cpower;
	}

	public void setCpower(String cpower) {
		this.cpower = cpower;
	}

	@Override
	public String toString() {
		return "Cadmin [caid=" + caid + ", caname=" + caname + ", capwd=" + capwd + ", cpower=" + cpower + "]";
	}
	
	
}
