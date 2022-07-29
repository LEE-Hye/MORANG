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
public class shareNote {
	
	private int note_seq;
	
	@NonNull
	private String note_title;
	
	@NonNull
	private String note_content;
	
	@NonNull
	private String u_id;
	
	private String note_date;
	
	private String note_color;
}
