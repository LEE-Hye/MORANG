package com.smhrd.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Board;
import com.smhrd.domain.diary;
import com.smhrd.mapper.diaryMapper;

@Controller
public class diaryController {
	
	@Autowired
	diaryMapper mapper;
	
	// 이거 글 목록
	@RequestMapping("/diary.do")
	public String diaryList(Model model) {
		
		List<diary> list = mapper.diaryList();
		
		model.addAttribute("list", list);
		
		return "diary";
	}
	
	// 이거 글 작성
	@GetMapping("/diarywrite.do")
	public String diarywrite() {
		return "diarywrite";
	}
	
	@PostMapping("/diarywrite.do")
	public String diarywrite(diary vo,HttpServletRequest request) {
		float pos = Float.valueOf(request.getParameter("pos"));
		float neg = Float.valueOf(request.getParameter("neg"));
		System.out.println(pos);
		System.out.println(neg);
		vo.setDiary_pos(pos);
		vo.setDiary_neg(neg);
		System.out.println(vo.getU_id());
		mapper.diarywrite(vo);
		
		return "redirect:/diary.do";
	}
	
	
	
	
	
	
	// 이거 상세 페이지 보여주기
	@RequestMapping("diaryContent.do/{diary_seq}")
	public String diaryContent(Model model, @PathVariable("diary_seq") int diary_seq) {
		diary vo = mapper.diaryContent(diary_seq);
		
		System.out.println(vo.getDiary_title());
		
		// 객체 바인딩
		// 92줄 (Model model)이렇게 집어넣어주면 알아서 바인딩 처리를 해줘
		model.addAttribute("diary", vo);
		
		return "diaryContent"; // Path Variable을 사용하려면 반드시 return해줘야 해
	}
	
	// 이거 글 삭제
	@RequestMapping("/diaryDelete.do")
	public String diaryDelete(int diary_seq) {

		mapper.diaryDelete(diary_seq);
		

		return "redirect:/diary.do";
	}
	
	// 이거 글 수정
	@RequestMapping("/diaryGoUpdate.do")
	public String boardGoUpdate(int diary_seq, Model model) {
		
		// 특정 하나의 게시글 정보를 가져오기
		diary vo = mapper.diaryContent(diary_seq);
		
		// 저장(객체 바인딩)
		model.addAttribute("diary", vo);
		
		// boardUpdate.jsp로 이동
		// /WEB-INF/views/boardUpdate.jsp
		return "diaryUpdate";
	}
	
	// Update 시켜주는 메서드
	// form 태그로 접근 (title, idx, content)
	
	@RequestMapping("/diaryUpdate.do")
	public String boardUpdate(diary vo,HttpServletRequest request) {
		
		float pos = Float.valueOf(request.getParameter("pos"));
		float neg = Float.valueOf(request.getParameter("neg"));
		// 사용자가 입력한 데이터로, update
	
		vo.setDiary_pos(pos);
		vo.setDiary_neg(neg);
		mapper.diaryUpdate(vo);
		
		// 상세보기 페이지 이동
		//return "boardContent.do/" + vo.getIdx();
		
		// 목록 페이지 이동
		 return "redirect:/diary.do";
	}
	
	
}
	
	

