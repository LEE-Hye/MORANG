package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.diary;
import com.smhrd.domain.note;
import com.smhrd.mapper.noteMapper;

@Controller
public class noteController {

	@Autowired
	noteMapper mapper;
	
	@RequestMapping("/note.do")
	public String noteList(Model model) {
		
		List<note> list = mapper.noteList();
		
		model.addAttribute("list", list);
		
		return "note";
	}
	
	@GetMapping("/noteInsert.do")
	public String noteInsert() {
		return "noteInsert";
	}
	
	@PostMapping("/noteInsert.do")
	public String noteInsert(note vo) {
		
		mapper.noteInsert(vo);
		
		return "redirect:/note.do";
	}
	
}

