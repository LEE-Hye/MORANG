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
		float pos=0;
		float neg=0;
		List<diary> diaryemotionlist = mapper.selectemotion(u_id);
		for(int i=0 ;i<diaryemotionlist.size();i++) {
			pos+=diaryemotionlist.get(i).getDiary_pos();
			neg+=diaryemotionlist.get(i).getDiary_neg();
		}
		pos=pos/diaryemotionlist.size();
		neg=neg/diaryemotionlist.size();
		diary dia=new diary(pos,neg);
		
		
		float pos2=0;
		float neg2=0;
		List<diary> diaryemotionlist2 = mapper.selectemotion2(u_id);
		for(int i=0 ;i<diaryemotionlist2.size();i++) {
			pos2+=diaryemotionlist2.get(i).getDiary_pos();
			neg2+=diaryemotionlist2.get(i).getDiary_neg();
		}
		pos2=pos2/diaryemotionlist2.size();
		neg2=neg2/diaryemotionlist2.size();
		diary dia2=new diary(pos2,neg2);
		
		float pos3=0;
		float neg3=0;
		List<diary> diaryemotionlist3 = mapper.selectemotion3(u_id);
		for(int i=0 ;i<diaryemotionlist3.size();i++) {
			pos3+=diaryemotionlist3.get(i).getDiary_pos();
			neg3+=diaryemotionlist3.get(i).getDiary_neg();
		}
		pos3=pos3/diaryemotionlist3.size();
		neg3=neg3/diaryemotionlist3.size();
		diary dia3=new diary(pos3,neg3);
		
		float pos4=0;
		float neg4=0;
		List<diary> diaryemotionlist4 = mapper.selectemotion4(u_id);
		for(int i=0 ;i<diaryemotionlist4.size();i++) {
			pos4+=diaryemotionlist4.get(i).getDiary_pos();
			neg4+=diaryemotionlist4.get(i).getDiary_neg();
		}
		pos4=pos4/diaryemotionlist4.size();
		neg4=neg4/diaryemotionlist4.size();
		diary dia4=new diary(pos4,neg4);
		
		
		float pos5=0;
		float neg5=0;
		List<diary> diaryemotionlist5 = mapper.selectemotion5(u_id);
		for(int i=0 ;i<diaryemotionlist5.size();i++) {
			pos5+=diaryemotionlist5.get(i).getDiary_pos();
			neg5+=diaryemotionlist5.get(i).getDiary_neg();
		}
		pos5=pos5/diaryemotionlist5.size();
		neg5=neg5/diaryemotionlist5.size();
		diary dia5=new diary(pos5,neg5);
		
		float pos6=0;
		float neg6=0;
		List<diary> diaryemotionlist6 = mapper.selectemotion6(u_id);
		for(int i=0 ;i<diaryemotionlist6.size();i++) {
			pos6+=diaryemotionlist6.get(i).getDiary_pos();
			neg6+=diaryemotionlist6.get(i).getDiary_neg();
		}
		pos6=pos6/diaryemotionlist6.size();
		neg6=neg6/diaryemotionlist6.size();
		diary dia6=new diary(pos6,neg6);
		
		
		float pos7=0;
		float neg7=0;
		List<diary> diaryemotionlist7 = mapper.selectemotion7(u_id);
		for(int i=0 ;i<diaryemotionlist7.size();i++) {
			pos7+=diaryemotionlist7.get(i).getDiary_pos();
			neg7+=diaryemotionlist7.get(i).getDiary_neg();
		}
		pos7=pos7/diaryemotionlist7.size();
		neg7=neg7/diaryemotionlist7.size();
		diary dia7=new diary(pos7,neg7);
		
		
		session.setAttribute("diaryyesterdayemotion", dia);
		session.setAttribute("diary2emotion", dia2);
		session.setAttribute("diary3emotion", dia3);
		session.setAttribute("diary4emotion", dia4);
		session.setAttribute("diary5emotion", dia5);
		session.setAttribute("diary6emotion", dia6);
		session.setAttribute("diary7emotion", dia7);
		
		return "Main";
	}
	
	
	
	
}
	
	

