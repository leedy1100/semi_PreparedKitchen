package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.RecipeDto;

public class RecipeDao extends SqlMapConfig{
	
	String namespace = "recipemapper.";
	
	public List<RecipeDto> selectList(){
		
		SqlSession session = null;
		List<RecipeDto> list = new ArrayList<RecipeDto>();
		
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
	
	public int insert(List<RecipeDto> list) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, List<RecipeDto>> map = new HashMap<String, List<RecipeDto>>();
		map.put("lists", list);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"dummyInsert", map);
			
			if(res > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int update(List<RecipeDto> list) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, List<RecipeDto>> map = new HashMap<String, List<RecipeDto>>();
		map.put("lists", list);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"dummyUpdate", map);
			
			if(res == -1) {
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