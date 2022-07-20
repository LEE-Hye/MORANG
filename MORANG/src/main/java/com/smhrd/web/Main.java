package com.smhrd.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class Main {
	
	
	// 이거 글 목록
	@RequestMapping("/Main.do")
	public String Main() {
		
		
		return "Main";
	}
	
	
}
	
	

