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
import com.smhrd.mapper.protectorJoinMapper;
import com.smhrd.domain.Join;
import com.smhrd.domain.protectorJoin;

@Controller
public class protectorJoinController {

	@Autowired
	protectorJoinMapper mapper;
	
	 @Autowired
	 JoinMapper mapper2;

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
	
	
	  @PostMapping("/login2.do")
	   public String login2(HttpServletResponse response,protectorJoin invo, HttpSession session) throws Exception{
		   response.setContentType("text/html; charset=euc-kr");
		   PrintWriter out = response.getWriter();

		   
		  protectorJoin loginMember2 = null;
		  loginMember2=mapper.login2(invo);

		  

		  
		  
		  if(loginMember2!=null) {
			  String u_id=loginMember2.getU_id();
			  session.setAttribute("protectorMember", loginMember2);
			  Join loginMember=mapper2.prologin(u_id);
			  session.setAttribute("loginMember", loginMember);
			  return "redirect:/Main.do";
		  }
		  else {
			  out.println("<script>alert('아이디와 비밀번호를 다시 확인해주세요');location.href='join.do'</script>");
			  out.flush();
			  return "redirect:/join.do";
		  }
	      
	      
	   }
}