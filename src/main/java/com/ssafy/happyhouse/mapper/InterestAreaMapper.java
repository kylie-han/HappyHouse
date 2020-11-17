package com.ssafy.happyhouse.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ssafy.happyhouse.dto.InterestAreaDTO;

@Mapper
public interface InterestAreaMapper {
	public void addInterest(InterestAreaDTO dto); //관심지역이 비어있을때 추가
	public void delInterest(@Param("userid")String userid,@Param("dongName")String dongName); //관심지역 제거
	public List<InterestAreaDTO> searchInterest(@Param("userid")String userid); //현재 사용자 관심지역 출력
}
