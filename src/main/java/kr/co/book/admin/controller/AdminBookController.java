package kr.co.book.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.admin.service.AdminBookService;

@Controller
public class AdminBookController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AdminBookService adminBookService;
	
	@RequestMapping("/adminBook")
	public String adminBook(){
		return "/admin/book";
	}
	
	@RequestMapping("/adminBookList.ajax")
	@ResponseBody
	public HashMap<String, Object> adminBookListAjax(@RequestParam String page,@RequestParam String searchText){
		logger.info("searchText : "+searchText);
		HashMap<String, Object> adminBook = adminBookService.adminBookList(page,searchText);
		
		return adminBook;
	}
	
}
