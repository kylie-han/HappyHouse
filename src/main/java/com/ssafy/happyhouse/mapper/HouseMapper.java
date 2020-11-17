package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;

@Mapper
public interface HouseMapper {
   /**
    * 아파트 거래 정보를 xml 파일에서 로딩하는 기능 
    */
   //public void loadData();
      
   public List<HouseDeal> get_Deal(int firstPage, int nextPage, String key, String word) throws SQLException;
   public HouseInfo get_Info(String dong, String AptName) throws SQLException;
   public int getTotalCount(String key, String word) throws SQLException;
}