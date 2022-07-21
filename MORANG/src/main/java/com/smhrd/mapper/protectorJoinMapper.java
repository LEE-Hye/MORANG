package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.smhrd.domain.protectorJoin;

public interface protectorJoinMapper {
	
	public List<protectorJoin> protectorJoinList();
	
	public int protectorJoinInsert(protectorJoin vo); 

	@Delete("delete from mr_user where p_id = #{p_id}")
	public int protectorJoinDelete(int p_id);
	
	public int protectorJoinUpdate(protectorJoin vo);
}
