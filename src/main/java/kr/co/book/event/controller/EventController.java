package kr.co.book.event.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.event.service.EventService;

@Controller
public class EventController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/event_List.go")
	public String eventlistgo() {
		
		return "event/eventList";
	}
	
	
	@RequestMapping("/eventList.ajax") 
	@ResponseBody
	public HashMap<String, Object> eventListAjax(@PathVariable String type,@RequestParam String page,@RequestParam String searchText,HttpSession session) {
		logger.info("type : "+type);
		logger.info("searchText : "+searchText);
		int member_idx = (int)session.getAttribute("loginIdx"); 
		HashMap<String, Object> eventList = EventService.eventList(member_idx,page,type,searchText);
		return eventList; 
	}
	 
	
}
