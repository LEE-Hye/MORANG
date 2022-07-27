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
	public chatbotEmotion(@NonNull float fear, @NonNull float surprise, @NonNull float angry, @NonNull float sadness,
			@NonNull float neutral, @NonNull float happiness, @NonNull float disgust) {
		super();
		this.fear = fear;
		this.surprise = surprise;
		this.angry = angry;
		this.sadness = sadness;
		this.neutral = neutral;
		this.happiness = happiness;
		this.disgust = disgust;
	}
	
	
	
}
