package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.smhrd.domain.Join;

public interface JoinMapper {
	
	public List<Join> joinList();
	
	public int joinInsert(Join vo); 

	@Delete("delete from mr_user where u_id = #{u_id}")
	public int joinDelete(int u_id);
	
	public int joinUpdate(Join vo);
	
	// 로그인 처리
	public Join login(Join vo);
	
	@Select("select * from mr_user where u_id = #{u_id}")
	public Join joincheck1(String u_id);
	
	@Select("select * from mr_protector where p_id = #{p_id}")
	public Join joincheck2(String p_id);
	
}
