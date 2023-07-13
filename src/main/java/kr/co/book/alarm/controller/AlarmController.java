package kr.co.book.alarm.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.alarm.service.AlarmService;
import lombok.RequiredArgsConstructor;

@Controller
public class AlarmController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmService service;
	
	@RequestMapping(value="/alarm.go")
	public String alarm(HttpSession session) {
		
		logger.info("alarm으로 이동");		
		return "alarm/alarmList";
	}
	
	@RequestMapping(value = "/alarmlist.ajax")
	@ResponseBody
	public HashMap<String, Object> alarmlist(@RequestParam int page, HttpSession session){
		
		String member_idx = session.getAttribute("loginIdx").toString();
		
		HashMap<String, Object> alarmlist = service.alarmlist(page,member_idx);
		
		return alarmlist;
	}
	
	
	@RequestMapping(value="/alarmdetail.go")
	public String alarmdetail(@RequestParam String code_idx, @RequestParam String idx) {
		logger.info("alarm상세으로 이동");

		String page = service.alarmdetail(code_idx, idx);
		
		return page;
	}


}
