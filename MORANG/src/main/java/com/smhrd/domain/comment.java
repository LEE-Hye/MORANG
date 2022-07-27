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

public class comment {
	
	private int cmt_seq; // 댓글 번호
	
	private int c_seq; // 게시물 번호
	
	@NonNull
	private String cmt_content; // 댓글 내용
	
	private String cmt_date; // 댓글 작성일
	@NonNull
	private String u_id; // 작성자
	
	public comment(int cmt_seq, @NonNull String cmt_content, @NonNull String u_id) {
		super();
		this.cmt_seq = cmt_seq;
		this.cmt_content = cmt_content;
		this.u_id = u_id;
	}

	
	
	
	
	
}