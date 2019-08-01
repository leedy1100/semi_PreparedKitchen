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
	
	public MemberDto login(String id, String pw) {
		
		return memberDao.login(id, pw); 
	}
	
	public MemberDto emailchk(String email) {
		
		return memberDao.emailchk(email);
	}
	
	public int kakaoLogin(String id, String name) {
		
		return memberDao.kakaoLogin(id, name);
	}
	
	public int updateinfo(MemberDto dto) {
		
		return memberDao.updateinfo(dto);
	}

}
