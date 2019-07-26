package com.pk.dao;

import java.util.List;

import com.pk.dto.RecipeBoardDto;


public interface BoardDao {

	public List<RecipeBoardDto> selectList(int offset, int noOfRecords);
	public List<RecipeBoardDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue);
	public RecipeBoardDto selectOne(int no);
	public int insert(RecipeBoardDto dto);
	public int update(RecipeBoardDto dto);
	public int delete(int no);
	public int hits(int no);
	public int getNoOfRecords();
	public int like(int no, String id);
}
