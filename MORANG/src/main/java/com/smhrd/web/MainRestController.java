package com.smhrd.web;


import java.util.List;

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
		fear=0;
		surprise=0;
		angry=0;
		sadness=0;
		neutral=0;
		happiness=0;
		disgust=0;
		List<chatbotEmotion> todaylist = mapper.chatemotionselect(u_id);
		for(int i=0 ;i<todaylist.size();i++) {
			fear+=todaylist.get(i).getFear();
			surprise+=todaylist.get(i).getSurprise();
			angry+=todaylist.get(i).getAngry();
			sadness+=todaylist.get(i).getSadness();
			neutral+=todaylist.get(i).getNeutral();
			happiness+=todaylist.get(i).getHappiness();
			disgust+=todaylist.get(i).getDisgust();
			
		}
		
		fear=fear/todaylist.size();
		surprise=surprise/todaylist.size();
		angry=angry/todaylist.size();
		sadness=sadness/todaylist.size();
		neutral=neutral/todaylist.size();
		happiness=happiness/todaylist.size();
		disgust=disgust/todaylist.size();
		
		chatbotEmotion vo2= new chatbotEmotion(fear,surprise,angry,sadness,neutral,happiness,disgust);
		session.setAttribute("todayemotion", vo2);
		return 0;
	}
}
