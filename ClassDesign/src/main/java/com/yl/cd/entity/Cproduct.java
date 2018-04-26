package com.yl.cd.entity;

public class Cproduct {
	private Integer cpid;
	private Integer spcaid;
	private Integer cbcpid;
	private String cproductname;
	private String cdescription;
	private String caddtime;
	private String cnormalprice;
	private String cwsscprice;
	private String ckeywords;
	private String cimage;
	private String cpfree;
	private Ccategory ccategory;
	private Cbook cbook;
	public Cproduct() {
	}

	

	public Cproduct(Integer cpid, Integer spcaid, Integer cbcpid, String cproductname, String cdescription,
			String caddtime, String cnormalprice, String cwsscprice, String ckeywords, String cimage, String cpfree,
			Ccategory ccategory, Cbook cbook) {
		super();
		this.cpid = cpid;
		this.spcaid = spcaid;
		this.cbcpid = cbcpid;
		this.cproductname = cproductname;
		this.cdescription = cdescription;
		this.caddtime = caddtime;
		this.cnormalprice = cnormalprice;
		this.cwsscprice = cwsscprice;
		this.ckeywords = ckeywords;
		this.cimage = cimage;
		this.cpfree = cpfree;
		this.ccategory = ccategory;
		this.cbook = cbook;
	}



	public Integer getCpid() {
		return cpid;
	}
	public void setCpid(Integer cpid) {
		this.cpid = cpid;
	}
	public Integer getSpcaid() {
		return spcaid;
	}
	public void setSpcaid(Integer spcaid) {
		this.spcaid = spcaid;
	}
	public String getCproductname() {
		return cproductname;
	}
	public void setCproductname(String cproductname) {
		this.cproductname = cproductname;
	}
	public String getCdescription() {
		return cdescription;
	}
	public void setCdescription(String cdescription) {
		this.cdescription = cdescription;
	}
	public String getCaddtime() {
		return caddtime;
	}
	public void setCaddtime(String caddtime) {
		this.caddtime = caddtime;
	}
	public String getCnormalprice() {
		return cnormalprice;
	}
	public void setCnormalprice(String cnormalprice) {
		this.cnormalprice = cnormalprice;
	}
	public String getCwsscprice() {
		return cwsscprice;
	}
	public void setCwsscprice(String cwsscprice) {
		this.cwsscprice = cwsscprice;
	}
	public String getCkeywords() {
		return ckeywords;
	}
	public void setCkeywords(String ckeywords) {
		this.ckeywords = ckeywords;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCpfree() {
		return cpfree;
	}
	public void setCpfree(String cpfree) {
		this.cpfree = cpfree;
	}

	public Ccategory getCcategory() {
		return ccategory;
	}

	public void setCcategory(Ccategory ccategory) {
		this.ccategory = ccategory;
	}

	public Cbook getCbook() {
		return cbook;
	}

	public void setCbook(Cbook cbook) {
		this.cbook = cbook;
	}



	public Integer getCbcpid() {
		return cbcpid;
	}



	public void setCbcpid(Integer cbcpid) {
		this.cbcpid = cbcpid;
	}



	@Override
	public String toString() {
		return "Cproduct [cpid=" + cpid + ", spcaid=" + spcaid + ", cbcpid=" + cbcpid + ", cproductname=" + cproductname
				+ ", cdescription=" + cdescription + ", caddtime=" + caddtime + ", cnormalprice=" + cnormalprice
				+ ", cwsscprice=" + cwsscprice + ", ckeywords=" + ckeywords + ", cimage=" + cimage + ", cpfree="
				+ cpfree + ", ccategory=" + ccategory + ", cbook=" + cbook + "]";
	}

	
}
