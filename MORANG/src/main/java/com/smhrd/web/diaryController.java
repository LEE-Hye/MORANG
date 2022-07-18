package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.diary;
import com.smhrd.mapper.diaryMapper;

@Controller
public class diaryController {
	
	@Autowired
	diaryMapper mapper;
	
	@RequestMapping("/diary.do")
	public String diaryList(Model model) {
		
		List<diary> list = mapper.diaryList();
		
		model.addAttribute("list", list);
		
		return "diary";
	}
	
	@GetMapping("/diarywrite.do")
	public String diarywrite() {
		return "diarywrite";
	}
	
	@PostMapping("/diarywrite.do")
	public String diarywrite(diary vo) {
		
		mapper.diarywrite(vo);
		
		return "redirect:/diary.do";
	}
	
}
