package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

public class comment {
	
	private int cmt_seq;
	
	private int c_seq;
	@NonNull
	private String cmt_content;
	
	private String cmt_date;
	
	private String u_id;
	
}