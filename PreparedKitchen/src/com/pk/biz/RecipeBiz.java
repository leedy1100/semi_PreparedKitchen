package com.pk.biz;

import java.util.ArrayList;
import java.util.List;

import com.pk.dao.MartDao;
import com.pk.dao.MaterialDao;
import com.pk.dao.RecipeDao;
import com.pk.dto.RecipeDto;

public class RecipeBiz {

	private RecipeDao dao = new RecipeDao();

	public List<RecipeDto> selectList() {

		return dao.selectList();
	}

	public List<RecipeDto> recipeList(String category, String recipe_reg, int offset, int noOfRecords) {

		return dao.recipeList(category, recipe_reg, offset, noOfRecords);
	}
	
	public List<RecipeDto> selectListOne(List<Integer> list, String id) {
		return dao.selectListOne(list, id);
	}
	
	public List<RecipeDto> selectListPay(int[] recipenos) {
		return dao.selectListPay(recipenos);
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

	public int getNoOfRecords() {

		return dao.getNoOfRecords();
	}

	public List<RecipeDto> selectListCategory() {

		List<RecipeDto> list = dao.selectList();
		List<RecipeDto> listcategory = new ArrayList<RecipeDto>();
		RecipeDto dto = null;

		for (int i = 0; i < list.size(); i++) {
			dto = new RecipeDto();
			if (i != 0) {
				if (!list.get(i).getRecipe_category().equals(list.get(i - 1).getRecipe_category())) {
					dto.setRecipe_category(list.get(i).getRecipe_category());
					listcategory.add(dto);
				}
			} else {
				dto.setRecipe_category(list.get(i).getRecipe_category());
				listcategory.add(dto);
			}
		}

		return listcategory;
	}

	public int deleteDummy() {

		MaterialDao mDao = new MaterialDao();
		MartDao martDao = new MartDao();
		
		int res1 = mDao.deleteDummy();
		int res2 = dao.deleteDummy();
		int res3 = martDao.deleteDummy();

		return res1 + res2 + res3;
	}

}
