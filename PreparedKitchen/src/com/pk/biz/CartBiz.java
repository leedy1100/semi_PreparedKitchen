package com.pk.biz;

import java.util.List;

import com.pk.dao.CartDao;
import com.pk.dto.CartDto;

public class CartBiz {

	private CartDao dao = new CartDao();
	
	public List<CartDto> selectList(String id, int recipe_no) {
		return dao.selectList(id, recipe_no);
	}
	public List<CartDto> selectListRecipe(String id) {
		return dao.selectListRecipe(id);
	}
	
	public int isnertCart(List<CartDto> list) {
		
		return dao.isnertCart(list);
	}
	
	public int deleteCart(String id, int[] recipenos) {
		
		return dao.deleteCart(id, recipenos);
	}
	
	public int deleteCart_martno(String id, int[] martnos) {
		
		return dao.deleteCart_martno(id, martnos);
	}
}
