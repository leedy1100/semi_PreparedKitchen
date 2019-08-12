package com.pk.dto;



public class CalDto {
	
	private int payment_no;
	private String payment_group;
	private String id;
	private int recipe_no;
	private String recipe_date;
	private String recipe_name;
	
	
	public CalDto() {
		
	}
	
	


	public CalDto(int payment_no, String payment_group, String id, int recipe_no, String recipe_date,
			String recipe_name) {
	
		this.payment_no = payment_no;
		this.payment_group = payment_group;
		this.id = id;
		this.recipe_no = recipe_no;
		this.recipe_date = recipe_date;
		this.recipe_name = recipe_name;
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


	public String getRecipe_date() {
		return recipe_date;
	}


	public void setRecipe_date(String recipe_date) {
		this.recipe_date = recipe_date;
	}


	public String getRecipe_name() {
		return recipe_name;
	}


	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}


	

}
