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

import com.smhrd.domain.Join;
import com.smhrd.mapper.JoinMapper;

@Controller
public class JoinController {

   @Autowired
   JoinMapper mapper;

   // 회원가입 페이지로 이동
   @RequestMapping("/join.do")
   public String join() {
      System.out.println("회원가입 페이지 이동 성공");
      return "join";
   }

   // 이거 회원 가입
   @GetMapping("/joinInsert.do")
   public String joinInsert() {
      System.out.println("회원가입 성공");
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
///////////////////////////////////로그인 /////////////////
   @PostMapping("/login.do")
   public String login(Join invo, HttpSession session) throws Exception{
      
	  Join loginMember = null;
	  loginMember=mapper.login(invo);
	  if(loginMember!=null) {
		  System.out.println(loginMember.getU_nick());
		  session.setAttribute("loginMember", loginMember);
		  return "redirect:/Main.do";
	  }
	  else {
		  return "redirect:/join.do";
	  }
      
      
   }
   
   
   
   @GetMapping("/logout.do")
   public String logout(HttpSession session) throws Exception{
      // 로그 아웃 처리 - session의 정보를 지운다
      session.removeAttribute("login");
      return "/join.do";
   }
   
}