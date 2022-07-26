package com.smhrd.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class depressionTest {
	
	
	// 이거 글 목록
	@RequestMapping("/depressionTest.do")
	public String depressionT() {
		
		
		return "depressionTest";
	}
	
	
	
}
	
	

