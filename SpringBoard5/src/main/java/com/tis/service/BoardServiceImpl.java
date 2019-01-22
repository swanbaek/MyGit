package com.tis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tis.mapper.BoardMapper;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

}
