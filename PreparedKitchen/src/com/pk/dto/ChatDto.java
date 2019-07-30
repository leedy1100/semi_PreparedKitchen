package com.pk.dto;

public class ChatDto {
	
	private int room;
	private String has_admin;
	private String has_user;
	
	public ChatDto() {}

	public ChatDto(int room, String has_admin, String has_user) {
		this.room = room;
		this.has_admin = has_admin;
		this.has_user = has_user;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getHas_admin() {
		return has_admin;
	}

	public void setHas_admin(String has_admin) {
		this.has_admin = has_admin;
	}

	public String getHas_user() {
		return has_user;
	}

	public void setHas_user(String has_user) {
		this.has_user = has_user;
	}

	
}
