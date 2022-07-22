package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.smhrd.domain.Board;
import com.smhrd.domain.diary;

public interface diaryMapper {
	
	public List<diary> diaryList();
	
	public int diarywrite(diary vo);
	
	public diary diaryContent(int diary_seq);
	
	@Delete("delete from diary3 where diary_seq = #{diary_seq}")
	public int diaryDelete(int diary_seq);
	
	public int diaryUpdate(diary vo);

	 public float diarywriteCon(@Param("pos") float pos, @Param("neg") float neg);
}
