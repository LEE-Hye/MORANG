package com.smhrd.domain;

import com.sun.istack.internal.Nullable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor

public class diary {
	private int diary_seq;
	
	@NonNull
	private String diary_title;
	
	@NonNull
	private String diary_content;
	
	@Nullable
	private String u_id;
	
	private String diary_date;
	
	private String weather;
}