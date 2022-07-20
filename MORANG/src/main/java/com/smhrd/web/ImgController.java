package com.smhrd.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ImgController {
	
	
		
		
		// 이거 글 목록
		@RequestMapping("/upload.do")
		public String upload() {
			
			
			return "upload";
		}
		@PostMapping("/imgup.do")
		public String impgup() {
			
			
			return "imgup";
		}
		
		
	}

