package kr.co.book.mypage.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.service.TrackerService;

@Controller
public class TrackerController {
	
	@Autowired TrackerService TrackerService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/tracker/trackerSearch.go")
	public String tracker() {		
		return "/tracker/trackerSearch";
	}
	
	@GetMapping(value = "/tracker/trackerSearch.do")
	public ModelAndView trackerBookSearch(String searchType, String searchValue) {	
		logger.info("searchType : {} / searchValue : {}",searchType,searchValue);
		return TrackerService.trackerBookSearch(searchType,searchValue);
	}
	
	//트래커에 완독한 책 추가
	@GetMapping(value = "/tracker/trackerAddReadBook.go")
	public String trackerAddReadBookGo(String isbn, Model model) {	
		logger.info("trackerAddReadBookGo isbn : "+isbn);
		model.addAttribute("isbn",isbn);
		return "/tracker/trackerAddReadBook";
	}
	
	
	@GetMapping(value = "/tracker/trackerAddReadBook.ajax")
	public HashMap<String, Object> trackerAddReadBook(String isbn) {
		logger.info("isbn : "+isbn);
		
		HashMap<String, Object> map =  new HashMap<String, Object>();
		
		boolean success = TrackerService.trackerAddReadBook(isbn);
		
		map.put("success",success);
		return map;
	}
	
	@GetMapping(value = "/tracker/trackerAddReadingBook.go")
	public String trackerAddReadingBookGo(String isbn, Model model) {	
		logger.info("isbn : "+isbn);
		model.addAttribute("isbn",isbn);
		return "/tracker/trackerAddReadingBook";
	}
/*	
	@PostMapping(value = "/tracker/sendReadBookData.ajax")
	public HashMap<String, Object> sendReadBookData(@RequestParam HashMap<String, Object> params){
		logger.info("params : "+params);
		logger.info("params : "+params.get("pubdate")+" / "+params.get("totalPage"));
		return params;
	}
	
	public 
	트래커 추가
	책 테이블에 있는지 확인
	있으면 isbn으로 트래커에 저장
	없으면 책 정보 가져와서 책 테이블에 저장 후 
	트래커에 저장
*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
