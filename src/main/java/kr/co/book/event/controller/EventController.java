package kr.co.book.event.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/event_List.go")
	public String eventlistgo() {
		
		return "event/eventList";
	}
	
}
