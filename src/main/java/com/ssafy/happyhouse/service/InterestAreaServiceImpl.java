package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.InterestAreaDTO;
import com.ssafy.happyhouse.mapper.InterestAreaMapper;

@Service
public class InterestAreaServiceImpl implements InterestAreaService {

	
	@Autowired
	InterestAreaMapper mapper;
	
	
	@Override
	public void addInterest(InterestAreaDTO vo) {
		mapper.addInterest(vo);
		System.out.println("관심지역 추가완료");
	}

	@Override
	public void delInterest(String userid, String dongName) {
		mapper.delInterest(userid, dongName);
		System.out.println(userid+"의"+dongName+"이 제거되었습니다!");		
	}

	@Override
	public List<InterestAreaDTO> searchInterest(String userid) {
		List<InterestAreaDTO> list = mapper.searchInterest(userid);
		System.out.println(userid+" 에 대한 관심지역정보입니다.");
		return list;
	}

}
