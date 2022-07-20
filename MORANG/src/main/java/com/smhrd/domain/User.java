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

public class User {

	@NonNull
	private String u_id;
	
	@NonNull
	private String u_pw;
	
	@NonNull
	private String u_name;
	
	@NonNull
	private String u_nick;
	
	@NonNull
	private String u_phone;
	
	private String u_brithdate;
	
	private int u_joindate;
	
}
