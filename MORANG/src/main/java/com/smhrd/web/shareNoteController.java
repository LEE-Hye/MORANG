package com.smhrd.web;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.domain.diary;
import com.smhrd.domain.shareNote;
import com.smhrd.mapper.shareNoteMapper;

@Controller
public class shareNoteController {
	
	@Autowired
	shareNoteMapper mapper;
	
	
//	노트 리스트 보기
	
	@RequestMapping("/shareNote.do")
	public String shareNoteList(Model model) {
		
		List<shareNote> list = mapper.shareNoteList();
		
		model.addAttribute("list", list);
		
		return "shareNote";
	}
	
//	노트 작성하기
	// 이거 글 작성
		@GetMapping("/shareNoteInsert.do")
		public String shareNoteInsert() {
			return "shareNote";
		}
		
		@PostMapping("/shareNoteInsert.do")
		public String shareNoteInsert(shareNote vo) {
			mapper.shareNoteInsert(vo);
		
			return "redirect:/shareNote.do";
		}
	
	// 노트 상세 보기
		@RequestMapping("shareNotedetail.do/{note_seq}")
		public String shareNotedetail(Model model, @PathVariable("note_seq") int note_seq) {
			
			shareNote vo = mapper.shareNotedetail(note_seq);
			
			System.out.println(vo.getNote_title());

			model.addAttribute("shareNote", vo);
			
			return "shareNotedetail";
		}
		
		// 노트 수정
		@RequestMapping("/shareNoteGoUpdate.do")
		public String shareNoteGoUpdate(int note_seq, Model model) {
			
			shareNote vo = mapper.shareNotedetail(note_seq);
			
			model.addAttribute("shareNote", vo);
			
			return "shareNoteUpdate";
		}
		
		
		@RequestMapping("/shareNoteUpdate.do")
		public String shareNoteUpdate(shareNote vo) {
			
			mapper.shareNoteUpdate(vo);
			 return "redirect:/shareNote.do";
		}
		
		//노트 삭제하기
		
		@RequestMapping("/shareNoteDelete.do")
		public String shareNoteDelete(int note_seq) {

			mapper.shareNoteDelete(note_seq);
			

			return "redirect:/shareNote.do";
		}
}
