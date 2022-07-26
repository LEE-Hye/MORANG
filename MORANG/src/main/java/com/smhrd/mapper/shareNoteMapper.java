package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.smhrd.domain.shareNote;

public interface shareNoteMapper {
	public List<shareNote> shareNoteList();

	public void shareNoteInsert(shareNote vo);
	
	public shareNote shareNotedetail(int note_seq);
	
	public int shareNoteUpdate(shareNote vo);
	

	public int shareNoteDelete(int note_seq);
}
