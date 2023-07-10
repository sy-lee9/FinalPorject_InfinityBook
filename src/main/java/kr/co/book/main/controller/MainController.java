package kr.co.book.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "/")
	public String Home() {
		return "index";
	}
	
	@RequestMapping(value = "/eventList.go")
	public String EventPage() {
		return "event/eventList";
	}
	
	
	
	
	
	
	

}
