package com.myboard.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.myboard.dto.MyBoardDto;

public class MyBoardDao extends SqlMapConfig {

	private String namespace = "com.my.db.mapper.";
	int noOfRecords;

	public List<MyBoardDto> selectList(int offset, int noOfRecords) {
		SqlSession session = null;
		List<MyBoardDto> list = new ArrayList<MyBoardDto>();

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);

		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "selectList", params);
		this.noOfRecords = session.selectOne(namespace + "totalCountList");

		session.close();
		
		return list;
	}
	
	public List<MyBoardDto> searchTitle(int offset, int noOfRecords, String searchFiled, String searchValue) {
		SqlSession session = null;
		List<MyBoardDto> list = new ArrayList<MyBoardDto>();

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);
		params.put("searchFiled", searchFiled);
		params.put("searchValue", searchValue);

		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "selectList", params);
		this.noOfRecords = session.selectOne(namespace + "titleCount",params);

		session.close();
		
		return list;
	}

	public int getNoOfRecords() {
		 
        return noOfRecords;
    }


	public MyBoardDto selectOne(int myno) {
		SqlSession session = null;
		MyBoardDto dto = new MyBoardDto();

		session = getSqlSessionFactory().openSession(true);
		dto = session.selectOne(namespace + "selectOne", myno);

		session.close();

		return dto;
	}

	public int insert(MyBoardDto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public int update(MyBoardDto dto) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	public int delete(int myno) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "delete", myno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

}
