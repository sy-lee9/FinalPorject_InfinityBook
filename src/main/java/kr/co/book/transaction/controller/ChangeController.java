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

import kr.co.book.transaction.service.ChangeService;

@Controller
public class ChangeController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChangeService service;

	// 교환신청
	@RequestMapping(value="/changeapply.do", method = RequestMethod.POST)
	public String changeapply(HttpSession session,@RequestParam HashMap<String, String> params) {
		
		logger.info("{}",params);
		String MEMBER_IDX = session.getAttribute("MEMBER_IDX").toString();
		service.changeapply(MEMBER_IDX,params);				
		
		return "home";
	}
	
	// 교환 약속 시
	@RequestMapping(value="/changereservation.do")
	public void changereservation(@RequestParam HashMap<String, Object> params, HttpSession session) {
		
		params.put("MOD_MEMBER_IDX", (session.getAttribute("MEMBER_IDX").toString()));
		
		service.changereservation(params);		
	}
	
}
