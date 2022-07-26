package com.smhrd.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class depressionTestResult {
	
	// 지금 이게 인식 안되는 이유가
	// Class 이름이랑 메서드 이름이 같아서에요 생성자로 인식해버리는것 같습니다.
	@RequestMapping("/depressionTestResult.do")
	public String depressionTestR() {

		return "depressionTestResult";
	}

}
