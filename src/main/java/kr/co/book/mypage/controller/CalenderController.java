package kr.co.book.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalenderController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/calender.go")
	public String calenderPageGo() {
		return "calender";
	}

}
