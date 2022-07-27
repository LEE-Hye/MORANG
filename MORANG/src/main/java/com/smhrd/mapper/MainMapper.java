package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.chatbotEmotion;
import com.smhrd.domain.diary;
import com.smhrd.domain.mot;

public interface MainMapper {
	
	public mot motList();
	
	public int chatemotioninsert(chatbotEmotion vo);
	
	public List<chatbotEmotion> chatemotionselect(String u_id);
	
	public List<chatbotEmotion> chatemotionselect2(String u_id);
	
	public List<diary> selectemotion(String u_id);
	
	public List<diary> selectemotion2(String u_id);
	public List<diary> selectemotion3(String u_id);
	public List<diary> selectemotion4(String u_id);
	public List<diary> selectemotion5(String u_id);
	public List<diary> selectemotion6(String u_id);
	public List<diary> selectemotion7(String u_id);
	
}
