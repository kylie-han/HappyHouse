package com.ssafy.happyhouse.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginMapper mapper;
	@Override
	public MemberDto login(String userid, String userpwd) throws Exception {
		return mapper.login(userid, userpwd);
	}

	@Override
	public boolean join(MemberDto memberDto) throws SQLException {
		int result = mapper.join(memberDto);
		if (result == 1) return true;
		return false;
	}

	@Override
	public boolean modify(MemberDto memberDto) {
		int result = mapper.modify(memberDto);
		if (result == 1) return true;
		return false;
	}

	@Override
	public boolean withdrawal(String userid) {
		int result = mapper.withdrawal(userid);
		if (result == 1) return true;
		return false;
		
	}

	@Override
	public void info(String userid) throws Exception {
		if (userid == null) {
			throw new Exception();
		}
	}

	@Override
	public String sendPwd(String userid, String email) {
		return mapper.sendPwd(userid, email);
	}

}
