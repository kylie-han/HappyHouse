package com.ssafy.happyhouse.service;

import java.util.ArrayList;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoCodeDto;

public interface MapService {

	ArrayList<SidoCodeDto> selectSido() throws Exception;

	ArrayList<SidoCodeDto> selectGugun(String sido) throws Exception;

	ArrayList<HouseInfo> selectDong(String gugun) throws Exception;

	ArrayList<HouseDeal> selectApt(String dong) throws Exception;

}
