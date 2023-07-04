package kr.co.book.transaction.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.transaction.service.TransactionListService;

@Controller
public class TransactionListController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired TransactionListService service;

	@GetMapping(value = "/search.do")
	public String search(
			String Query, String QueryType, Model model) {
		
 // http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?
 // ttbkey=ttbtyhn00000921001&Query=안녕&QueryType=Keyword&
 // MaxResults=100&Start=1&Cover=Big&SearchTarget=Book&output=JS
 // &Version=20131101
		
		Map<String, Object> result = service.bookSearch(Query, QueryType);
		model.addAttribute("result", result);
		
		return "BookSearchResult";
		
	}
	
	@GetMapping(value = "/searchUser.do")
	public String searchUser(
			String Isbn, Model model) {
		
		logger.info("Isbn = "+Isbn);
		
		model.addAttribute("list", service.searchUser(Isbn));
		
		
		return "BookSearchResultUser";
		
	}
	
	@GetMapping(value = "/searchDetail.do")
	public String searchDetail(
			String LIBRARY_IDX, Model model) {
		
		logger.info("LIBRARY_IDX = "+LIBRARY_IDX);
		
		model.addAttribute("book", service.searchDetail(LIBRARY_IDX));
		
		
		return "BookSearchResultDetail";
		
	}
	
	@GetMapping(value = "/TransactionRent.do")
	public String TransactionRent(String LIBRARY_IDX, Model model) {
		
		model.addAttribute("book", service.rent(LIBRARY_IDX));
		
		return "TransactionRent";
	}
	
	@GetMapping(value = "/TransactionChange.do")
	public String TransactionChange(String LIBRARY_IDX, Model model) {
		
		model.addAttribute("book", service.change(LIBRARY_IDX));
		
		return "TransactionChange";
	}


}
