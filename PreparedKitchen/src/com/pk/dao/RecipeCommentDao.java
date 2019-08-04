package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.pk.dto.RecipeCommentDto;

public class RecipeCommentDao extends SqlMapConfig {

	private String namespace = "commentmapper.";
	int noOfRecords;
	
	public int getNoOfRecords() {

		return noOfRecords;
	}
	
	public JSONArray selectListCmt(int no, int offset, int noOfRecords) {

		SqlSession session = null;
		List<RecipeCommentDto> list = new ArrayList<RecipeCommentDto>();
		HashMap<String, Object> recipeno = new HashMap<String, Object>();
		recipeno.put("recipeboard_no", no);
		recipeno.put("offset", offset);
		recipeno.put("noOfRecords", offset + noOfRecords);

		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "selectListCmt", recipeno);
		this.noOfRecords = session.selectOne(namespace + "countCmt",recipeno);
		
		HashMap<String, Object> hm = null;
		JSONArray jArr = new JSONArray();

		for (int i = 0; i < list.size(); i++) {
			hm = new HashMap<String, Object>();
			hm.put("comment_no", list.get(i).getComment_no());
			hm.put("recipeBoard_no", list.get(i).getRecipeBoard_no());
			hm.put("id", list.get(i).getId());
			hm.put("comment_content", list.get(i).getComment_content());
			hm.put("comment_regdate", list.get(i).getComment_regdate());
			hm.put("comment_groupno", list.get(i).getComment_groupno());
			hm.put("comment_order", list.get(i).getComment_order());
			hm.put("comment_tab", list.get(i).getComment_tab());

			jArr.add(hm);
		}
	

		session.close();

		return jArr;
	}

	public RecipeCommentDto selectOneCmt(int no) {

		SqlSession session = null;
		RecipeCommentDto dto = new RecipeCommentDto();

		session = getSqlSessionFactory().openSession(true);
		dto = session.selectOne(namespace + "selectOneCmt", no);

		session.close();

		return dto;

	}

	public int insertCmt(RecipeCommentDto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "insertCmt", dto);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		return res;
	}

	public int updateCmt(RecipeCommentDto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "updateCmt", dto);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}

		return res;
	}

	public int deleteCmt(int no) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "deleteCmt", no);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}

		return res;
	}

	public int updateGroupNO(int no) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "updateGroupNO", no);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}

		return res;
	}

	public int insertCmtCmt(RecipeCommentDto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "insertCmtCmt", dto);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}

		return res;
	}

}
