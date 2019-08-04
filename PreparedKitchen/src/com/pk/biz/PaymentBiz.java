package com.pk.biz;

import java.util.List;

import com.pk.dao.PaymentDao;
import com.pk.dto.PaymentDto;

public class PaymentBiz {
	
	private PaymentDao dao = new PaymentDao();
	
	public List<PaymentDto> selectList() {
		return dao.selectList();
	}
	
	public List<PaymentDto> mySelectList(String id) {
		return dao.mySelectList(id);
	}

	public List<PaymentDto> selectOneList(String tid) {
		return dao.selectOneList(tid);
	}
	
	
	public int insert(List<PaymentDto> list) {
		return dao.insert(list);
	}
	public int delete(String tid) {
		return dao.delete(tid);
	}
}
