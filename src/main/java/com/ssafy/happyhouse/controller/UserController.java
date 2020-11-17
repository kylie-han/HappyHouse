package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.EmailService;
import com.ssafy.happyhouse.service.LoginService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	LoginService loginService;
	@Autowired
	EmailService emailService;

	@PostMapping(value = "/login")
	public ModelAndView login(MemberDto memberDto, HttpSession session) throws Exception {
		System.out.println(memberDto.getUserid());
		System.out.println(memberDto.getUserpwd());
		memberDto = loginService.login(memberDto.getUserid(), memberDto.getUserpwd());
		session.setAttribute("userinfo", memberDto);
//      if("saveok".equals(idsave)) {
//         
//      }
		return new ModelAndView("/index");
	}

	@GetMapping(value = "logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("index");
	}

	@PostMapping(value = "/mvjoin")
	public String join() {
		return "user/join";
	}

	@PostMapping(value = "/register")
	public ModelAndView join2(MemberDto memberDto) throws SQLException {
		ModelAndView mv = new ModelAndView();
		if (loginService.join(memberDto)) {
			mv.setViewName("index");
			mv.addObject("msg", "반갑습니다 "+memberDto.getUsername()+"님");
		}else {
			mv.setViewName("user/join");
			mv.addObject("msg","회원가입되지 않았습니다.");
		}
		return mv;
	}

	@GetMapping(value = "/info")
	public ModelAndView info() {
		return new ModelAndView("user/userinfo");
	}

	@PostMapping(value = "/modify")
	public ModelAndView modify(MemberDto memberDto) {
		loginService.modify(memberDto);
		return new ModelAndView("index");
	}

	@GetMapping(value = "/modify")
	public ModelAndView getModify() {
		return new ModelAndView("user/userinfo");
	}

	@PostMapping(value = "/mvfindpwd")
	public ModelAndView mvfindPwd() {
		return new ModelAndView("user/findpwd");
	}

	@PostMapping(value = "/findpwd")
	public ModelAndView findpwd(String userid, String email) {
		String pwd = loginService.sendPwd(userid, email);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		if (pwd == null) {
			mv.addObject("msg", "존재하지 않는 정보입니다.");
			return mv;
		}
		// 비밀번호를 메일로 보내주는 부분 => object가 아닌 mail로 보내줄것
		emailService.sendPwd(email, userid, pwd);
		mv.addObject("msg", "등록한 메일에서 비밀번호를 확인하세요.");
		return mv;
	}

	@PostMapping(value = "/withdrawal")
	public ModelAndView withrawal(String userid) {
		loginService.withdrawal(userid);
		return new ModelAndView("index");
	}
}