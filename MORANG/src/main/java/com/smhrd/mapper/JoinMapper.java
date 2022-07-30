package com.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.smhrd.domain.Board;
import com.smhrd.domain.Join;

public interface JoinMapper {
	
	public List<Join> joinList(); // selectList()
	
	public int joinInsert(Join vo); 
	
	public Join joinContent(String u_id); // selectOne()

	@Delete("delete from mr_user where u_id = #{u_id}")
	public int joinDelete(String u_id);
	
	@Delete("delete from mr_user where u_id = #{u_id}")
	public int joinDelete2(String u_id);
	
	public int joinUpdate(Join vo);
	
	// 로그인 처리
	public Join login(Join vo);
	
	public Join prologin(String u_id);
	
	@Select("select * from mr_user where u_id = #{u_id}")
	public Join joincheck1(String u_id);
	
	@Select("select * from mr_protector where p_id = #{p_id}")
	public Join joincheck2(String p_id);
	
	// 아이디 찾기, 비밀번호 찾기 
	
	@Select("select u_id from mr_user where u_name= #{u_name} and u_phone= #{u_phone}")
	public Join findid(Join vo);
	
	@Select("select u_pw from mr_user where u_name= #{u_name} and u_phone= #{u_phone}")
	public Join findpw(Join vo);
	
	
}
