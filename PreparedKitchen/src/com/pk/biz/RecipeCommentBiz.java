package com.pk.biz;

import java.util.List;

import org.json.simple.JSONArray;

import com.pk.dao.RecipeCommentDao;
import com.pk.dto.RecipeCommentDto;

public class RecipeCommentBiz {

	RecipeCommentDao recipeCommentDao = new RecipeCommentDao();

	public JSONArray selectListCmt2(int no) {
		return recipeCommentDao.selectListCmt2(no);
	}
	
	public List<RecipeCommentDto> selectListCmt(int no) {
		return recipeCommentDao.selectListCmt(no);
	}

	public RecipeCommentDto selectOneCmt(int no) {
		return recipeCommentDao.selectOneCmt(no);
	}

	public int insertCmt(RecipeCommentDto dto) {
		return recipeCommentDao.insertCmt(dto);
	}

	public int updateCmt(RecipeCommentDto dto) {
		return recipeCommentDao.updateCmt(dto);
	}

	public int deleteCmt(int no) {
		return recipeCommentDao.deleteCmt(no);
	}

	public int insertCmtCmt(RecipeCommentDto dto) {
		recipeCommentDao.updateGroupNO(dto.getRecipeBoard_no());

		return recipeCommentDao.insertCmtCmt(dto);
	}

}
