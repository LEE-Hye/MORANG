package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.mot;
import com.smhrd.mapper.MainMapper;




@Controller
public class Main {
	
	@Autowired 
	MainMapper mapper;
	// 이거 글 목록
	@RequestMapping("/Main.do")
	public String Main() {
		
		List<mot>motlist=mapper.motList();
		
		for(int i=0;i<motlist.size();i++) {
			System.out.println(motlist.get(i).getContent());
		}
		return "Main";
	}
	
	
}
	
	

