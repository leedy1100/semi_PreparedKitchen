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
	
	public int insert(List<PaymentDto> list) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			int seq = session.selectOne(namespace + "incrementSeq");
			
			for(PaymentDto dto : list) {
				dto.setPayment_groupno(seq);
				res += session.insert(namespace + "insert", dto);
			}
			
			if(res == list.size()) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		
		return res;
	}
	
}
