package com.pk.dto;

public class InterestListDto {

	private int interestList_no;
	private String id;
	private int recipe_no;
	
	public InterestListDto() {}

	public InterestListDto(int interestList_no, String id, int recipe_no) {
		this.interestList_no = interestList_no;
		this.id = id;
		this.recipe_no = recipe_no;
	}

	public int getInterestList_no() {
		return interestList_no;
	}

	public void setInterestList_no(int interestList_no) {
		this.interestList_no = interestList_no;
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
	
}
