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

	public int deleteProduct(String[] recipe_no) {

		int res1 = productListDao.updateRecipeY(recipe_no);
		int res2 = productListDao.deleteProduct(recipe_no);

		return res1 + res2;
	}
	
	public List<ProductListDto> selectList(int offset, int noOfRecords, String order) {
		
		return productListDao.selectList(offset, noOfRecords,order);
	}
	
	public int getNoOfRecords() {
		
		return productListDao.getNoOfRecords();
	}
	
	public int hit(int recipe_no) {
		
		return productListDao.hit(recipe_no);
	}
	
	public int salesCount(String recipe_no) {
		
		return productListDao.salesCount(recipe_no);
	}
}
