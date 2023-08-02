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

/*
 * AdminReportController : 신고관리 컨트롤러
 * @author 이수연
 */
@Controller
public class AdminReportController {
	
	@Autowired AdminReportService adminReportService;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	//신고 팝업
	@RequestMapping(value = "/reportPop.go")
	public String reportPopGo(Model model, String code, String idx) {
		
		model.addAttribute("code",code);
		model.addAttribute("idx",idx);
		
		return "reportPop";
	}
	
	//신고 
	@PostMapping(value = "/reportSend.ajax")
	@ResponseBody
	public HashMap<String, Object> reportSend(HttpSession session, @RequestParam HashMap<String, Object> params) {
		
		int member_idx = (int) session.getAttribute("loginIdx");
		params.put("member_idx", member_idx);
		
		return adminReportService.reportSend(params);
	}

	//신고 페이지 이동
	@RequestMapping(value = "/admin/adminReport.go")
	public String reportListGo() {
		return "/admin/adminReport";
	}
	
	//신고 내역 리스트
	@PostMapping(value = "/admin/reportList.ajax")
	@ResponseBody
	public HashMap<String, Object> reportList(@RequestParam HashMap<String, Object> params) {
		return adminReportService.reportList(params);
	}
	
	//신고 내역 디테일
	@RequestMapping(value = "/admin/adminReportDetail.go")
	public ModelAndView adminReportDetailGo(@RequestParam HashMap<String, Object> params) {	
		return adminReportService.getReportInfor(params);
	}
	
	//신고 처리 내역
	@PostMapping(value = "/admin/reportRecordList.ajax")
	@ResponseBody
	public HashMap<String, Object> reportRecordList(@RequestParam HashMap<String, Object> params) {
		return adminReportService.reportRecordList(params);
	}
	
	//신고 처리
	@PostMapping(value = "/admin/reportHandling.ajax")
	@ResponseBody
	public HashMap<String, Object> reportHandling(HttpSession session, @RequestParam HashMap<String, Object> params) {
		params.put("member_idx", session.getAttribute("loginIdx"));
		return adminReportService.reportHandling(params);
	}
	
	
}
