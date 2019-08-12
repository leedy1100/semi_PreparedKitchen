package com.pk.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.InterestListDto;

public class InterestListDao extends SqlMapConfig {

	private String namespace = "interestmapper.";
	
	public List<InterestListDto> selectList(String id) {
		List<InterestListDto> list = new ArrayList<InterestListDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectList", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

}
