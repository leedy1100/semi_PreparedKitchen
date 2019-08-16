package com.pk.biz;

import java.util.List;

import com.pk.dao.ProductDetailDao;
import com.pk.dto.MartDto;
import com.pk.dto.ProductListDto;
import com.pk.dto.RecipeDto;

public class ProductDetailBiz {
	
	private ProductDetailDao dao = new ProductDetailDao();
	
	public List<MartDto> selectProduct(String[] str){
		
		return dao.selectProduct(str);
	}

	public List<RecipeDto> selectRecentlyRecipe(List<Integer> recipeno){
		return dao.selectRecentlyRecipe(recipeno);
	}
}
