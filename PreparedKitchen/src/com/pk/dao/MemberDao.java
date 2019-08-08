package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.MemberDto;

public class MemberDao extends SqlMapConfig{
	
	private String namespace = "membermapper.";
	int noOfRecords;
	
	public List<MemberDto> selectList(){
		
		SqlSession session = null;
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
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
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"signUp", dto);
			
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
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"idChk", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public MemberDto login(String id, String pw) {
		
		SqlSession session = null;
		MemberDto loginDto = new MemberDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			loginDto = session.selectOne(namespace+"login", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return loginDto;
	}
	
	public MemberDto emailchk(String email) {
		
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"emailChk", email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}

	public int kakaoLogin(String id, String name) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"kakaoLogin", map);
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
	

	public int updateinfo(MemberDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updateinfo",dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	public MemberDto forgotId(String name, String email) {
		
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"forgotId", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public MemberDto forgotPw(String id, String name, String email) {
		
		SqlSession session = null;
		MemberDto dto = new MemberDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"forgotId", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int updatePw(String id, String pw) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updatePw", map);
			
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

}
