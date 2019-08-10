package com.pk.biz;

import java.util.ArrayList;
import java.util.List;

import com.pk.dao.MaterialDao;
import com.pk.dto.CartDto;
import com.pk.dto.MaterialDto;

public class MaterialBiz {
	
	private MaterialDao dao = new MaterialDao();
	
	public List<MaterialDto> selectList(){
		
		return dao.selectList();
	}

	public int insert(List<MaterialDto> list) {
		
		return dao.insert(list);
	}
	
	public List<MaterialDto> materialInRecipe(int recipe_no){
		
		return dao.materialInRecipe(recipe_no);
	}

	public List<MaterialDto> selectListOne(List<CartDto> cList) {
		return dao.selectListOne(cList);
	}
	
}
