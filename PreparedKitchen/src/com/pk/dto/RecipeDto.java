package com.pk.dto;

public class RecipeDto {
	
	private int recipe_no;
	private String recipe_name;
	private String recipe_img;
	private String recipe_content;
	private String recipe_nutrient;
	private String recipe_category;
	private String recipe_reg;
	
	public RecipeDto() {
		
	}

	public RecipeDto(int recipe_no, String recipe_name, String recipe_img, String recipe_content,
			String recipe_nutrient, String recipe_category, String recipe_reg) {
		super();
		this.recipe_no = recipe_no;
		this.recipe_name = recipe_name;
		this.recipe_img = recipe_img;
		this.recipe_content = recipe_content;
		this.recipe_nutrient = recipe_nutrient;
		this.recipe_category = recipe_category;
		this.recipe_reg = recipe_reg;
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

	public String getRecipe_content() {
		return recipe_content;
	}

	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}

	public String getRecipe_nutrient() {
		return recipe_nutrient;
	}

	public void setRecipe_nutrient(String recipe_nutrient) {
		this.recipe_nutrient = recipe_nutrient;
	}

	public String getRecipe_category() {
		return recipe_category;
	}

	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}

	public String getRecipe_reg() {
		return recipe_reg;
	}

	public void setRecipe_reg(String recipe_reg) {
		this.recipe_reg = recipe_reg;
	}


	
}	