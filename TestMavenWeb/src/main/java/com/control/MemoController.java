package com.control;

import java.sql.SQLException;
import java.util.List;

import kr.co.hanbit.MemoDAO;
import kr.co.hanbit.MemoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MemoController {
	@Autowired
	MemoDAO dao;
	
	@RequestMapping("/memo.list.do")
	public String list(Model m) throws SQLException{
		List<MemoVO> mList=dao.selectAllMemo();
		m.addAttribute("mList",mList);
		return "memo/memo";
	}

}
