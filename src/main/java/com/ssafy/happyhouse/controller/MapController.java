package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.SidoCodeDto;
import com.ssafy.happyhouse.service.MapService;

@RestController
@RequestMapping("/map")
public class MapController{
	
	@Autowired
	MapService service;
	
	@GetMapping(value = "")
	public ModelAndView home() throws Exception {
		ModelAndView mv = new ModelAndView("apt/map");
		return mv;
	}
	
	@GetMapping(value = "sido")
	public ArrayList<SidoCodeDto> sido() throws Exception {
		System.out.println("sido");
		return service.selectSido();
	}
	
	@GetMapping(value = "gugun")
	public ArrayList<SidoCodeDto> gugun(@RequestParam("sido") String sido) throws Exception {
		System.out.println(sido);
		return service.selectGugun(sido);
	}
	
	@GetMapping(value = "dong")
	public ArrayList<HouseInfo> dong(@RequestParam("gugun") String gugun) throws Exception {
		System.out.println(gugun);
		return service.selectDong(gugun);
	}
	
	@GetMapping(value = "apt")
	public ArrayList<HouseDeal> apt(@RequestParam("dong") String dong) throws Exception {
		return service.selectApt(dong);
	}
}
