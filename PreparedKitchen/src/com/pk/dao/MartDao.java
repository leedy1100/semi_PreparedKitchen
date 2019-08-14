package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.MartDto;

public class MartDao extends SqlMapConfig{
	
	private String namespace = "martmapper.";
	
	public List<MartDto> selectList() {
		
		SqlSession session = null;
		List<MartDto> list = new ArrayList<MartDto>();
		
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
	
	public MartDto selectOne(int mart_no) {

		SqlSession session = null;
		MartDto dto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "selectOne", mart_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public int createDummy(List<MartDto> list) {
		
		SqlSession session = null;
		int res = 0;
		int seq = 0;
		Map<String, List<MartDto>> map = new HashMap<String, List<MartDto>>();
		
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			
			for(int i = 0; i < list.size(); i++) {
				
				seq = i+1;
				list.get(i).setMart_no(seq);
				
			}
			
			System.out.println(list.get(300).getMart_no());
			map.put("lists", list);
			res = session.insert(namespace+"createDummy", map);
			
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
	
	public int deleteDummy() {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace+"deleteDummy");
			
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
	
	public List<MartDto> buyProduct(String[] str) {
		
		SqlSession session = null;
		List<MartDto> list = new ArrayList<MartDto>();
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("strs", str);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"buyProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
}
