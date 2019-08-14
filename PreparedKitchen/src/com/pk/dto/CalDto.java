package com.pk.dto;



public class CalDto {
	
	private int calendar_no;
	private String payment_group;
	private String recipe_date;
	private String recipe_name;
	private int recipe_no;
	private String id;
	
	
	
	
	public CalDto() {
		
	}


	public CalDto(int calendar_no, String payment_group, String recipe_date, String recipe_name, int recipe_no,
			String id) {
		
		this.calendar_no = calendar_no;
		this.payment_group = payment_group;
		this.recipe_date = recipe_date;
		this.recipe_name = recipe_name;
		this.recipe_no = recipe_no;
		this.id = id;
	}


	public int getCalendar_no() {
		return calendar_no;
	}


	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}


	public String getPayment_group() {
		return payment_group;
	}


	public void setPayment_group(String payment_group) {
		this.payment_group = payment_group;
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


	public int getRecipe_no() {
		return recipe_no;
	}


	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	
	

}
