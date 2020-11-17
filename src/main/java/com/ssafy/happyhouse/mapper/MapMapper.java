package com.ssafy.happyhouse.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoCodeDto;

@Mapper
public interface MapMapper {

	ArrayList<SidoCodeDto> selectSido() throws Exception;

	ArrayList<SidoCodeDto> selectGugun(String sido) throws Exception;

	ArrayList<HouseInfo> selectDong(String gugun) throws Exception;

	ArrayList<HouseDeal> selectApt(String dong) throws Exception;

}
