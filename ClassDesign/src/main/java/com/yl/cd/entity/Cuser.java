package com.yl.cd.entity;

public class Cuser {
	private Integer cuid;
	private String cusername;
	private String cpassword;
	private String cemail;
	private String csex;
	private String cphone;
	private String clastloginip;
	private String cphoto;
	private String applynum;
	private String clikebook;
	private String cbirthday;
	private String cufree;
	private Account account;
	public Cuser() {
	}
	
	public Cuser(String cusername, String cpassword) {
		super();
		this.cusername = cusername;
		this.cpassword = cpassword;
	}

	public Cuser(Integer cuid, String cusername, String cpassword, String cemail, String csex, String cphone,
			String clastloginip, String cphoto, String applynum, String clikebook, String cbirthday, String cufree,
			Account account) {
		super();
		this.cuid = cuid;
		this.cusername = cusername;
		this.cpassword = cpassword;
		this.cemail = cemail;
		this.csex = csex;
		this.cphone = cphone;
		this.clastloginip = clastloginip;
		this.cphoto = cphoto;
		this.applynum = applynum;
		this.clikebook = clikebook;
		this.cbirthday = cbirthday;
		this.cufree = cufree;
		this.account = account;
	}

	public Integer getCuid() {
		return cuid;
	}
	public void setCuid(Integer cuid) {
		this.cuid = cuid;
	}
	public String getCusername() {
		return cusername;
	}
	public void setCusername(String cusername) {
		this.cusername = cusername;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCsex() {
		return csex;
	}
	public void setCsex(String csex) {
		this.csex = csex;
	}
	public String getCphone() {
		return cphone;
	}
	public void setCphone(String cphone) {
		this.cphone = cphone;
	}
	public String getClastloginip() {
		return clastloginip;
	}
	public void setClastloginip(String clastloginip) {
		this.clastloginip = clastloginip;
	}
	public String getCphoto() {
		return cphoto;
	}
	public void setCphoto(String cphoto) {
		this.cphoto = cphoto;
	}
	public String getApplynum() {
		return applynum;
	}
	public void setApplynum(String applynum) {
		this.applynum = applynum;
	}
	public String getClikebook() {
		return clikebook;
	}
	public void setClikebook(String clikebook) {
		this.clikebook = clikebook;
	}
	public String getCbirthday() {
		return cbirthday;
	}
	public void setCbirthday(String cbirthday) {
		this.cbirthday = cbirthday;
	}
	public String getCufree() {
		return cufree;
	}
	public void setCufree(String cufree) {
		this.cufree = cufree;
	}
	
	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "Cuser [cuid=" + cuid + ", cusername=" + cusername + ", cpassword=" + cpassword + ", cemail=" + cemail
				+ ", csex=" + csex + ", cphone=" + cphone + ", clastloginip=" + clastloginip + ", cphoto=" + cphoto
				+ ", applynum=" + applynum + ", clikebook=" + clikebook + ", cbirthday=" + cbirthday + ", cufree="
				+ cufree + ", account=" + account + "]";
	}

	
	
}
