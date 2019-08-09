package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.InterestListDto;
import com.pk.dto.MartDto;

public class MartDao extends SqlMapConfig{
	
	private String namespace = "martmapper.";
	
	public List<InterestListDto> selectList() {
		
		SqlSession session = null;
		List<InterestListDto> list = new ArrayList<InterestListDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public int createDummy(List<MartDto> list) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, List<MartDto>> map = new HashMap<String, List<MartDto>>();
		map.put("lists", list);
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"createDummy", map);
			
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
