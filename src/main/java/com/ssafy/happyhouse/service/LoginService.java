package com.ssafy.happyhouse.service;
import java.sql.SQLException;

import com.ssafy.happyhouse.dto.MemberDto;


public interface LoginService {

	public MemberDto login(String userid, String userpwd) throws Exception;

	public boolean join(MemberDto memberDto) throws SQLException;

	public boolean modify(MemberDto memberDto);

	public boolean withdrawal(String userid);

	public void info(String userid) throws Exception;

	public String sendPwd(String userid, String email);

}
