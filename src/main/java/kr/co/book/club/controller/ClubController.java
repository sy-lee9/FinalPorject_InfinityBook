package kr.co.book.club.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.club.service.ClubService;

@Controller
public class ClubController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubService service;
	
	@RequestMapping(value="/clubInsert.go")
	public String club() {
		logger.info("club 등록 페이지로 이동");
		return "ey/club";
	}
	@PostMapping(value="/clubInsert.do")
	public String clubInsert() {
		logger.info("독서모임 등록하기");
		return service.clubInsert();
	}
	

}
