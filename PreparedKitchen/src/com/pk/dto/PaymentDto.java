package com.pk.dto;

public class PaymentDto {

	private int payment_no;				// 주문 번호
	private String payment_group;		
	private String id;
	private String item_name;
	private int mart_no;
	private int payment_price;
	private String payment_date;
	private String recipe_date;
	private String shipping_addr;
	
	public PaymentDto() {}

	public PaymentDto(int payment_no, String payment_group, String id, String item_name, int mart_no,
			int payment_price, String payment_date, String recipe_date, String shipping_addr) {
		super();
		this.payment_no = payment_no;
		this.payment_group = payment_group;
		this.id = id;
		this.item_name = item_name;
		this.mart_no = mart_no;
		this.payment_price = payment_price;
		this.payment_date = payment_date;
		this.recipe_date = recipe_date;
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

	public int getMart_no() {
		return mart_no;
	}

	public void setMart_no(int mart_no) {
		this.mart_no = mart_no;
	}

	public int getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}

	public String getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}

	public String getRecipe_date() {
		return recipe_date;
	}

	public void setRecipe_date(String recipe_date) {
		this.recipe_date = recipe_date;
	}

	public String getShipping_addr() {
		return shipping_addr;
	}

	public void setShipping_addr(String shipping_addr) {
		this.shipping_addr = shipping_addr;
	}



}