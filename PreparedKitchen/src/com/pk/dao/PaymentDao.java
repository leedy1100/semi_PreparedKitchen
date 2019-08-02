package com.pk.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.PaymentDto;

public class PaymentDao extends SqlMapConfig{

	private String namespace = "paymentmapper.";
	
	public List<PaymentDto> selectList() {
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		SqlSession session = null;
		
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
	
}
