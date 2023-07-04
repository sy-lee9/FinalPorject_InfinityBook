package kr.co.book.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.book.mypage.service.DepositService;

@Controller
public class DepositController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired DepositService depositService;
	
	@RequestMapping("/deposit")
	public String deposit(HttpSession session,Model model) {
		String member_idx = (String)session.getAttribute("loginIdx");
		int deposit_now = depositService.depositNow(member_idx); 
		model.addAttribute("deposit_now", deposit_now);
		model.addAttribute("member_idx", member_idx);
		return "/Deposit/deposit";
	}
	

	 @RequestMapping("/depositUseList.ajax") 
	 @ResponseBody
	 public HashMap<String, Object> depositUseListAjax(@RequestParam String page,HttpSession session) {
		 String member_idx = (String) session.getAttribute("loginIdx"); 
		 HashMap<String, Object> list = depositService.depositUseList(member_idx,page);
		 return list; 
	 }
	 
	 @RequestMapping("/depositCharge.ajax")
	 @ResponseBody
	 public void depositCharge(@RequestParam HashMap<String, String> data) {
		 logger.info("chargeData" + data);
		 data.put("deposit_info", "카드 "+data.get("apply_num"));
		 depositService.depositChargedrawReq(data);
	 }
	 
	 
	 @RequestMapping("/depositWithdraw.go")
	 public String depositMinus(@RequestParam HashMap<String, String> withdrawData, Model model) {
		 logger.info("Deposit 출금 정보 : " + withdrawData);
		 		 
		 model.addAttribute("withdrawData", withdrawData);
		 logger.info("Deposit 출금 정보 : " + withdrawData);
		 return "/Deposit/depositWithdraw";
	 }
	 
	 @RequestMapping("/depositWithdrawChk")
	 public String depositWithdrawChk(@RequestParam HashMap<String, String> withdrawData, Model model) {
		 logger.info("Deposit 출금 정보 : " + withdrawData);
		 
		 String member_idx = withdrawData.get("member_idx");
		 String member_pw = withdrawData.get("member_pw");
		 
		 String page = "/Deposit/depositWithdraw";
		 
		 int pwChk = depositService.depositPwChk(member_idx,member_pw);
		 if(pwChk==1) {
			 page = "/Deposit/depositWithdrawAccount";
		 }else {
			  model.addAttribute("msg", "비밀번호를 다시 입력해 주세요");
		 }
		
		 ArrayList<HashMap<String, String>> bankList = depositService.bankList();
		 
		 model.addAttribute("bankList", bankList);
		 model.addAttribute("withdrawData", withdrawData);
		 return page;
	 }
	 

	 @RequestMapping("/depositWithdraw.do")
	 public void depositWithdraw(@RequestParam HashMap<String, String> data,HttpSession session) {
		 logger.info("data : " + data);
		 data.put("deposit_info", data.get("bank")+data.get("account"));
		 depositService.depositWithdrawReq(data);
	 }
	 
	

}
