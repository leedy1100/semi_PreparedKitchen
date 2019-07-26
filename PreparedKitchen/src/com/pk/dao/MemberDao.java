package com.pk.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.MemberDto;

public class MemberDao extends SqlMapConfig{
	
	private String namespace = "membermapper.";
	
	public List<MemberDto> selectList(){
		
		SqlSession session = null;
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			session = getSqlsessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public int signup(MemberDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlsessionFactory().openSession(false);
			res = session.insert(namespace+"signup", dto);
			
			if(res > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}
	
	public MemberDto idchk(String id) {
		
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		
		try {
			session = getSqlsessionFactory().openSession(false);
			dto = session.selectOne(namespace+"idchk", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}

}
