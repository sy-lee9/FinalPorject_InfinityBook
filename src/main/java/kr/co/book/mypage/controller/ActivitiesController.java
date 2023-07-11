package kr.co.book.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class ActivitiesController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/activitiesChange.go")
	public String activitiesChange() {
		return "/activities/activitiesChange";
	}
	
	@RequestMapping("/activitiesChangeList.ajax") 
	@ResponseBody
	public HashMap<String, Object> activitiesChangeList(@RequestParam HashMap<String, Object> params, HttpSession session) {
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);
		params.put("loginIdx", loginIdx);
		return ActivitiesService.getChangeList(params); 
	}
	
	@RequestMapping(value = "/activitiesRent.go")
	public String activitiesRent() {
		return "/activities/activitiesRent";
	}
	
	@RequestMapping("/activitiesChangeList.ajax") 
	@ResponseBody
	public HashMap<String, Object> activitiesRentList(@RequestParam HashMap<String, Object> params, HttpSession session) {
		int loginIdx = (int) session.getAttribute("loginIdx");
		logger.info("loginIdx : "+loginIdx);
		params.put("loginIdx", loginIdx);
		return ActivitiesService.getActivitiesRentList(params); 
	}


}
