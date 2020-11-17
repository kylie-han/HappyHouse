package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.mapper.HouseMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService{

   @Autowired
   private HouseMapper mapper;
   
   @Override
//   public List<HouseDeal> get_Deal(int firstPage, int nextPage, String key, String word)   
   public List<HouseDeal> get_Deal(int currentPage, int sizePerPage, String key, String word) throws Exception {
      int firstPage = (currentPage - 1) * sizePerPage;
      int nextPage = sizePerPage;
      return mapper.get_Deal(firstPage, nextPage, key, word);
   }

   @Override
   public HouseInfo get_Info(String dong, String AptName) throws Exception {
      return mapper.get_Info(dong, AptName);
   }

   @Override
   public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws Exception {
      PageNavigation pageNavigation = new PageNavigation();
      int naviSize = 10;
      pageNavigation.setCurrentPage(currentPage);
      pageNavigation.setNaviSize(naviSize);
      int totalCount = mapper.getTotalCount(key, word);
      pageNavigation.setTotalCount(totalCount);
      int totalPageCount = (totalCount-1)/sizePerPage + 1;
      pageNavigation.setTotalPageCount(totalPageCount);
      boolean startRange = currentPage<=naviSize;
      pageNavigation.setStartRange(startRange);
      boolean endRange = (totalPageCount-1)/ naviSize * naviSize < currentPage;
      pageNavigation.setEndRange(endRange);
      pageNavigation.makeNavigator();
      return pageNavigation;
   }

}