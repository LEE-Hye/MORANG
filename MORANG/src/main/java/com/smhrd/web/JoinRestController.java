package com.smhrd.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.domain.Join;
import com.smhrd.mapper.JoinMapper;

@RestController
public class JoinRestController {

   @Autowired
   JoinMapper mapper;

   @RequestMapping("/joincheck1.do")
   public int joincheck1(String u_id) {
	  int result = 1;
	  Join u_idcheck= null;
	   
	  u_idcheck = mapper.joincheck1(u_id);
	  if(u_idcheck!=null) {
		  result=0;
	  }
	  
      return result;
   }
   @RequestMapping("/joincheck2.do")
   public int joincheck2(String p_id) {
	  System.out.println(p_id);
	  int result = 1;
	  Join p_idcheck= null;
	   
	  p_idcheck = mapper.joincheck2(p_id);
	  if(p_idcheck!=null) {
		  result=0;
	  }
	  
      return result;
   }
   
}