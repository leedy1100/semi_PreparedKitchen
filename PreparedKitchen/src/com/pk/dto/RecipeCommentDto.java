package com.pk.dto;

import java.sql.Date;

public class RecipeCommentDto {

	private int comment_no;
	private int recipeBoard_no;
	private String id;
	private String comment_content;
	private Date comment_regdate;
	private int comment_groupno;
	private int comment_order;
	private int comment_tab;
	
	public RecipeCommentDto() {
		super();
	}

	public RecipeCommentDto(int comment_no, int recipeBoard_no, String id, String comment_content, Date comment_regdate,
			int comment_groupno, int comment_order, int comment_tab) {
		super();
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

	public Date getComment_regdate() {
		return comment_regdate;
	}

	public void setComment_regdate(Date comment_regdate) {
		this.comment_regdate = comment_regdate;
	}

	public int getComment_groupno() {
		return comment_groupno;
	}

	public void setComment_groupno(int comment_groupno) {
		this.comment_groupno = comment_groupno;
	}

	public int getComment_order() {
		return comment_order;
	}

	public void setComment_order(int comment_order) {
		this.comment_order = comment_order;
	}

	public int getComment_tab() {
		return comment_tab;
	}

	public void setComment_tab(int comment_tab) {
		this.comment_tab = comment_tab;
	}
	
}
