package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.mypage.service.DepositService;

@Controller
public class DepositController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired DepositService depositService;
	
	@RequestMapping("/deposit")
	public String deposit(HttpSession session) {
		session.setAttribute("loginIdx", "1");
		session.setAttribute("loginNickname", "명아");
		return "/Deposit/deposit";
	}
	

	 @RequestMapping("/depositUseList.ajax") 
	 @ResponseBody
	 public HashMap<String, Object> depositUseListAjax(@RequestParam String page,HttpSession session) {
		 String member_idx = (String) session.getAttribute("loginIdx"); 
		 HashMap<String, Object> list = depositService.depositUseList(member_idx,page);
		 return list; 
	 }
	 
	 @RequestMapping("/depositMinus.go")
	 public String depositMinus(@RequestParam HashMap<String, String> params) {
		 logger.info("Deposit 출금 정보 : " + params);
		 
		 return "/Deposit/depositMinus";
	 }
	 
	 @RequestMapping("/depositPlus.go")
	 public String depositPlus(@RequestParam HashMap<String, String> params) {
		 logger.info("Deposit 입금 정보 : " + params);
		 
		 return "/Deposit/depositPlus";
	 }
	

}
