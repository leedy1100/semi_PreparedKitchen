package com.pk.dto;

public class CartDto {

	private int cart_no;
	private String id;
	private int recipe_no;
	private int material_no;
	
	public CartDto() {}

	public CartDto(int cart_no, String id, int recipe_no, int material_no) {
		this.cart_no = cart_no;
		this.id = id;
		this.recipe_no = recipe_no;
		this.material_no = material_no;
	}
	

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
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

	public int getMaterial_no() {
		return material_no;
	}

	public void setMaterial_no(int material_no) {
		this.material_no = material_no;
	}


}
