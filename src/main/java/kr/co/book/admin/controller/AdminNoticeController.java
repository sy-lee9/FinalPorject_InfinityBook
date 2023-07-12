package kr.co.book.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.admin.service.AdminNoticeService;
import kr.co.book.notice.dto.NoticeDTO;
import kr.co.book.notice.service.NoticeService;


@Controller
public class AdminNoticeController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminNoticeService service;
	@Autowired NoticeService nservice;
	
	// 공지 작성 이동
	@RequestMapping(value = "/noticewrite.go")
	public String noticewriteForm() {				
		return "/notice/noticewrite";
	}
	
	// 공지 작성 하기
	@RequestMapping(value = "/noticewrite.do")
	public String noticewrite(@RequestParam HashMap<String, Object> params, HttpSession session) {
		String loginIdx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", loginIdx);
		
		service.noticewrite(params);
		
		return "/notice/noticelist";
	}
	
	// 공지  수정 이동
	@RequestMapping(value = "/noticeupdate.go")
	public ModelAndView noticeupdateForm(@RequestParam String notice_idx) {			
		
		ModelAndView mav = new ModelAndView("/notice/noticelist");
		NoticeDTO dto =  nservice.noticedetail(notice_idx);
		
		if (dto != null) {
			mav.addObject("notice", dto);
			mav.setViewName("/notice/noticeupdate");
		}
		
		return mav;
	}
	
	// 공지 수정
	@RequestMapping(value = "/noticeupdate.do")
	public ModelAndView noticewrite(@RequestParam HashMap<String, Object> params) {
		
		ModelAndView mav = new ModelAndView("/notice/noticelist");		
		service.noticeupdate(params);
		
		return mav;
	}
	
	// 공지 블라인드
	@RequestMapping(value = "/noticedel.do")
	public ModelAndView noticedel(@RequestParam String notice_idx) {
		
		ModelAndView mav = new ModelAndView("/notice/noticelist");					
		service.noticedel(notice_idx);
		
		return mav;
	}
	
	
}
