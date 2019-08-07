package com.pk.biz;

import java.util.List;

import com.pk.dao.RecipeDao;
import com.pk.dto.RecipeDto;

public class RecipeBiz {
	
	private RecipeDao dao = new RecipeDao();
	
	public List<RecipeDto> selectList(){
		
		return dao.selectList();
	}
	
	public int insert(List<RecipeDto> list) {
		
		return dao.insert(list);
	}
	
	public int update(List<RecipeDto> list) {
		
		return dao.update(list);
	}
	
	public RecipeDto selectOne(int recipe_no) {
		
		return dao.selectOne(recipe_no);
	}

	public List<RecipeDto> recipeList(String category, int offset, int noOfRecords){
		
		return dao.recipeList(category, offset, noOfRecords);
	}
	
	public int getNoOfRecords() {
		
		return dao.getNoOfRecords();
	}
}
