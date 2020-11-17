package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.MemberDto;

@Mapper
public interface LoginMapper {

	public MemberDto login(String userid, String userpwd) throws SQLException;
	
	public int join(MemberDto memberDto) throws SQLException;

	public int modify(MemberDto memberDto);

	public int withdrawal(String userid);

	public String sendPwd(String userid, String email);

}
