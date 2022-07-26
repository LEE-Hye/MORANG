package com.smhrd.web;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;





@RestController // Ajax요청을 전담해서 처리할 컨트롤러
public class MainRestController {
	@RequestMapping("/MainResult.do")
	public int MainResult(float fear, float surprise,float angry, float sadness, float neutral, float happiness, float disgust) {
		System.out.println(fear);
		System.out.println(angry);
		System.out.println(happiness);
		System.out.println(disgust);
		
		
		return 0;
	}
}
