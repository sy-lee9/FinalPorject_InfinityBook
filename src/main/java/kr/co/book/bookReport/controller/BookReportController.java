package kr.co.book.bookReport.controller;

import java.util.ArrayList;
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
	
	@PostMapping(value="/BookReportChange.do")
	public String BookReportChange(HttpSession session,@RequestParam HashMap<String, Object> params,
			Model model) {
		
		String member_idx = session.getAttribute("loginIdx").toString();
		params.put("member_idx", member_idx);
		
		
		return service.report(params);
	}
	
	@GetMapping(value="/BookReportWrite.go")
	public String WriteBookReport() {
		
		return "BookReportWrite";
	}
	
	@GetMapping(value="/BookReportChange.go")
	public String ChangeBookReport() {
		
		return "BookReportChange";
	}
	
	@GetMapping(value="/BookReportList.go")
	public String BookReportList(Model model) {
		
		ArrayList<BookReportDTO> list = service.bookReportList();
		model.addAttribute("report", list);
		
		return "BookReportList";
	}
	
	@GetMapping(value="/BookReportDetail")
	public String BookReportDetail(String book_report_idx, Model model) {
		
		BookReportDTO dto = service.bookReportDetail(book_report_idx);
		HashMap<String,Object> bookinfo = service.getBookInfo(dto.getIsbn());
		model.addAttribute("book", bookinfo);
		model.addAttribute("report", dto);
		
		return "BookReportDetail";
	}
	
	@RequestMapping("/bookReplyList.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyList(@RequestParam String page,@RequestParam String club_idx) {
		HashMap<String, Object> reply = service.replyList(page,club_idx);
		return reply; 
	}
	
	@RequestMapping("/bookReplyWrite.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyWrite(@RequestParam String club_idx,@RequestParam String reply_content,HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx")); 
		service.bookReplyWrite(member_idx,reply_content,club_idx);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/bookReplyDelete.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyDelete(@RequestParam String reply_idx) {
		
		service.bookReplyDelete(reply_idx);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	
	@RequestMapping("/bookReplyUpdate.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReplyUpdate(@RequestParam String reply_idx,@RequestParam String reply_content) {
		
		service.bookReplyUpdate(reply_idx,reply_content);
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/bookReReply.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubReReply(@RequestParam String reply_idx,@RequestParam String reply_content,HttpSession session) {
		String member_idx = String.valueOf(session.getAttribute("loginIdx")); 
		
		service.bookReReply(member_idx,reply_idx,reply_content);
		
		HashMap<String, Object> reply = new HashMap<String, Object>();
		reply.put("success", true);
		return reply; 
	}
	
	@RequestMapping("/bookreReplyList.ajax") 
	@ResponseBody
	public HashMap<String, Object> reReplyList(@RequestParam String reply_idx) {
		HashMap<String, Object> reReply = service.bookreReplyList(reply_idx);
		return reReply; 
	}
	


}
