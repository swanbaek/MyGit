package com.tis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tis.service.BoardService;

@Controller
public class BoardController {
	
	
	@Inject
	private BoardService bsvc;
	
	@GetMapping("/bbs")
	public String testBoard(Model m) {
		int cnt=bsvc.getTotalCount();
		m.addAttribute("cnt",cnt);
		return "board/test";
	}

}
