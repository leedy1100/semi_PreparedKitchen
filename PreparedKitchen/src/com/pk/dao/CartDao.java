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
	
	public int isnertCart(List<CartDto> list) {
		
		SqlSession session = null;
		int res = 0;
		int cartno = 0;
		Map<String, List<CartDto>> map = new HashMap<String, List<CartDto>>();
		
		try {
			

			for(CartDto dto : list) {
				
				session = getSqlSessionFactory().openSession(false);
				cartno = session.selectOne(namespace + "seqNextval");
				dto.setCart_no(cartno);
			}
			
			map.put("lists", list);
			
			res = session.insert(namespace + "addCart", map);
			
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
	
	public int deleteCart(String id, int[] recipenos) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("recipenos", recipenos);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "deleteCart", map);
			
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
	
	public int deleteCart_martno(String id, int[] martnos) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("martnos", martnos);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "deleteCart_martno", map);
			
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
