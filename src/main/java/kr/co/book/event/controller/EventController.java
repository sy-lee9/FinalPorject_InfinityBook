package kr.co.book.event.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.event.service.EventService;

@Controller
public class EventController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private EventService service;
	
	public EventController(EventService service) {
		this.service = service;
	}

	@RequestMapping(value = "/eventList.go")
	public String EventPage() {
		return "event/eventList";
	}
	
	@RequestMapping(value = "/eventWrite.go")
	public String eventWrite() {
		return "event/eventWrite";
	}
	
	@RequestMapping(value = "/eventDetail.go")
	public String eventDetail() {
		return "event/eventdetail";
	}
	
	@RequestMapping(value = "/eventUpdate.go")
	public String eventUpdate() {
		return "event/eventUpdate";
	}
	
	@RequestMapping(value = "/eventDelete.do")
	public String eventDelete() {
		return "event/eventWrite"; 
	}
	
	@RequestMapping(value = {"/eventList.ajax"}, method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> eventList(
			@RequestParam String page,			
			@RequestParam String search
			){
		
		logger.info("컨트롤러 등장");
		
		return service.eventPageList(Integer.parseInt(page),search);
	}	
	 
	
}
