package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.shareNote;
import com.smhrd.mapper.shareNoteMapper;

@Controller
public class shareNoteController {
	
	@Autowired
	shareNoteMapper mapper;
	
	@RequestMapping("/shareNote.do")
	public String shareNoteList(Model model) {
		
		List<shareNote> list = mapper.shareNoteList();
		
		model.addAttribute("list", list);
		
		return "shareNote";
	}
}
