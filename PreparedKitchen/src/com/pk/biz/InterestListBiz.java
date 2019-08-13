package com.pk.biz;

import java.util.List;

import com.pk.dao.InterestListDao;
import com.pk.dto.InterestListDto;

public class InterestListBiz {

	private InterestListDao dao = new InterestListDao();

	public List<InterestListDto> selectList(String id) {
		return dao.selectList(id);
	}

	public int insertInterestRecipe(InterestListDto dto) {

		InterestListDto idto = dao.selectOneInterestRecipe(dto.getId(), dto.getRecipe_no());
		if (idto != null) {
			return dao.deleteInterestRecipe(dto.getId(), dto.getRecipe_no()) + 1;
		} else {
			return dao.insertInterestRecipe(dto);
		}
	}
	
	public int deleteInterestRecipe(String id, int recipe_no) {
		return dao.deleteInterestRecipe(id, recipe_no);
	}
}
