package com.dto.caldto;

import java.util.Date;

public class Caldto {
	
	private String title;
	private Date paymentdate;
	private String materialname;
	private String id;
	
	
	public Caldto() {
		
	}


	public Caldto(String title, Date paymentdate, String materialname, String id) {
		
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


	public Date getPaymentdate() {
		return paymentdate;
	}


	public void setPaymentdate(Date paymentdate) {
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
