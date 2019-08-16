package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.MartDto;
import com.pk.dto.ProductListDto;
import com.pk.dto.RecipeDto;

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
	
	public List<RecipeDto> selectRecentlyRecipe(List<Integer> recipeno){
		
		SqlSession session = null;
		List<RecipeDto> list = new ArrayList<RecipeDto>();
		Map<String, int[]> map = new HashMap<String, int[]>();
		int[] seq = new int[recipeno.size()];
		
		for(int i = 0; i < recipeno.size(); i++) {
			seq[i] = recipeno.get(i).intValue();
		}
		
		map.put("list", seq);
		
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
