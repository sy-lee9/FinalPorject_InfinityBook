package kr.co.book.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.mypage.service.MyBookReportService;

@Controller
public class MyBookReportController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MyBookReportService myBookReportService;
	
	@RequestMapping("/myBookreportList.get")
	public String myBookreportList() {	
		return "/Library/myBookreportList";
	}
	
	@RequestMapping("/myBookreportList.ajax")
	@ResponseBody
	public HashMap<String, Object> myBookrpoertListAjax(@RequestParam String page,@RequestParam String searchText,HttpSession session){
		logger.info("searchText : "+searchText);
		String member_idx = (String) session.getAttribute("loginIdx"); 
		HashMap<String, Object> myBookreport = myBookReportService.myBookReportList(member_idx,page,searchText);
		
		return myBookreport;
	}
	
	@RequestMapping("myLikeList.get")
	public String myLikeList() {
		return "/Library/myLikeList";
	}
	
	@RequestMapping("/myLikeList.ajax")
	@ResponseBody
	public HashMap<String, Object> myLikeListAjax(@RequestParam String page,@RequestParam String searchText,HttpSession session){
		logger.info("searchText : "+searchText);
		String member_idx = (String) session.getAttribute("loginIdx"); 
		HashMap<String, Object> myLike = myBookReportService.myLikeList(member_idx,page,searchText);
		
		return myLike;
	}
	
	@RequestMapping("/deleteMyBookreport.ajax")
	@ResponseBody
	public HashMap<String, Object> deleteMyBookreport(@RequestParam(value="delList[]") ArrayList<String> delList,HttpSession session){
		HashMap<String, Object> map = myBookReportService.deleteMyBookreport(delList);
		return map; 
	}
	
	
}
