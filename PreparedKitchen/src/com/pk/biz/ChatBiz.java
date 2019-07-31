package com.pk.biz;

import com.pk.dao.ChatDao;
import com.pk.dto.ChatDto;

public class ChatBiz {
	
	ChatDao dao = new ChatDao();
	
	public ChatBiz() {}
	
	public ChatDto selectChatDao(int room) {
		return dao.selectChatDto(room);
	}
	
	public void joinAdmin() {
		dao.joinAdmin();
	}
	
	public void outAdmin() {
		dao.outAdmin();
	}
	public void joinUser() {
		dao.joinUser();
	}
	
	public void outUser() {
		dao.outUser();
	}
}
