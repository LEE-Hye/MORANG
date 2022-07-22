package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.domain.Board;
import com.smhrd.mapper.BoardMapper;

@Controller //어노테이션
// 이 파일이 알바생(POJO)이다
public class BoardController {


	@Autowired 
	BoardMapper mapper;
	

	@RequestMapping("/boardList.do") 
	public String boardList( Model model) {

		List<Board> list = mapper.boardList();
		

		model.addAttribute("list", list);
		

		return "boardList"; 
	}

	@GetMapping("/boardInsert.do")
	public String boardForm() {
		return "boardForm";
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		mapper.boardInsert(vo);
		
		return "redirect:/boardList.do";
		
	}
	
	@RequestMapping("boardContent.do/{c_seq}") //Path Variable의 키값 선언
	public String boardContent(Model model, @PathVariable("c_seq") int c_seq) {
		
		// 특정한 하나의 글 데이터를 가져오기
		Board vo = mapper.boardContent(c_seq);
		
		// 확인해보기
		System.out.println(vo.getC_title());
				
		// 객체 바인딩 request 영역에 저장
		model.addAttribute("board", vo);
		
		return "boardContent"; // Path Variable을 사용할 때는, 반드시 직접 view를 알려줄것
	}
	
	@RequestMapping("/boardDelete.do")
	public String boardDelete(int c_seq) {
		
		// 특정한 하나의 게시글 삭제
		mapper.boardDelete(c_seq);
		
		// 목록페이지 이동
		return "redirect:/boardList.do";
	}
	
	// Update페이지로 이동하는 Controller 필요
	// /boardGoUpdate.do?idx=4
	@RequestMapping("/boardGoUpdate.do")
	public String boardGoUpdate(int c_seq, Model model) {
		
		// 특정 하나의 게시글 정보를 가져오기
		Board vo = mapper.boardContent(c_seq);
		
		// 저장(객체바인딩)
		model.addAttribute("board", vo);
		
		// boardUpdate.jsp로 이동
		// /WEB-INF/views/boardUpdate.jsp
		return "boardUpdate";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		
		// 사용자가 입력한 데이터로, update
		mapper.boardUpdate(vo);
		
		// (목록)페이지 이동
		return "redirect:/boardList.do";
		
	}
	
	@RequestMapping("/viewUpdate.do")
	public @ResponseBody int viewUpdate(Board vo) {

		// 조회수 수정
		int c_likes = mapper.viewUpdate(vo);

		// 성공 or 실패 리턴

		return c_likes;
	}
}