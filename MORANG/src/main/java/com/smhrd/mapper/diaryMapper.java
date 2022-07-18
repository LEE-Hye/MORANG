package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.diary;

public interface diaryMapper {
	
	public List<diary> diaryList();
	
	public int diarywrite(diary vo);

}
