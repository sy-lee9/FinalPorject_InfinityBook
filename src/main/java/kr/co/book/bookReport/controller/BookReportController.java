package kr.co.book.bookReport.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.bookReport.dto.BookReportDTO;
import kr.co.book.bookReport.service.BookReportService;

@Controller
public class BookReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BookReportService service;
	
	
	@PostMapping(value="/BookReportWrite.do")
	public String BookReportWrite(HttpSession session,@RequestParam HashMap<String, Object> params,
			Model model) {
		
		String member_idx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", member_idx);
		
		
		return service.report(params);
	}
	
	@GetMapping(value="/BookReportWrite.go")
	public String WriteBookReport() {
		
		return "BookReportWrite";
	}
	
	@GetMapping(value="/BookReportDetail")
	public String BookReportDetail(String book_report_idx, Model model) {
		
		BookReportDTO dto = service.bookReportDetail(book_report_idx);
		HashMap<String,Object> bookinfo = service.getBookInfo(dto.getIsbn());
		
		
		
		model.addAttribute("report", dto);
		
		return "BookReportDetail";
	}


}
