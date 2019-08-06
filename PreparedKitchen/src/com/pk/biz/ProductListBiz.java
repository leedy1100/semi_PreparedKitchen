package com.pk.biz;

import org.json.simple.JSONArray;

import com.pk.dao.ProductListDao;

public class ProductListBiz {

	ProductListDao productListDao = new ProductListDao();
	
	public JSONArray productViewChart() {
		return productListDao.productViewChart();
	}
	
	public JSONArray productSalesChart() {
		return productListDao.productSalesChart();
	}
}
