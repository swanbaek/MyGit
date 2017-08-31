package com.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HelloController {
	
	@RequestMapping("/hello.do")
	public String say(Model m){
		System.out.println("Here");
		m.addAttribute("message", "Hello Spring~");
		return "showMessage";
	}

}
