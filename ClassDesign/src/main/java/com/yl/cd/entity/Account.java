package com.yl.cd.entity;

public class Account {
	private Integer aid;
	private Integer cuaid;
	private String applyno;
	private String money;
	private String datetime;
	private String income;
	private String outcome;

	public Account() {
	}

	public Account(Integer aid, Integer cuaid, String applyno, String money, String datetime, String income,
			String outcome) {
		super();
		this.aid = aid;
		this.cuaid = cuaid;
		this.applyno = applyno;
		this.money = money;
		this.datetime = datetime;
		this.income = income;
		this.outcome = outcome;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getCuaid() {
		return cuaid;
	}

	public void setCuaid(Integer cuaid) {
		this.cuaid = cuaid;
	}

	public String getApplyno() {
		return applyno;
	}

	public void setApplyno(String applyno) {
		this.applyno = applyno;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getOutcome() {
		return outcome;
	}

	public void setOutcome(String outcome) {
		this.outcome = outcome;
	}

	@Override
	public String toString() {
		return "Account [aid=" + aid + ", cuaid=" + cuaid + ", applyno=" + applyno + ", money=" + money + ", datetime="
				+ datetime + ", income=" + income + ", outcome=" + outcome + "]";
	}
	
	
	
}
