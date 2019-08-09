package com.pk.dto;



public class CalDto {
	
	private int payment_no;
	private String payment_group;
	private String id;
	private int recipe_no;
	private String payment_date;
	private String recipe_name;
	
	
	public CalDto() {
		
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


	public int getRecipe_no() {
		return recipe_no;
	}


	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}


	public String getPayment_date() {
		return payment_date;
	}


	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}


	public String getRecipe_name() {
		return recipe_name;
	}


	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}


	

}
