package com.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Join;
import com.smhrd.domain.chatbotEmotion;
import com.smhrd.domain.mot;
import com.smhrd.mapper.MainMapper;




@Controller
public class Main {
	
	@Autowired 
	MainMapper mapper;
	// 이거 글 목록
	@RequestMapping("/Main.do")
	public String Main(HttpSession session) {
		
		mot vo=mapper.motList();
		String motcontent=vo.getContent();
		session.setAttribute("mot", motcontent);
		
		return "Main";
	}
	
	
	
	
}
	
	

