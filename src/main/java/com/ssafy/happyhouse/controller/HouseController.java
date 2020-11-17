package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.util.PageNavigation;

@Controller
@RequestMapping("/house")
public class HouseController {
   
   @Autowired
   private HouseService service;
   
   @GetMapping(value = "/qna")
   public ModelAndView qna() {
      return new ModelAndView("qna");
   }
   
   @GetMapping(value = "")
   public ModelAndView home() {
      return new ModelAndView("index");
   }
   @PostMapping(value = "/getDeal")
   public ModelAndView getDeal(String pg, String key, String word) throws Exception {
      ModelAndView mv = new ModelAndView();
      int currentPage = Integer.parseInt(pg);
//      int sizePerPage = spp==null? 10 : Integer.parseInt(spp);
      int sizePerPage = 10;
      System.out.println(key +" "+word+" "+currentPage+" "+sizePerPage);
      List<HouseDeal> list = service.get_Deal(currentPage, sizePerPage, key, word);
      PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, key, word);
      mv.addObject("dealInfo", list);
      mv.addObject("navigation", pageNavigation);
      mv.addObject("key", key);
      mv.addObject("word", word);
      mv.setViewName("/apt/dealinfo");
      
      return mv;
   }
   
   @GetMapping(value = "getInfo/{dong}/{aptName}")
   public ModelAndView getInfo(@PathVariable String dong, @PathVariable String aptName) throws Exception {
      ModelAndView mv = new ModelAndView("/apt/houseinfo");
      System.out.println(dong.trim()+" "+ aptName);
      HouseInfo houseInfo = service.get_Info(dong.trim(),aptName);
      System.out.println(houseInfo);
      mv.addObject("houseInfo", houseInfo);
      return mv;
   }
}