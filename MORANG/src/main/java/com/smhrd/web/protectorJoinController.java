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

import com.smhrd.mapper.protectorJoinMapper;
import com.smhrd.domain.protectorJoin;

@Controller
public class protectorJoinController {

	@Autowired
	protectorJoinMapper mapper;

	// 이거 회원 가입
	@GetMapping("/protectorJoinInsert.do")
	public String protectorJoinInsert() {
		return "join";
	}

	@PostMapping("/protectorJoinInsert.do")
	public String protectorJoinInsert(protectorJoin vo) {

		mapper.protectorJoinInsert(vo);

		return "redirect:/join.do";
	}

	// 이거 회원삭제 
	@RequestMapping("/protectorJoinDelete.do")
	public String protectorJoinDelete(int p_id) {

		mapper.protectorJoinDelete(p_id);

		return "redirect:/join.do";
		
		
	}
}