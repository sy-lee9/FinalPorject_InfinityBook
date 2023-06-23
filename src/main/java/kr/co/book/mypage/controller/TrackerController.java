package kr.co.book.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.service.TrackerService;

@Controller
public class TrackerController {
	
	@Autowired TrackerService TrackerService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/trackerSearch.go")
	public String tracker() {		
		return "/tracker/trackerSearch";
	}
	
	@RequestMapping(value = "/trackerSearch.do")
	public ModelAndView trackerSearch(String title) {	
		logger.info("title : "+title);
		return TrackerService.search(title);
	}

}
