package kr.co.book.event.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.book.club.dto.ClubDTO;
import kr.co.book.event.dto.EventDTO;
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
	public String eventWriteForm() {
		return "event/eventWrite";
	}
	
	@RequestMapping(value = "/eventWrite.do", method = RequestMethod.POST)
	public String eventWrite(HttpSession session ,Model model, @RequestParam HashMap<String, String>params, MultipartFile photo){
		String page = "eventWrite";
		  
			params.put("member_idx", session.getAttribute("loginIdx").toString()); 
			
		   if (params.get("event_title").equals("")) {
			model.addAttribute("msg","제목을 입력하세요.");
		   }else if (params.get("event_content").equals("")) {
			   model.addAttribute("msg","유의사항을 입력하세요.");
		   }else if(params.get("event_startdate").equals("")){
			   model.addAttribute("msg","이벤트 시작 날짜를 선택하세요.");
		   }else if (params.get("event_enddate").equals("")) {
			   model.addAttribute("msg","이벤트 종료 날짜를 선택하세요.");
		   }else if (params.get("event_cnt").equals("")) {
			   model.addAttribute("msg","이벤트 당첨자 수를 선정하세요.");
		   }else {				   
			   //service.eventWrite(photo, params);
			   model.addAttribute("msg","이벤트가 정상적으로 등록되었습니다.");
				page = "eventList";
		}  
	      return page;
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
/*	
	@RequestMapping(value = {"/eventList.ajax"}, method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> eventList(
			@RequestParam String page,			
			@RequestParam String search
			){
		
		logger.info("컨트롤러 등장");
		
		return service.eventPageList(Integer.parseInt(page),search);
	}	
*/	 
	
}
