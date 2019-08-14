package com.pk.biz;




import java.util.List;

import com.pk.dao.CalDao;
import com.pk.dto.CalDto;

public class CalendarBiz {
	
	CalDao dao = new CalDao();
	
	public List<CalDto> mycalendar(String id) {
		return dao.mycalendar(id);
	}
	
	public int updatecalendar(CalDto dto) {
		return dao.updatecalendar(dto);
	}
	
	public int insercalendar(List<CalDto> list) {
		return dao.insert(list);
	}

}
