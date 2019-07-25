package com.pk.dto;

import java.util.Date;

public class PaymentDto {

	private int payment_no;
	private int payment_groupno;
	private String id;
	private String payment_price;
	private int recipe_no;
	private int material_no;
	private Date payment_date;
	private String shipping_addr;
	
	public PaymentDto() {}

	public PaymentDto(int payment_no, int payment_groupno, String id, String payment_price, int recipe_no,
			int material_no, Date payment_date, String shipping_addr) {
		this.payment_no = payment_no;
		this.payment_groupno = payment_groupno;
		this.id = id;
		this.payment_price = payment_price;
		this.recipe_no = recipe_no;
		this.material_no = material_no;
		this.payment_date = payment_date;
		this.shipping_addr = shipping_addr;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public int getPayment_groupno() {
		return payment_groupno;
	}

	public void setPayment_groupno(int payment_groupno) {
		this.payment_groupno = payment_groupno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public int getMaterial_no() {
		return material_no;
	}

	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getShipping_addr() {
		return shipping_addr;
	}

	public void setShipping_addr(String shipping_addr) {
		this.shipping_addr = shipping_addr;
	}
	
}
