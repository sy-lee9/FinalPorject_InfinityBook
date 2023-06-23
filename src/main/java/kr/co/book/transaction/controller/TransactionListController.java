package kr.co.book.transaction.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.transaction.service.TransactionListService;

@Controller
public class TransactionListController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final TransactionListService service;
	
	public TransactionListController(TransactionListService service) {
		this.service = service;
	}
	
	
	
	@GetMapping(value = "/search.do")
	public HashMap<String, String> search(@RequestParam String search) {
		
 // http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?
 // ttbkey=ttbtyhn00000921001&Query=안녕&QueryType=Keyword&
 // MaxResults=100&Start=1&Cover=Big&SearchTarget=Book&output=JS
 // &Version=20131101
		
		return service.bookSearch(search);
		
	}

}
