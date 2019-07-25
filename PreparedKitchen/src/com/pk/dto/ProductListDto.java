package com.pk.dto;

public class ProductListDto {

	private int productList_no;
	private int recipe_no;
	private String recipe_name;
	private String recipe_img;
	private int sales_count;
	private int view_no;
	
	public ProductListDto() {}
	
	public ProductListDto(int productList_no, int recipe_no, String recipe_name, String recipe_img, int sales_count,
			int view_no) {
		this.productList_no = productList_no;
		this.recipe_no = recipe_no;
		this.recipe_name = recipe_name;
		this.recipe_img = recipe_img;
		this.sales_count = sales_count;
		this.view_no = view_no;
	}

	public int getProductList_no() {
		return productList_no;
	}

	public void setProductList_no(int productList_no) {
		this.productList_no = productList_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public String getRecipe_img() {
		return recipe_img;
	}

	public void setRecipe_img(String recipe_img) {
		this.recipe_img = recipe_img;
	}

	public int getSales_count() {
		return sales_count;
	}

	public void setSales_count(int sales_count) {
		this.sales_count = sales_count;
	}

	public int getView_no() {
		return view_no;
	}

	public void setView_no(int view_no) {
		this.view_no = view_no;
	}
	
	
}
