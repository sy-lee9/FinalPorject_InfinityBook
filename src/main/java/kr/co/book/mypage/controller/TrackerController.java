package kr.co.book.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@GetMapping(value = "/tracker/trackerSearch.do")
	public ModelAndView trackerBookSearch(String searchType, String searchValue) {	
		logger.info("searchType : {} / searchValue : {}",searchType,searchValue);
		return TrackerService.trackerBookSearch(searchType,searchValue);
	}
	
	@GetMapping(value = "/tracker/trackerAddReadBook.go")
	public String trackerAddReadBook(String ISBN, Model model) {	
		model.addAttribute("ISBN",ISBN);
		return "/tracker/trackerAddReadBook";
	}
	
	@GetMapping(value = "/tracker/trackerAddReadingBook.go")
	public String trackerAddReadingBook() {		
		return "/tracker/trackerAddReadingBook";
	}
/*	
	@GetMapping(value = "/tracker/trackerAddReadBook.do")
	public 
	트래커 추가
	책 테이블에 있는지 확인
	있으면 isbn으로 트래커에 저장
	없으면 책 정보 가져와서 책 테이블에 저장 후 
	트래커에 저장
*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
