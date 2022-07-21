package com.smhrd.web;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.domain.note;
import com.smhrd.mapper.noteMapper;

@Controller
public class noteController {

	@Autowired
	noteMapper mapper;
	
	@RequestMapping("/note.do")
	public String noteList(Model model) {
		
		List<note> list = mapper.noteList();
		
		model.addAttribute("list", list);
		
		return "note";
	}
	
	@GetMapping("/noteInsert.do")
	public String noteInsert() {
		return "noteInsert";
	}
	
	@PostMapping("/noteInsert.do")
	public String noteInsert(note vo,HttpServletRequest request,HttpServletResponse response) {
		
		String title="";
		String id="";
		String content="";
		 
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String realFolder = "";
		String filename1 = "";
		int maxSize = 1024*1024*5;
		String encType = "euc-kr";
		String savefile = "img";
		
		realFolder="C:/Users/smhrd/git/MR/MORANG/src/main/webapp/resources/img";
		try{
			 MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			 Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename1 = multi.getFilesystemName(file1);
		     title=multi.getParameter("title");
		     id=multi.getParameter("id");
		     content=multi.getParameter("content");
		}catch(Exception e){
			e.printStackTrace();
		}
		String fullpath = "resources/img/"+filename1;
		vo.setTitle(title);
		vo.setContent(content);
		vo.setId(id);
		vo.setFilename1(fullpath);
		mapper.noteInsert(vo);
		
		return "redirect:/note.do";
	}
	
}

