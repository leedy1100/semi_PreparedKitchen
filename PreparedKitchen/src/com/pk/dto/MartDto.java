package com.pk.dto;

public class MartDto {
	
	private int mart_no;
	private String item_name;
	private int mart_price;
	private String category;
	
	public MartDto() {
		
	}

	public MartDto(int mart_no, String item_name, int mart_price, String category) {
		super();
		this.mart_no = mart_no;
		this.item_name = item_name;
		this.mart_price = mart_price;
		this.category = category;
	}

	public int getMart_no() {
		return mart_no;
	}

	public void setMart_no(int mart_no) {
		this.mart_no = mart_no;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getMart_price() {
		return mart_price;
	}

	public void setMart_price(int mart_price) {
		this.mart_price = mart_price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}


}
