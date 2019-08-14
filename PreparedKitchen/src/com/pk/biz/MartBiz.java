package com.pk.biz;

import java.util.List;

import com.pk.dao.MartDao;
import com.pk.dto.CartDto;
import com.pk.dto.InterestListDto;
import com.pk.dto.MartDto;

public class MartBiz {
	
	MartDao dao = new MartDao();
	
	public List<MartDto> selectList() {
		
		return dao.selectList();
	}
	
	public MartDto selectOne(int mart_no) {
		
		return dao.selectOne(mart_no);
	}
	
	public int createDummy(List<MartDto> list) {
		
		return dao.createDummy(list);
	}
	
	public List<MartDto> buyProduct(String[] str) {
		
		return dao.buyProduct(str);
	}
	
	public List<MartDto> selectListOne(List<CartDto> cList) {
		
		return dao.selectListOne(cList);
	}

}
