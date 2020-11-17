package com.ssafy.happyhouse.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.service.NoticeService;

@RestController
@RequestMapping("/notice")
public class noticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping(value = "")
	public ModelAndView home() throws Exception {
		ModelAndView mv = new ModelAndView("notice/list");
		mv.addObject("notices", service.listNotice("",""));
		return mv;
	}
	
	@GetMapping(value = "/mvwritenotice")
	public ModelAndView mvWrite() {
		return new ModelAndView("notice/write");
	}
	
	@PostMapping(value = "/writenotice")
	public void writenotice(@RequestBody HashMap<String, Object> map) throws Exception {
		String userid = (String)map.get("userid");
		String subject = (String)map.get("subject");
		String content = (String)map.get("content");
		NoticeDto dto = new NoticeDto();
		dto.setContent(content);
		dto.setSubject(subject);
		dto.setUserid(userid);
		service.writeNotice(dto);
	}
	
	@GetMapping(value = "/listnotice")
	public ModelAndView listnotice(@RequestParam("key") String key,@RequestParam("word") String word) throws Exception {
		System.out.println(key + " " + word);
		ModelAndView mv = new ModelAndView("notice/list");
		mv.addObject("notices", service.listNotice(key, word));
		return mv;
	}
	
	@GetMapping(value = "/deletenotice/{noticeno}")
	public ModelAndView deletenotice(@PathVariable(value="noticeno") String noticeno) throws Exception {
		service.deleteNotice(Integer.parseInt(noticeno));
		ModelAndView mv = new ModelAndView("notice/list");
		mv.addObject("notices", service.listNotice("",""));
		return mv;
	}
	
	@GetMapping(value = "/moveModifyNotice/{noticeno}")
	public ModelAndView moveModifyNotice(@PathVariable(value="noticeno") String noticeno) throws Exception {
		System.out.println(noticeno);
		ModelAndView mv = new ModelAndView("notice/modify");
		NoticeDto dto = service.getNotice(Integer.parseInt(noticeno));
		System.out.println(dto);
		mv.addObject("notice", dto);
		return mv;
	}
	
	@PostMapping(value = "/modifynotice")
	public void modifynotice(@RequestBody HashMap<String, Object> map) throws Exception {
		String userid = (String)map.get("userid");
		String subject = (String)map.get("subject");
		String content = (String)map.get("content");
		int noticeno = Integer.parseInt((String)map.get("noticeno"));
		NoticeDto dto = new NoticeDto();
		dto.setContent(content);
		dto.setSubject(subject);
		dto.setUserid(userid);
		dto.setNoticeno(noticeno);
		service.modifyNotice(dto);
	}
}
