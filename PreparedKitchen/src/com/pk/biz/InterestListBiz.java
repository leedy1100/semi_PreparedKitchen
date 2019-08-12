package com.pk.biz;

import java.util.List;

import com.pk.dao.InterestListDao;
import com.pk.dto.InterestListDto;

public class InterestListBiz {

	private InterestListDao dao = new InterestListDao();
	
	public List<InterestListDto> selectList(String id) {
		return dao.selectList(id);
	}
}
