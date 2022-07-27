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
		
		int cmt_seq =  mapper.selectmaxcmt_seq();
		if(cmt_seq>0) {
			
		}
		else {
			cmt_seq=0;
		}
		
		cmt_seq++;
		vo.setCmt_seq(cmt_seq);
		System.out.println(vo.getC_seq());
		System.out.println(vo.getCmt_seq());
		mapper.commentInsert(vo);
		
		return "redirect:/boardContent.do/"+vo.getC_seq();
	}
	

}