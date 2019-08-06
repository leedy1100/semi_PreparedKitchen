package com.pk.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;

import com.pk.dto.ProductListDto;

public class ProductListDao extends SqlMapConfig{

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
}
