package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dao.SqlMapConfig;
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
		this.noOfRecords = session.selectOne(namespace + "titleCount", params);

		session.close();

		return list;
	}

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(RecipeBoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
