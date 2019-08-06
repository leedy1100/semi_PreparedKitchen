package com.pk.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.CalDto;


public class CalDao extends SqlMapConfig {
	
	private String namespace = "calendarmapper.";
	
	public List<CalDto> mycalendar() {
		List<CalDto> list = new ArrayList<CalDto>();
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace + "CalendarList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	

}
