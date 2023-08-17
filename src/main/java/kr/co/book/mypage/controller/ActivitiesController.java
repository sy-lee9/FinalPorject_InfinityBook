package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.mypage.service.ActivitiesService;

/*
 * ActivitiesController : 대여/교환 활동내역 컨트롤러
 * @author 이수연
 */
@Controller
public class ActivitiesController {
	
	@Autowired ActivitiesService ActivitiesService;

	Logger logger = LoggerFactory.getLogger(getClass());

	//교환내역 페이지로 이동
	@RequestMapping(value = "/mypage/activitiesChange.go")
	public String activitiesChange() throws Exception {
		return "/activities/activitiesChange";
	}
	
	//교환내역 리스트 불러오기
	@RequestMapping("/mypage/activitiesChangeList.ajax") 
	@ResponseBody
	public HashMap<String, Object> activitiesChangeList(@RequestParam HashMap<String, Object> params, HttpSession session) throws Exception {
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
		return ActivitiesService.getChangeList(params); 
	}
	
	//대여내역 페이지로 이동
	@RequestMapping(value = "/mypage/activitiesRent.go")
	public String activitiesRent() throws Exception {
		return "/activities/activitiesRent";
	}
	
	//대여내역 리스트 불러오기
	@RequestMapping("/mypage/activitiesRentList.ajax") 
	@ResponseBody
	public HashMap<String, Object> activitiesRentList(@RequestParam HashMap<String, Object> params, HttpSession session) throws Exception {
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
		return ActivitiesService.getActivitiesRentList(params); 
	}


}
