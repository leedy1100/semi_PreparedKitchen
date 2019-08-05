package com.pk.dto;

import java.util.Date;

public class PaymentDto {

	private int payment_no;				// 주문 번호
	private String payment_group;		
	private String id;
	private String item_name;
	private String item_code;
	private String payment_price;
	private int recipe_no;
	private int material_no;
	private String payment_date;
	private String shipping_addr;
	
	public PaymentDto() {}

	public PaymentDto(int payment_no, String payment_group, String id, String item_name, String item_code,
			String payment_price, int recipe_no, int material_no, String payment_date, String shipping_addr) {
		this.payment_no = payment_no;
		this.payment_group = payment_group;
		this.id = id;
		this.item_name = item_name;
		this.item_code = item_code;
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

	public String getPayment_group() {
		return payment_group;
	}

	public void setPayment_group(String payment_group) {
		this.payment_group = payment_group;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
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

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getShipping_addr() {
		return shipping_addr;
	}

	public void setShipping_addr(String shipping_addr) {
		this.shipping_addr = shipping_addr;
	}


}