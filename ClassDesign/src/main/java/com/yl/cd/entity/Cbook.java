package com.yl.cd.entity;

public class Cbook {
	private Integer cbid;
	private Integer cbcpid;
	private String cauthor;
	private String cimage;
	private String cisbn;
	private String cpublishing;
	private String cpublishtime;
	private String cwordnumber;
	private String ctotalpage;
	private String cintroduce;
	private String catalogue;
	private String edition;
	private String cbfree;
	private String bookname;
	public Cbook() {
	}
	


	public Cbook(Integer cbid, Integer cbcpid, String cauthor, String cimage, String cisbn, String cpublishing,
			String cpublishtime, String cwordnumber, String ctotalpage, String cintroduce, String catalogue,
			String edition, String cbfree, String bookname) {
		super();
		this.cbid = cbid;
		this.cbcpid = cbcpid;
		this.cauthor = cauthor;
		this.cimage = cimage;
		this.cisbn = cisbn;
		this.cpublishing = cpublishing;
		this.cpublishtime = cpublishtime;
		this.cwordnumber = cwordnumber;
		this.ctotalpage = ctotalpage;
		this.cintroduce = cintroduce;
		this.catalogue = catalogue;
		this.edition = edition;
		this.cbfree = cbfree;
		this.bookname = bookname;
	}



	public String getBookname() {
		return bookname;
	}



	public void setBookname(String bookname) {
		this.bookname = bookname;
	}



	public Integer getCbid() {
		return cbid;
	}
	public void setCbid(Integer cbid) {
		this.cbid = cbid;
	}
	public Integer getCbcpid() {
		return cbcpid;
	}
	public void setCbcpid(Integer cbcpid) {
		this.cbcpid = cbcpid;
	}
	public String getCauthor() {
		return cauthor;
	}
	public void setCauthor(String cauthor) {
		this.cauthor = cauthor;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCisbn() {
		return cisbn;
	}
	public void setCisbn(String cisbn) {
		this.cisbn = cisbn;
	}
	public String getCpublishing() {
		return cpublishing;
	}
	public void setCpublishing(String cpublishing) {
		this.cpublishing = cpublishing;
	}
	public String getCpublishtime() {
		return cpublishtime;
	}
	public void setCpublishtime(String cpublishtime) {
		this.cpublishtime = cpublishtime;
	}
	public String getCwordnumber() {
		return cwordnumber;
	}
	public void setCwordnumber(String cwordnumber) {
		this.cwordnumber = cwordnumber;
	}
	public String getCtotalpage() {
		return ctotalpage;
	}
	public void setCtotalpage(String ctotalpage) {
		this.ctotalpage = ctotalpage;
	}
	public String getCintroduce() {
		return cintroduce;
	}
	public void setCintroduce(String cintroduce) {
		this.cintroduce = cintroduce;
	}
	public String getCatalogue() {
		return catalogue;
	}
	public void setCatalogue(String catalogue) {
		this.catalogue = catalogue;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public String getCbfree() {
		return cbfree;
	}
	public void setCbfree(String cbfree) {
		this.cbfree = cbfree;
	}



	@Override
	public String toString() {
		return "Cbook [cbid=" + cbid + ", cbcpid=" + cbcpid + ", cauthor=" + cauthor + ", cimage=" + cimage + ", cisbn="
				+ cisbn + ", cpublishing=" + cpublishing + ", cpublishtime=" + cpublishtime + ", cwordnumber="
				+ cwordnumber + ", ctotalpage=" + ctotalpage + ", cintroduce=" + cintroduce + ", catalogue=" + catalogue
				+ ", edition=" + edition + ", cbfree=" + cbfree + ", bookname=" + bookname + "]";
	}

	
}
