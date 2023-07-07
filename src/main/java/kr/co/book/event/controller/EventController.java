package kr.co.book.event.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class EventController {

	Logger logger = LoggerFactory.getLogger(getClass());

	
	/*
	 * public String eventlistgo() {
	 * 
	 * return "event/eventList"; }
	 * 
	 * 
	 * @RequestMapping("/eventList.ajax")
	 * 
	 * @ResponseBody public HashMap<String, Object> eventListAjax(@PathVariable
	 * String type,@RequestParam String page,@RequestParam String
	 * searchText,HttpSession session) { logger.info("type : "+type);
	 * logger.info("searchText : "+searchText); int member_idx =
	 * (int)session.getAttribute("loginIdx"); HashMap<String, Object> eventList =
	 * EventService.eventList(member_idx,page,type,searchText); return eventList; }
	 */
	 
	
}
