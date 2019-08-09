package com.pk.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.CartDto;

public class CartDao extends SqlMapConfig {

	private String namespace = "cartmapper.";
	
	public List<CartDto> selectList(String id) {
		List<CartDto> list = new ArrayList<CartDto>();
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
