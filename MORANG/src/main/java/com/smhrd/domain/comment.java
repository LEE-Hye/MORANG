package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@ToString

public class comment {
	
	private int cmt_seq; // 댓글 번호
	
	private int c_seq; // 게시물 번호
	
	@NonNull
	private String cmt_content; // 댓글 내용
	
	private String cmt_date; // 댓글 작성일
	
	private String u_id; // 작성자
	
}