package com.pk.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.RecipeCommentDto;

public class RecipeCommentDao extends SqlMapConfig {

	private String namespace = "commentmapper.";
	
	public List<RecipeCommentDto> selectListCmt(){
		
		SqlSession session = null;
		List<RecipeCommentDto> list = new ArrayList<RecipeCommentDto>();
		
		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "selectListCmt");
		
		session.close();
		
		return list;
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
			res = session.delete(namespace + "insertCmtCmt",dto);
		} catch (Exception e) {
			e.printStackTrace();
			session.close();
		}
		
		return res;
	}
	
}
