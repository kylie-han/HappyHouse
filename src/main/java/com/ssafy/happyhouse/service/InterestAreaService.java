package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.InterestAreaDTO;

public interface InterestAreaService {

	public void addInterest(InterestAreaDTO vo); //관심지역이 비어있을떄 추가
	public void delInterest(String userid,String dongName); //관심지역 제거
	public List<InterestAreaDTO> searchInterest(String userid); //현재 사용자 관심지역 출력
}
