package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.smhrd.domain.shareNote;

public interface shareNoteMapper {
	public List<shareNote> shareNoteList(String u_id);

	public void shareNoteInsert(shareNote vo);
	public void shareNoteInsertpro(shareNote vo);
	
	public shareNote shareNotedetail(int note_seq);
	public shareNote shareNotedetailpro(int note_seq);
	
	public int shareNoteUpdate(shareNote vo);
	public int shareNoteUpdatepro(shareNote vo);

	public int shareNoteDelete(int note_seq);
	public int shareNoteDeletepro(int note_seq);
	
	public String shareNoteID(int note_seq);
	
}
