package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.chatbotEmotion;
import com.smhrd.domain.mot;

public interface MainMapper {
	
	public mot motList();
	
	public int chatemotioninsert(chatbotEmotion vo);
	
	public chatbotEmotion chatemotionselect(String u_id);
	
	
}
