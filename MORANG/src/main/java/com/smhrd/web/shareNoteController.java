package com.smhrd.web;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.domain.Join;
import com.smhrd.domain.diary;
import com.smhrd.domain.protectorJoin;
import com.smhrd.domain.shareNote;
import com.smhrd.mapper.shareNoteMapper;

@Controller
public class shareNoteController {
	
	@Autowired
	shareNoteMapper mapper;
	
	
//	노트 리스트 보기
	
	@RequestMapping("/shareNote.do")
	public String shareNoteList(Model model, HttpSession session) {
		
		Join loginMember=(Join)session.getAttribute("loginMember");
		String id=loginMember.getU_id();
		
		List<shareNote> list = mapper.shareNoteList(id);
		
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
		public String shareNoteInsert(shareNote vo, HttpSession session) {
			
			protectorJoin pro = (protectorJoin)session.getAttribute("protectorMember");
			String writer_id = pro.getP_id();
			
			if(writer_id.equals("soohyeonempty")) {
				mapper.shareNoteInsert(vo);
			}
			else {
				mapper.shareNoteInsertpro(vo);
			}
			
			return "redirect:/shareNote.do";
		}
	
	// 노트 상세 보기
		@RequestMapping("shareNotedetail.do")
		public String shareNotedetail(Model model, int note_seq,String writerId ,HttpSession session) {
			Join loginMember = (Join)session.getAttribute("loginMember");
			String checkId=loginMember.getU_id();
			shareNote vo;
			if(writerId.equals(checkId)) {
				vo = mapper.shareNotedetail(note_seq);
			}
			else {
				vo = mapper.shareNotedetailpro(note_seq);
				String id = mapper.shareNoteID(note_seq);
				vo.setU_id(id);
			}
			
			System.out.println(vo.getNote_color());

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
		public String shareNoteUpdate(shareNote vo,HttpSession session,HttpServletRequest request) {
			
			protectorJoin pro = (protectorJoin)session.getAttribute("protectorMember");
			String writer_id = pro.getP_id();
			
			if(writer_id.equals("soohyeonempty")) {
				mapper.shareNoteUpdate(vo);
			}
			else {
				mapper.shareNoteUpdatepro(vo);
			}
			
			if (request.getHeader("Referer") != null) {
			    return "redirect:" + request.getHeader("Referer");
			 } 
			else {
			    return "redirect:/shareNote.do";
			 }
			


			 
		}
		
		//노트 삭제하기
		
		@RequestMapping("/shareNoteDelete.do")
		public String shareNoteDelete(int note_seq,String writerId ,HttpSession session) {
			Join loginMember = (Join)session.getAttribute("loginMember");
			String checkId=loginMember.getU_id();
			
			if(writerId.equals(checkId)) {
				mapper.shareNoteDelete(note_seq);
			}
			else {
				mapper.shareNoteDeletepro(note_seq);
			}
			
			
			

			return "redirect:/shareNote.do";
		}
}
