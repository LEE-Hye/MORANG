package com.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Join;
import com.smhrd.domain.chatbotEmotion;
import com.smhrd.domain.diary;
import com.smhrd.domain.mot;
import com.smhrd.mapper.MainMapper;




@Controller
public class Main {
	
	@Autowired 
	MainMapper mapper;
	// 이거 글 목록
	@RequestMapping("/Main.do")
	public String Main(HttpSession session) {
		Join loginMember=(Join)session.getAttribute("loginMember");
		String u_id=loginMember.getU_id();
		mot vo=mapper.motList();
		String motcontent=vo.getContent();
		session.setAttribute("mot", motcontent);
		
		float fear=0;
		float surprise=0;
		float angry=0;
		float sadness=0;
		float neutral=0;
		float happiness=0;
		float disgust=0;
		List<chatbotEmotion> yesterdaylist= mapper.chatemotionselect2(u_id);
		for(int i=0 ;i<yesterdaylist.size();i++) {
			fear+=yesterdaylist.get(i).getFear();
			surprise+=yesterdaylist.get(i).getSurprise();
			angry+=yesterdaylist.get(i).getAngry();
			sadness+=yesterdaylist.get(i).getSadness();
			neutral+=yesterdaylist.get(i).getNeutral();
			happiness+=yesterdaylist.get(i).getHappiness();
			disgust+=yesterdaylist.get(i).getDisgust();
			
		}
		fear=fear/yesterdaylist.size();
		surprise=surprise/yesterdaylist.size();
		angry=angry/yesterdaylist.size();
		sadness=sadness/yesterdaylist.size();
		neutral=neutral/yesterdaylist.size();
		happiness=happiness/yesterdaylist.size();
		disgust=disgust/yesterdaylist.size();
		
		
		chatbotEmotion vo2= new chatbotEmotion(fear,surprise,angry,sadness,neutral,happiness,disgust);
		session.setAttribute("yesterdayemotion", vo2);
		int pos=0;
		int neg=0;
		List<diary> diaryemotionlist = mapper.selectemotion(u_id);
		for(int i=0 ;i<diaryemotionlist.size();i++) {
			pos+=diaryemotionlist.get(i).getDiary_pos();
			neg+=diaryemotionlist.get(i).getDiary_neg();
		}
		pos=pos/diaryemotionlist.size();
		neg=neg/diaryemotionlist.size();
		
		System.out.println(pos);
		System.out.println(neg);
		diary dia=new diary(pos,neg);
		session.setAttribute("diaryyesterdayemotion", dia);
		
		return "Main";
	}
	
	
	
	
}
	
	

