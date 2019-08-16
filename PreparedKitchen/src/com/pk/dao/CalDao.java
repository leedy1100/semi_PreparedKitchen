package com.pk.dao;



import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.CalDto;



public class CalDao extends SqlMapConfig {
	
	private String namespace = "calendarmapper.";
	
	public List<CalDto> mycalendar(String id) {
		
		SqlSession session = null;
		List<CalDto>list = new ArrayList<CalDto>();
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "mycalendar", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public int updatecalendar(CalDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace+"updatecalendar",dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	public int insert(List<CalDto> list) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			
			for(CalDto dto : list) {
				res += session.insert(namespace + "insercalendar", dto);
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
	
	public int deletecal(String tid) {
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
