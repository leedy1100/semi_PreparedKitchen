package com.pk.dao;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pk.dto.MemberDto;

public class MemberDao extends SqlMapConfig{
	
	private String namespace = "membermapper.";
	
	public List<MemberDto> selectList(){
		
		SqlSession session = null;
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			session = getSqlsessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
=======
public class MemberDao {
	
	
>>>>>>> refs/remotes/origin/ldy

}
