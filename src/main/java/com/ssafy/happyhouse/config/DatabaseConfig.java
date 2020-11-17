package com.ssafy.happyhouse.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration	// 환경설정 클래스로 설정
@MapperScan(	// impl을 없애고 interface자체로 사용
		basePackages = "com.ssafy.happyhouse.dao"
)
public class DatabaseConfig {}