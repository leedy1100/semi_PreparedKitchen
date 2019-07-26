package com.pk.biz;

import java.util.List;

import com.pk.dao.MemberDao;
import com.pk.dto.MemberDto;

public class MemberBiz {
	
	MemberDao memberDao = new MemberDao();
	
	public List<MemberDto> selectList(){
		
		return memberDao.selectList();
	}
	
	public int signup(MemberDto dto) {
		
		return memberDao.signup(dto);
	}
	
	public MemberDto idchk(String id) {
		
		return memberDao.idchk(id);
	}

}
