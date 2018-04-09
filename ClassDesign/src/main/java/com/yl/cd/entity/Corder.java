package com.yl.cd.entity;

public class Corder {
	private Integer coid;
	private Integer cordid;
	private String cstatus;
	private String cordertime;
	private String corderdesc;
	private String ctotalprice;
	private String cordername;
	private String cfulladdress;
	private String cpostalcode;
	private String cphone;
	private String cofree;
	private Cuser cuser;
	public Corder() {
	}
	
	public Corder(Integer coid, Integer cordid, String cstatus, String cordertime, String corderdesc,
			String ctotalprice, String cordername, String cfulladdress, String cpostalcode, String cphone,
			String cofree, Cuser cuser) {
		super();
		this.coid = coid;
		this.cordid = cordid;
		this.cstatus = cstatus;
		this.cordertime = cordertime;
		this.corderdesc = corderdesc;
		this.ctotalprice = ctotalprice;
		this.cordername = cordername;
		this.cfulladdress = cfulladdress;
		this.cpostalcode = cpostalcode;
		this.cphone = cphone;
		this.cofree = cofree;
		this.cuser = cuser;
	}

	public Integer getCoid() {
		return coid;
	}
	public void setCoid(Integer coid) {
		this.coid = coid;
	}
	public Integer getCordid() {
		return cordid;
	}
	public void setCordid(Integer cordid) {
		this.cordid = cordid;
	}
	public String getCstatus() {
		return cstatus;
	}
	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}
	public String getCordertime() {
		return cordertime;
	}
	public void setCordertime(String cordertime) {
		this.cordertime = cordertime;
	}
	public String getCorderdesc() {
		return corderdesc;
	}
	public void setCorderdesc(String corderdesc) {
		this.corderdesc = corderdesc;
	}
	public String getCtotalprice() {
		return ctotalprice;
	}
	public void setCtotalprice(String ctotalprice) {
		this.ctotalprice = ctotalprice;
	}
	public String getCordername() {
		return cordername;
	}
	public void setCordername(String cordername) {
		this.cordername = cordername;
	}
	public String getCfulladdress() {
		return cfulladdress;
	}
	public void setCfulladdress(String cfulladdress) {
		this.cfulladdress = cfulladdress;
	}
	public String getCpostalcode() {
		return cpostalcode;
	}
	public void setCpostalcode(String cpostalcode) {
		this.cpostalcode = cpostalcode;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getCofree() {
		return cofree;
	}
	public void setCofree(String cofree) {
		this.cofree = cofree;
	}

	public Cuser getCuser() {
		return cuser;
	}

	public void setCuser(Cuser cuser) {
		this.cuser = cuser;
	}

	@Override
	public String toString() {
		return "Corder [coid=" + coid + ", cordid=" + cordid + ", cstatus=" + cstatus + ", cordertime=" + cordertime
				+ ", corderdesc=" + corderdesc + ", ctotalprice=" + ctotalprice + ", cordername=" + cordername
				+ ", cfulladdress=" + cfulladdress + ", cpostalcode=" + cpostalcode + ", cphone=" + cphone + ", cofree="
				+ cofree + ", cuser=" + cuser + "]";
	}

	
}
