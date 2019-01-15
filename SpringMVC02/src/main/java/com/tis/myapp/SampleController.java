package com.tis.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tis.domain.SampleVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@RequestMapping("/index")
	public void index() {
		log.info("index");
	}
	@GetMapping("/ex01")
	public void ex01(SampleVO vo,Model m) {
		log.info("vo="+vo);
		m.addAttribute("vo",vo);
	}

}
