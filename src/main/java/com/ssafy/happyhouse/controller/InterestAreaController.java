package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.happyhouse.dto.InterestAreaDTO;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.InterestAreaService;

@Controller
public class InterestAreaController {

	@Autowired
	InterestAreaService interestareaService;
	
	@PostMapping(value="/addInterest")
	public String addInterest(InterestAreaDTO dto, HttpSession session) {
		System.out.println(dto);
		MemberDto user = (MemberDto)session.getAttribute("userinfo");
		System.out.println(user.getUserid());
		interestareaService.addInterest(dto);
		return "redirect:/searchInterest/"+user.getUserid();
	}
	
	@GetMapping(value="/mvinterest")
	public String mvinterest() {
		return "interestarea/makeinterest";
	}
	
	@GetMapping(value="/delInterest/{userid}/{dongName}")
	public String delInterest(@PathVariable String userid, @PathVariable String dongName) {
		interestareaService.delInterest(userid, dongName);
		return "redirect:/searchInterest/"+userid;
	}
	
	@GetMapping(value="/searchInterest/{userid}")
	public String searchInterest(@PathVariable String userid, HttpSession session) {
		System.out.println(userid);
		List<InterestAreaDTO> interestlist = interestareaService.searchInterest(userid);
		session.setAttribute("interestlist", interestlist);
		System.out.println("세션생성완료");
		return "interestarea/listinterest";
	}
	
	
	

}
