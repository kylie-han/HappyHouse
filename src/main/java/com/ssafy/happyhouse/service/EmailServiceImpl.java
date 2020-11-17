package com.ssafy.happyhouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {
  
    @Autowired
    public JavaMailSender emailSender;
    
    @Override
    public boolean sendPwd(String to, String userid, String pwd) {
    	SimpleMailMessage message = new SimpleMailMessage();
    	message.setTo(to);
    	message.setSubject(userid + "님의 패스워드입니다.");
    	message.setText(userid + "님의 패스워드는 " + pwd + " 입니다.");
    	emailSender.send(message);
    	return true;
    }
 
}