package com.pk.biz;

import java.util.List;

import org.json.simple.JSONArray;

import com.pk.dao.ProductListDao;
import com.pk.dto.ProductListDto;

public class ProductListBiz {

	ProductListDao productListDao = new ProductListDao();
	
	public JSONArray productViewChart() {
		return productListDao.productViewChart();
	}
	
	public JSONArray productSalesChart() {
		return productListDao.productSalesChart();
	}
	
	public int insertProduct(List<ProductListDto> list) {
		
		int res1 = productListDao.updateRecipeN(list);
		int res2 = productListDao.insertProduct(list);
		return res1 + res2;
	}
}
