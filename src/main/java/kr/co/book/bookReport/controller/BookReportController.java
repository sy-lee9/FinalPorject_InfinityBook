package kr.co.book.bookReport.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.bookReport.service.BookReportService;

@Controller
public class BookReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BookReportService service;
	
	
//	@PostMapping(value="/BookReportWrite.do")
//	public String BookReportWrite(@RequestParam HashMap<String, String> params,
//			Model model) {
//		
//		service.write();
//		
//		return "";
//	}

}
