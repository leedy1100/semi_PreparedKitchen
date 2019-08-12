package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.CartDto;

public class CartDao extends SqlMapConfig {

	private String namespace = "cartmapper.";
	
	public List<CartDto> selectList(String id, int recipe_no) {
		List<CartDto> list = new ArrayList<CartDto>();
		SqlSession session = null;
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("recipe_no", recipe_no);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	public List<CartDto> selectListRecipe(String id) {
		List<CartDto> list = new ArrayList<CartDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectListRecipe", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

}
