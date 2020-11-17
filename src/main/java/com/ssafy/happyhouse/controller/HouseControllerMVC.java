package com.ssafy.happyhouse.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.service.HouseServiceImpl;
import com.ssafy.happyhouse.service.NoticeService;
import com.ssafy.happyhouse.service.NoticeServiceImpl;
import com.ssafy.happyhouse.util.PageNavigation;

@WebServlet("/house.do")
public class HouseControllerMVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HouseService houseService = null;
	private NoticeService noticeService = null;
	public void init() {
		houseService = new HouseServiceImpl();
		noticeService = new NoticeServiceImpl();

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		
		if("getDeal".equals(act)) {
			getDeal(request, response);
		} else if("getInfo".equals(act)) {
			getInfo(request, response);
		} else if("mvwritenotice".equals(act)) {
			response.sendRedirect(root + "/notice/write.jsp");
		} else if("writenotice".equals(act)) {
			WriteNotice(request, response);
		} else if("listnotice".equals(act)) {
			listNotice(request, response);
		} else if("mvmodifynotice".equals(act)) {
			moveModifyNotice(request, response);
		} else if("modifynotice".equals(act)) {
			modifyNotice(request, response);
		} else if("deletenotice".equals(act)) {
			deleteNotice(request, response);
		} else if("".equals(act)) {
			response.sendRedirect(root);
			
		}
	}//프로세스.
	
	private void WriteNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto != null) {
			NoticeDto noticeDto = new NoticeDto();
			noticeDto.setUserid(memberDto.getUserid());
			noticeDto.setSubject(request.getParameter("subject"));
			noticeDto.setContent(request.getParameter("content"));
			
			try {
				noticeService.writeNotice(noticeDto);
				path = "/notice/writesuccess.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "글작성중 문제가 발생했습니다.");
				path = "/error/error.jsp";
			}
		} else {
			request.setAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);

	}
	private void deleteNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		int noticeno = Integer.parseInt(request.getParameter("noticeno"));
		
		try {
			noticeService.deleteNotice(noticeno);
			path = "/house.do?act=listnotice&key=&word=";
			response.sendRedirect(request.getContextPath() + path);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
			path = "/error/error.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	private void modifyNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setNoticeno(Integer.parseInt(request.getParameter("noticeno")));
		noticeDto.setSubject(request.getParameter("subject"));
		noticeDto.setContent(request.getParameter("content"));
		
		try {
			noticeService.modifyNotice(noticeDto);
			path = "/house.do?act=listnotice&key=&word=";
			response.sendRedirect(request.getContextPath() + path);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "글작성중 문제가 발생했습니다.");
			path = "/error/error.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	private void moveModifyNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		int noticeno = Integer.parseInt(request.getParameter("noticeno"));
		
		try {
			NoticeDto noticeDto = noticeService.getNotice(noticeno);
			request.setAttribute("notice", noticeDto);
			path = "/notice/modify.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	private void listNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		String key = request.getParameter("key");
		String word = request.getParameter("word");
		try {
			List<NoticeDto> list = noticeService.listNotice(key, word);
			request.setAttribute("notices", list);
			path = "/notice/list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}


	private void getDeal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/apt/dealinfo.jsp";
		int currentPage = Integer.parseInt(request.getParameter("pg"));
		String spp = request.getParameter("spp");
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);//sizePerPage
		String key = request.getParameter("key");
		String word = request.getParameter("word");
		System.out.println(currentPage + " , " + sizePerPage + " , " + key + " ,  " + word);
		try {
			List<HouseDeal> list = houseService.get_Deal(currentPage, sizePerPage,key, word);
			PageNavigation pageNavigation = houseService.makePageNavigation(currentPage, sizePerPage, key, word);
			request.setAttribute("dealInfo", list);
			request.setAttribute("navigation", pageNavigation);
			request.setAttribute("key", key);
			request.setAttribute("word", word);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "거래정보를 가져오지 못했습니다..");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}//거래정보 가져오기.
	
	private void getInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/apt/houseinfo.jsp";
		String dong = request.getParameter("dong");
		String AptName = request.getParameter("AptName");
		String rootPath = this.getClass().getResource("").getPath();
		rootPath = rootPath.substring(0, rootPath.indexOf("WEB-INF"));
		File imgFolder = new File(rootPath + "/img");
		System.out.println(dong + " , " + AptName);
		try {
			HouseInfo houseInfo = houseService.get_Info(dong,AptName);
			request.setAttribute("houseInfo", houseInfo);
			String[] fileList = imgFolder.list(new FilenameFilter() {
				@Override
				public boolean accept(File dir, String name) {
					return houseInfo.getImg().contains(name.substring(0, name.indexOf(".")));
				}
			});
			if (fileList != null) {
				for (String string : fileList) {
					houseInfo.setImg(string);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "주택정보를 가져오지 못했습니다.");
			path = "/error/error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}//주택정보 가져오기.
}
