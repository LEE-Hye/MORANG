
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
	
	@NonNull
	private String u_id;
	
	private String diary_date;
	@NonNull
	private String weather;
	
	private String diary_deep;
	@NonNull
	private float diary_pos;
	@NonNull
	private float diary_neg;
	
	private String filename1;

	public diary(@NonNull float diary_pos, @NonNull float diary_neg) {
		super();
		this.diary_pos = diary_pos;
		this.diary_neg = diary_neg;
	}
	
	
	
}