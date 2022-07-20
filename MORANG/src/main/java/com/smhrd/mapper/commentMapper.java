package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.smhrd.domain.comment;

public interface commentMapper {

	public List<comment> commentList(); 
	
	public int commentInsert(comment vo);
	
	public comment commentContent(int cmt_seq);
	
	@Delete("delete from mr_comment where cmt_seq = #{cmt_seq}")
	public int commentDelete(int cmt_seq);
	
	public int commentUpdate(comment vo);

}
