package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@Data                // 기본 메서드(Getter/Setter/toString) 생성
@AllArgsConstructor
@NoArgsConstructor   // 기본생성자
@RequiredArgsConstructor  // 필요한 필드만 요소로 갖는 생성자 생성
public class chatbotEmotion {
	@NonNull
	private String u_id;
	
	private String chatday;
	
	@NonNull
	private float fear;
	@NonNull
	private float surprise;
	@NonNull
	private float angry;
	@NonNull
	private float sadness;
	@NonNull
	private float neutral;
	@NonNull
	private float happiness;
	@NonNull
	private float disgust;
}
