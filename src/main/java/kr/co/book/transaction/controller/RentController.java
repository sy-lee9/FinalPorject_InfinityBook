package kr.co.book.transaction.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.transaction.service.RentService;

@Controller
public class RentController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired RentService service;
	
	// 대여 신청
	@RequestMapping(value="/rentapply.do", method = RequestMethod.POST)
	public String rentapply(HttpSession session, @RequestParam HashMap<String, String>params) {
		
		logger.info("{}",params);
		String MEMBER_IDX = session.getAttribute("MEMBER_IDX").toString();
		params.put("MEMBER_IDX", MEMBER_IDX);
		service.rentapply(params);
		
		return "home";
	}
	
	// 대여 약속 시
	@RequestMapping(value="/rentreservation.do")
	public String rentreservation(@RequestParam HashMap<String, Object> params, HttpSession session) {
		
		params.put("MOD_MEMBER_IDX", (session.getAttribute("MEMBER_IDX").toString()));
		
		service.rentreservation(params);
		
		return "libraryDone";
	}
	

	
}
