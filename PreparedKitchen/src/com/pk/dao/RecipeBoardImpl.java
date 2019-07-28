package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.pk.dao.SqlMapConfig;
import com.pk.dto.LikeDto;
import com.pk.dto.RecipeBoardDto;

public class RecipeBoardImpl extends SqlMapConfig implements BoardDao {

	private String namespace = "com.pk.db.mapper.";
	int noOfRecords;

	@Override
	public List<RecipeBoardDto> selectList(int offset, int noOfRecords) {
		
		SqlSession session = null;
		List<RecipeBoardDto> list = new ArrayList<RecipeBoardDto>();

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);

		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "selectList", params);
		this.noOfRecords = session.selectOne(namespace + "totalCountList");

		session.close();

		return list;
	}

	@Override
	public List<RecipeBoardDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue) {

		SqlSession session = null;
		List<RecipeBoardDto> list = new ArrayList<RecipeBoardDto>();

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);
		params.put("searchFiled", searchFiled);
		params.put("searchValue", searchValue);

		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "selectList", params);
		this.noOfRecords = session.selectOne(namespace + "fileCount", params);

		session.close();

		return list;
	}

	@Override
	public int getNoOfRecords() {

		return noOfRecords;
	}

	@Override
	public RecipeBoardDto selectOne(int no) {

		SqlSession session = null;
		RecipeBoardDto dto = new RecipeBoardDto();

		session = getSqlSessionFactory().openSession(true);
		dto = session.selectOne(namespace + "selectOne", no);

		session.close();

		return dto;
	}

	@Override
	public int insert(RecipeBoardDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		
		return res;
	}

	@Override
	public int update(RecipeBoardDto dto) {

		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		
		return res;
	}

	@Override
	public int delete(int no) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "delete", no);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		
		return res;
	}

	@Override
	public int hits(int no) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "hits", no);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		
		return res;
	}

	@Override
	public int like(int no, String id) {
		
		SqlSession session = null;
		int res = 0;
		
		HashMap<String, Object> userlike = new HashMap<String, Object>();
		userlike.put("recipeboard_no", no);
		userlike.put("likeid", id);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "recipelike", userlike);
			res += session.insert(namespace + "insertlike", userlike);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		
		return res;
	}

	@Override
	public int deleteLike(int no, String id) {
		
		SqlSession session = null;
		int res = 0;
		
		HashMap<String, Object> deletelike = new HashMap<String, Object>();
		deletelike.put("recipeboard_no", no);
		deletelike.put("likeid", id);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "recipelike_cancel", deletelike);
			res += session.insert(namespace + "insertlike_cancel", deletelike);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		
		return res;
	}

	@Override
	public LikeDto selectLikeOne(int no, String id) {
		
		SqlSession session = null;
		LikeDto likedto = new LikeDto();
		HashMap<String, Object> likeList = new HashMap<String, Object>();
		
		likeList.put("recipeboard_no", no);
		likeList.put("likeid", id);
		
		session = getSqlSessionFactory().openSession(true);
		likedto = session.selectOne(namespace + "selectOneLikeList", likeList);

		session.close();

		return likedto;
	}

}
