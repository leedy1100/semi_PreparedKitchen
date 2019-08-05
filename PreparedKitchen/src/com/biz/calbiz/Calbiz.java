package com.biz.calbiz;

import com.dao.caldao.Caldao;
import com.dto.caldto.Caldto;

public class Calbiz {
	
	Caldao dao = new Caldao();
	
	public Caldto mycal(String id) {
		return dao.mycal(id);
	}

}
