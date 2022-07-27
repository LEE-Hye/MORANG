package com.smhrd.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.domain.Join;
import com.smhrd.domain.chatbotEmotion;
import com.smhrd.mapper.MainMapper;





@RestController // Ajax요청을 전담해서 처리할 컨트롤러
public class MainRestController {
	
	
	@Autowired 
	MainMapper mapper;
	
	
	@RequestMapping("/MainResult.do")
	public int MainResult(float fear, float surprise,float angry, float sadness, float neutral, float happiness, float disgust, HttpSession session) {
		
		Join loginMember=(Join)session.getAttribute("loginMember");
		String u_id=loginMember.getU_id();
		chatbotEmotion vo = new chatbotEmotion(u_id,fear, surprise, angry, sadness, neutral, happiness, disgust);
		mapper.chatemotioninsert(vo);
		chatbotEmotion vo2 = mapper.chatemotionselect(u_id);
		session.setAttribute("todayemotion", vo2);
		return 0;
	}
}
