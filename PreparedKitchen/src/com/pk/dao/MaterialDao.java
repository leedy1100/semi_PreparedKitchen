package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.MaterialDto;

public class MaterialDao extends SqlMapConfig{
	
	private String namespace = "meterialmapper.";
	
	public List<MaterialDto> selectList(){
		
		SqlSession session = null;
		List<MaterialDto> list = new ArrayList<MaterialDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int insert(List<MaterialDto> list) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, List<MaterialDto>> map = new HashMap<String, List<MaterialDto>>();
		map.put("lists", list);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insertDummy", map);
			
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
	
	public List<MaterialDto> materialInRecipe(int recipe_no){
		
		SqlSession session = null;
		List<MaterialDto> list = new ArrayList<MaterialDto>();
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"materialInRecipe", recipe_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
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
