package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.domain.Board;
import com.smhrd.mapper.BoardMapper;

@RestController // Ajax 요청을 전담해서 처리할 컨트롤러
public class BoardRestController {
	// RestController에서는 @ResponseBody 안붙여도 된다.
	
	
	// DI(Dependency Injection), 의존성 주입
	// BoardController 가 BoardMapper에게 의존을 한다
	@Autowired // 메모리에 있는 객체를 끌어다가 집어넣어라
	BoardMapper mapper;

	// ajax 요청을 받는 Controller
	@RequestMapping("/viewUpdate.do")
	public int viewUpdate(Board vo) {

		// 조회수 수정
		int cnt = mapper.viewUpdate(vo);

		// 성공 or 실패 리턴
		return cnt;
	}

	

}
