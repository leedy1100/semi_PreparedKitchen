package com.pk.dto;

public class RecipeCommentDto {

	private int comment_no;
	private int recipeBoard_no;
	private String id;
	private String comment_content;
	private String comment_regdate;
	private String comment_groupno;
	private String comment_order;
	private String comment_tab;
	
	public RecipeCommentDto() {}

	public RecipeCommentDto(int comment_no, int recipeBoard_no, String id, String comment_content,
			String comment_regdate, String comment_groupno, String comment_order, String comment_tab) {
		this.comment_no = comment_no;
		this.recipeBoard_no = recipeBoard_no;
		this.id = id;
		this.comment_content = comment_content;
		this.comment_regdate = comment_regdate;
		this.comment_groupno = comment_groupno;
		this.comment_order = comment_order;
		this.comment_tab = comment_tab;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getRecipeBoard_no() {
		return recipeBoard_no;
	}

	public void setRecipeBoard_no(int recipeBoard_no) {
		this.recipeBoard_no = recipeBoard_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_regdate() {
		return comment_regdate;
	}

	public void setComment_regdate(String comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

	public String getComment_groupno() {
		return comment_groupno;
	}

	public void setComment_groupno(String comment_groupno) {
		this.comment_groupno = comment_groupno;
	}

	public String getComment_order() {
		return comment_order;
	}

	public void setComment_order(String comment_order) {
		this.comment_order = comment_order;
	}

	public String getComment_tab() {
		return comment_tab;
	}

	public void setComment_tab(String comment_tab) {
		this.comment_tab = comment_tab;
	}
	
	
}
