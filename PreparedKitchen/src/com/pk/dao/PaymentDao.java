package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.PaymentDto;

public class PaymentDao extends SqlMapConfig{

	private String namespace = "paymentmapper.";
	int noOfRecords;
	
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
	
	public List<PaymentDto> mySelectList(int offset, int noOfRecords, String id) {
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		SqlSession session = null;
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);
		

		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectList", params);
			this.noOfRecords = session.selectOne(namespace + "totalCountList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public List<PaymentDto> selectOneList(String tid) {
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "selectOneList", tid);
			
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
			
			for(PaymentDto dto : list) {
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
	
	public int delete(String tid) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			res += session.delete(namespace + "delete", tid);
			
			if(res > 0) {
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
