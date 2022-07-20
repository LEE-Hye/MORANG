package com.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.mapper.JoinMapper;
import com.smhrd.domain.Join;
import com.smhrd.domain.diary;

@Controller
public class JoinController {

	@Autowired
	JoinMapper mapper;

	// 회원가입 페이지로 이동
	@RequestMapping("/join.do")
	public String join() {

		return "join";
	}

	// 이거 회원 가입
	@GetMapping("/joinInsert.do")
	public String joinInsert() {
		return "join";
	}

	@PostMapping("/joinInsert.do")
	public String joinInsert(Join vo) {

		mapper.joinInsert(vo);

		return "redirect:/join.do";
	}

	// 이거 회원삭제 
	@RequestMapping("/joinDelete.do")
	public String joinDelete(int u_id) {

		mapper.joinDelete(u_id);

		return "redirect:/join.do";
	}
}