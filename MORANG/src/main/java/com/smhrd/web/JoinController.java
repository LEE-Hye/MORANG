package com.smhrd.web;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Board;
import com.smhrd.domain.Join;
import com.smhrd.domain.protectorJoin;
import com.smhrd.mapper.JoinMapper;

@Controller
public class JoinController {

   @Autowired
   JoinMapper mapper;
   
   @RequestMapping("/joinList.do") 
	public String joinList( Model model) {

		List<Join> list = mapper.joinList();


		model.addAttribute("list", list);


		return "joinList"; 
	}
   
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

   // 이거 자기가 회원탈퇴
   @RequestMapping("/joinDelete.do")
   public String joinDelete(String u_id) {

      mapper.joinDelete(u_id);

      return "redirect:/join.do";
   }
   
   // 이거 관리자가 추방
   @RequestMapping("/joinDelete2.do")
   public String joinDelete2(String u_id) {

      mapper.joinDelete2(u_id);

      return "redirect:/joinList.do";
   }
   
   // 이건 멤버 상세보기 페이지로 가는 컨트롤러
   @RequestMapping("joinContent.do/{u_id}") //Path Variable의 키값 선언
	public String joinContent(Model model, @PathVariable("u_id") String u_id) {
		Join vo = mapper.joinContent(u_id);
		
		// 객체 바인딩 request 영역에 저장
		model.addAttribute("join", vo);
		
		return "memberList"; // Path Variable을 사용할 때는, 반드시 직접 view를 알려줄것
	}
   
   // 멤버업데이트로 가는 컨트롤러
   @RequestMapping("/joinGoUpdate.do")
	public String joinGoUpdate(String u_id, Model model) {

		// 특정 하나의 멤버 정보를 가져오기
		Join vo = mapper.joinContent(u_id);

		// 저장(객체바인딩)
		model.addAttribute("join", vo);

		// memberUpdate.jsp로 이동
		// /WEB-INF/views/memberUpdate.jsp
		return "memberUpdate";
	}

	@RequestMapping("/joinUpdate.do")
	public String joinUpdate(Join vo) {

		// 사용자가 입력한 데이터로, update
		mapper.joinUpdate(vo);

		// (목록)페이지 이동
		return "redirect:/Main.do";

	}
///////////////////////////////////로그인 /////////////////
   @PostMapping("/login.do")
   public String login(HttpServletResponse response,Join invo, HttpSession session) throws Exception{
	   response.setContentType("text/html; charset=euc-kr");
	   PrintWriter out = response.getWriter();
	   
	   
	  Join loginMember = null;
	  loginMember=mapper.login(invo);
	  protectorJoin pro=new protectorJoin("soohyeonempty", "soohyeonempty", "soohyeonempty", "soohyeonempty", "soohyeonempty", "soohyeonempty");
	  if(loginMember!=null) {
		  System.out.println(loginMember.getU_nick());
		  session.setAttribute("loginMember", loginMember);
		  session.setAttribute("protectorMember", pro);
		  return "redirect:/Main.do";
	  }
	  else {
		  out.println("<script>alert('아이디와 비밀번호를 다시 확인해주세요');location.href='join.do'</script>");
		  out.flush();
		  return "redirect:/join.do";
	  }
      
      
   }
   
   @GetMapping("/logout.do")
   public String logout(HttpSession session) throws Exception{
      // 로그 아웃 처리 - session의 정보를 지운다
      session.removeAttribute("loginMember");
      session.removeAttribute("protectorMember");
      return "redirect:/join.do";
   }
   
}