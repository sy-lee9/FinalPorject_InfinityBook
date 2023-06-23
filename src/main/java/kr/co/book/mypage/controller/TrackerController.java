package kr.co.book.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.book.mypage.service.TrackerService;

@Controller
public class TrackerController {
	
	@Autowired TrackerService TrackerService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "tracker")
	public String trackerSearch(String title) {
		TrackerService.search(title);
		return "tracker/trackerSearch";
	}

}
