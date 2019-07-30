package com.pk.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Util {

	private String toDates;
	public String getToDates() {
		
		return toDates;
	}
	
	public void setToDates(String mdate) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH mm ss");
		Timestamp tm = Timestamp.valueOf(mdate);
		toDates = sdf.format(tm);
	}
}
