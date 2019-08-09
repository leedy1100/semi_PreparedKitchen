package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;

import com.pk.dto.ProductListDto;
import com.pk.dto.RecipeDto;

public class ProductListDao extends SqlMapConfig {

	private String namespace = "productmapper.";

	public JSONArray productViewChart() {

		SqlSession session = null;
		List<ProductListDto> list = new ArrayList<ProductListDto>();

		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "productviewChart");
		HashMap<String, Object> chart = null;
		JSONArray jArr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			chart = new HashMap<String, Object>();
			chart.put("x", list.get(i).getRecipe_name());
			chart.put("y", list.get(i).getView_no());

			jArr.add(chart);
		}

		session.close();
		return jArr;
	}

	public JSONArray productSalesChart() {

		SqlSession session = null;
		List<ProductListDto> list = new ArrayList<ProductListDto>();

		session = getSqlSessionFactory().openSession();
		list = session.selectList(namespace + "productsalesChart");
		HashMap<String, Object> chart = null;
		JSONArray jArr = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			chart = new HashMap<String, Object>();
			chart.put("x", list.get(i).getRecipe_name());
			chart.put("y", list.get(i).getSales_count());

			jArr.add(chart);
		}

		session.close();
		return jArr;
	}

	public int insertProduct(List<ProductListDto> list) {

		SqlSession session = null;
		int res = 0;
		Map<String, List<ProductListDto>> map = new HashMap<String, List<ProductListDto>>();
		int seq = 0;

		try {

			for (int i = 0; i < list.size(); i++) {
				session = getSqlSessionFactory().openSession(false);
				seq = session.selectOne(namespace + "seqnextval");
				list.get(i).setProductList_no(seq);
			}

			map.put("lists", list);
			res = session.insert(namespace + "insertProduct", map);

			if (res == list.size()) {
				session.commit();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int updateRecipeN(List<ProductListDto> list) {

		SqlSession session = null;
		int res = 0;
		Map<String, List<ProductListDto>> map = new HashMap<String, List<ProductListDto>>();
		map.put("lists", list);

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "updateRecipeN", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}
	
	public int updateRecipeY(String[] recipe_no) {

		SqlSession session = null;
		int res = 0;
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("recipe_noY", recipe_no);

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace + "updateRecipeY", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int deleteProduct(String[] recipe_no) {
		
		SqlSession session = null;
		int res = 0;
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("recipe_no", recipe_no);

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "deleteProduct", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

}
