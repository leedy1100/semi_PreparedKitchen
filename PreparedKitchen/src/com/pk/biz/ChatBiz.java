package com.pk.biz;

import com.pk.dao.ChatDao;
import com.pk.dto.ChatDto;

public class ChatBiz {
	
	ChatDao dao = new ChatDao();
	
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
		dao.joinAdmin();
	}
	
	public void outUser() {
		dao.outAdmin();
	}
}
