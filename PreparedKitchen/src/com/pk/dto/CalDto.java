package com.pk.dto;

import java.util.Date;

public class CalDto {
	
	private String title;
	private String paymentdate;
	private String materialname;
	private String id;
	
	
	public CalDto() {
		
	}


	public CalDto(String title, String paymentdate, String materialname, String id) {
		
		this.title = title;
		this.paymentdate = paymentdate;
		this.materialname = materialname;
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPaymentdate() {
		return paymentdate;
	}


	public void setPaymentdate(String paymentdate) {
		this.paymentdate = paymentdate;
	}


	public String getMaterialname() {
		return materialname;
	}


	public void setMaterialname(String materialname) {
		this.materialname = materialname;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	
	
	
	
	

}
