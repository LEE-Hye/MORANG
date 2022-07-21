package com.smhrd.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data                // 기본 메서드(Getter/Setter/toString) 생성
@AllArgsConstructor  // 모든 필드를 요소로 갖는 생성자 생성
@NoArgsConstructor   // 기본생성자
@RequiredArgsConstructor  // 필요한 필드만 요소로 갖는 생성자 생성
public class protectorJoin {
	
	@NonNull
	private String p_id;
	@NonNull
	private String p_pw;
	@NonNull
	private String p_name;
	@NonNull
	private String p_phone;
	@NonNull
	private String p_birthdate;	
	@NonNull
	private String u_id;
	
	private String u_joindate;	
		
}
