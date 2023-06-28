package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.service.TrackerService;

@Controller
public class TrackerController {
	
	@Autowired TrackerService TrackerService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	//트래커에 추가할 책 검색 페이지 이동
	@RequestMapping(value = "/tracker/trackerSearch.go")
	public String tracker() {		
		return "/tracker/trackerSearch";
	}
	
	//트래커에 추가할 책 검색
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
	
	//읽은 책 등록
	@GetMapping(value = "/tracker/trackerAddReadBook.ajax")
	@ResponseBody
	public HashMap<String, Object> trackerAddReadBook(HttpSession session, @RequestParam HashMap<String, Object> params) {
		logger.info("params : "+params);
		
		HashMap<String, Object> map =  new HashMap<String, Object>();
		session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
		logger.info("loginIdx : "+loginIdx);
		
		boolean success = TrackerService.trackerAddReadBook(params);
		
		map.put("success",success);
		return map;
	}
	
	//읽고 있는 책 등록 페이지 이동
	@GetMapping(value = "/tracker/trackerAddReadingBook.go")
	public String trackerAddReadingBookGo(String isbn, Model model) {	
		
		model.addAttribute("isbn",isbn);
		return "/tracker/trackerAddReadingBook";
	}
	
	//읽고 있는 책 등록 페이지에 총페이지 수 가져가기
	@GetMapping(value = "/tracker/getTotalPage.ajax")
	@ResponseBody
	public HashMap<String, Object> getTotalPage(HttpSession session, @RequestParam HashMap<String, Object> params) {
		logger.info("params : "+params);
		
		HashMap<String, Object> map =  new HashMap<String, Object>();
		
		session.setAttribute("loginIdx", 3);
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
		logger.info("loginIdx : "+loginIdx);
		
		int totalPage = TrackerService.getTotalPage(params);
		logger.info("totalPage : "+totalPage);

		map.put("totalPage",totalPage);
		return map;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
