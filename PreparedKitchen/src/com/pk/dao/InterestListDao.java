package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.InterestListDto;

public class InterestListDao extends SqlMapConfig {

	private String namespace = "interestmapper.";

	public List<InterestListDto> selectList(String id) {
		List<InterestListDto> list = new ArrayList<InterestListDto>();
		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList(namespace + "selectList", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	public int insertInterestRecipe(InterestListDto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "insertInterestRecipe", dto);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}

		return res;
	}

	public int deleteInterestRecipe(String id, int recipe_no) {

		SqlSession session = null;
		int res = 0;
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("id", id);
		hm.put("recipe_no", recipe_no);

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "deleteInterestRecipe", hm);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		return res;
	}

	public InterestListDto selectOneInterestRecipe(String id, int recipe_no) {

		SqlSession session = null;
		InterestListDto dto = null;
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("id", id);
		hm.put("recipe_no", recipe_no);
		
		session = getSqlSessionFactory().openSession(true);
		dto = session.selectOne(namespace + "selectOneInterestRecipe", hm);

		return dto;
	}

}
