package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.mapper.commentMapper;
import com.smhrd.domain.comment;
import com.smhrd.mapper.BoardMapper;
import com.smhrd.domain.Board;

@Controller //어노테이션
// 이 파일이 알바생(POJO)이다
public class commentController {


	@Autowired 
	commentMapper mapper;
	
	@RequestMapping("/commentInsert.do")
	public String commentInsert(comment vo) {
		mapper.commentInsert(vo);
		return "redirect:/boardContent.do?c_seq="+vo.getC_seq();
	}
	
// 필요없어 보임
//	@RequestMapping("/commentList.do") 
//	public String commentList( Model model) {
//
//		List<comment> list = mapper.commentList();
//		
//
//		model.addAttribute("list", list);
//		
//
//		return "boardForm"; 
//	}
//
//	@GetMapping("/commentInsert.do")
//	public String commentForm() {
//		return "redirect:/boardContent.do/{c_seq}";
//	}
//	
//	@PostMapping("/commentInsert.do")
//	public String commentInsert(comment vo) {
//		mapper.commentInsert(vo);
//		
//		return "redirect:/boardContent.do/{c_seq}";
//		
//	}
//	
//	@RequestMapping("commentContent.do/{c_seq}") //Path Variable의 키값 선언
//	public String commentContent(Model model, @PathVariable("cmt_seq") int cmt_seq) {
//		
//		// 특정한 하나의 글 데이터를 가져오기
//		comment vo = mapper.commentContent(cmt_seq);
//		
//		// 확인해보기
//		System.out.println(vo.getU_id());
//				
//		// 객체 바인딩 request 영역에 저장
//		model.addAttribute("comment", vo);
//		
//		return "boardContent"; // Path Variable을 사용할 때는, 반드시 직접 view를 알려줄것
//	}
//	
//	@RequestMapping("/commentDelete.do")
//	public String commentDelete(int cmt_seq) {
//		
//		// 특정한 하나의 게시글 삭제
//		mapper.commentDelete(cmt_seq);
//		
//		// 목록페이지 이동
//		return "redirect:/boardContent.do/{c_seq}";
//	}
//	
//	// Update페이지로 이동하는 Controller 필요
//	@RequestMapping("/commentGoComment.do")
//	public String commentGoComment(int cmt_seq, Model model) {
//		
//		// 특정 하나의 게시글 정보를 가져오기
//		comment vo = mapper.commentContent(cmt_seq);
//		
//		// 저장(객체바인딩)
//		model.addAttribute("comment", vo);
//		
//		return "redirect:/boardContent.do/{c_seq}";
//	}
//	
//	@RequestMapping("/commentUpdate.do")
//	public String commentUpdate(comment vo) {
//		
//		// 사용자가 입력한 데이터로, update
//		mapper.commentUpdate(vo);
//		
//		// (목록)페이지 이동
//		return "redirect:/boardContent.do/{c_seq}";
//		
//	}
	
}