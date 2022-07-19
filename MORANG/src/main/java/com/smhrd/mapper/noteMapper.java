package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.note;

public interface noteMapper {
	public List<note> noteList();
	public int noteInsert(note vo);
}
