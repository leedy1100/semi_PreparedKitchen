package com.pk.dto;

public class LikeDto {

	private int liketable_no;
	private String id;
	private int recipeboard_no;

	public LikeDto() {
		super();
	}

	public LikeDto(int liketable_no, String id, int recipeboard_no) {
		super();
		this.liketable_no = liketable_no;
		this.id = id;
		this.recipeboard_no = recipeboard_no;
	}

	public int getLiketable_no() {
		return liketable_no;
	}

	public void setLiketable_no(int liketable_no) {
		this.liketable_no = liketable_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRecipeboard_no() {
		return recipeboard_no;
	}

	public void setRecipeboard_no(int recipeboard_no) {
		this.recipeboard_no = recipeboard_no;
	}

}
