package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoCodeDto;
import com.ssafy.happyhouse.mapper.MapMapper;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	MapMapper mapper;
	
	@Override
	public ArrayList<SidoCodeDto> selectSido() throws Exception {
		return mapper.selectSido();
	}

	@Override
	public ArrayList<SidoCodeDto> selectGugun(String sido) throws Exception {
		return mapper.selectGugun(sido);
	}

	@Override
	public ArrayList<HouseInfo> selectDong(String gugun) throws Exception {
		return mapper.selectDong(gugun);
	}

	@Override
	public ArrayList<HouseDeal> selectApt(String dong) throws Exception {
		return mapper.selectApt(dong);
	}

}
