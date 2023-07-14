package kr.co.book.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.admin.service.AdminReportService;

@Controller
public class AdminReportController {
	
	@Autowired AdminReportService adminReportService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/reportPop.go")
	public String reportPopGo(HttpSession session, Model model, String code, String idx) {
		
		int member_idx = (int) session.getAttribute("loginIdx");
		
		model.addAttribute("code",code);
		model.addAttribute("idx",idx);
		model.addAttribute("member_idx",member_idx);
		
		return "reportPop";
	}
	
	@PostMapping(value = "/reportSend.ajax")
	@ResponseBody
	public HashMap<String, Object> reportSend(@RequestParam HashMap<String, Object> params) {
		return adminReportService.reportSend(params);
	}

	@RequestMapping(value = "/admin/adminReport.go")
	public String reportListGo() {
		return "/admin/adminReport";
	}
	
	@PostMapping(value = "/admin/reportList.ajax")
	@ResponseBody
	public HashMap<String, Object> reportList(@RequestParam HashMap<String, Object> params) {
		return adminReportService.reportList(params);
	}
	
	@RequestMapping(value = "/admin/adminReportDetail.go")
	public String adminReportDetailGo() {
		return "/admin/adminReportDetail";
	}
	
	
	
	
	
	
	
	
	
}
