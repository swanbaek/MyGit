package com.tis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.tis.domain.BoardVO;

public interface BoardMapper {
	
	/*@Select("select count(*) from tbl_board")*/
	public int getTotalCount();
	public List<BoardVO> getList();
	public int insert(BoardVO board);
	//public void

}
