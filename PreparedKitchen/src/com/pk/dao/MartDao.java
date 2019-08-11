package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pk.dto.InterestListDto;
import com.pk.dto.MartDto;

public class MartDao extends SqlMapConfig{
	
	private String namespace = "martmapper.";
	
	public List<InterestListDto> selectList() {
		
		SqlSession session = null;
		List<InterestListDto> list = new ArrayList<InterestListDto>();
		
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
	
}
