package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.MartDto;
import com.pk.dto.ProductListDto;

public class ProductDetailDao extends SqlMapConfig{
	
	private String martNS = "martmapper.";
	
	public List<MartDto> selectProduct(String[] str){
		
		SqlSession session = null;
		List<MartDto> list = new ArrayList<MartDto>();
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("strs", str);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(martNS+"selectProduct", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	public List<ProductListDto> selectRecentlyRecipe(List<Integer> recipeno){
		
		SqlSession session = null;
		List<ProductListDto> list = new ArrayList<ProductListDto>();
		Map<String, List<Integer>> map = new HashMap<String, List<Integer>>();
		map.put("list", recipeno);
		
		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(martNS+"selectRecentlyRecipe", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

}
