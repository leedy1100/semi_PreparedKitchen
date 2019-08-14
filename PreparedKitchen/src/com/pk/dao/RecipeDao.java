package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.RecipeDto;

public class RecipeDao extends SqlMapConfig {

	String namespace = "recipemapper.";
	int noOfRecords;

	public List<RecipeDto> selectList() {

		SqlSession session = null;
		List<RecipeDto> list = new ArrayList<RecipeDto>();

		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}
	
	public List<RecipeDto> selectListOne(List<Integer> list, String id) {
		List<RecipeDto> res = new ArrayList<RecipeDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.selectList(namespace + "selectListOne", list);
			this.noOfRecords = session.selectOne(namespace + "totalCountList", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public int insert(List<RecipeDto> list) {

		SqlSession session = null;
		int res = 0;
		Map<String, List<RecipeDto>> map = new HashMap<String, List<RecipeDto>>();
		map.put("lists", list);

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "dummyInsert", map);

			if (res > 0) {
				session.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
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
			res = session.update(namespace + "dummyUpdate", map);

			if (res == -1) {
				session.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public RecipeDto selectOne(int recipe_no) {

		SqlSession session = null;
		RecipeDto dto = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace + "selectOne", recipe_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}

	public List<RecipeDto> recipeList(String category, String recipe_reg, int offset, int noOfRecords) {

		SqlSession session = null;
		List<RecipeDto> list = new ArrayList<RecipeDto>();
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("category", category);
		hm.put("offset", offset);
		hm.put("noOfRecords", offset + noOfRecords);
		hm.put("recipe_reg", recipe_reg);
		
		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "recipeList", hm);
		this.noOfRecords = session.selectOne(namespace + "fileCount", hm);
		session.close();

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

	public int getNoOfRecords() {

		return noOfRecords;
	}
	

}