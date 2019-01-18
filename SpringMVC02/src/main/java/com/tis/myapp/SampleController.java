package com.tis.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tis.domain.SampleVO;
import com.tis.persistence.SampleDao;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/sample/*")
@Slf4j
public class SampleController {
	
	@Autowired
	SampleDao dao;
	
	@RequestMapping("/index")
	public void index() {
		log.info("index");
	}
	@GetMapping("/ex01")
	public void ex01(SampleVO vo,Model m) {
		log.info("vo="+vo);
		int cnt=dao.getCnt();
		m.addAttribute("vo",vo);
		m.addAttribute("cnt",cnt);
	}

}
