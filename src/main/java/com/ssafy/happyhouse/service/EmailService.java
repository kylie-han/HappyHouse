package com.ssafy.happyhouse.service;

public interface EmailService {

	public boolean sendPwd(String to, String userid, String pwd);

}
