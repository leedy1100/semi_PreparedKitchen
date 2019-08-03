package com.pk.biz;

import java.util.List;

import com.pk.dao.PaymentDao;
import com.pk.dto.PaymentDto;

public class PaymentBiz {
	
	private PaymentDao dao = new PaymentDao();
	
	public List<PaymentDto> selectList() {
		return dao.selectList();
	}
	
	public int insert(List<PaymentDto> list) {
		return dao.insert(list);
	}
}
