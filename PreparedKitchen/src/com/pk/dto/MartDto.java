package com.pk.dto;

public class MartDto {
	
	private int mart_no;
	private String material_name;
	private int mart_price;
	private String category;
	
	public MartDto() {
		
	}

	public MartDto(int mart_no, String material_name, int mart_price, String category) {
		super();
		this.mart_no = mart_no;
		this.material_name = material_name;
		this.mart_price = mart_price;
		this.category = category;
	}

	public int getMart_no() {
		return mart_no;
	}

	public void setMart_no(int mart_no) {
		this.mart_no = mart_no;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
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
