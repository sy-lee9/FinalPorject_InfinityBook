package kr.co.book.club.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.club.dto.ClubDTO;
import kr.co.book.club.service.ClubService;

@Controller
public class ClubController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubService clubService;
	
	@RequestMapping("/clubList.go")
	public String clubListGo() {
		return "/club/clubList";
	}
	
	@RequestMapping("/clubList.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubListAjax(@RequestParam String page,@RequestParam String searchText) {
		HashMap<String, Object> clubs = clubService.clubList(page,searchText);
		return clubs; 
	}
	
	@RequestMapping("/clubDetail.go")
	public String clubDetail(@RequestParam String club_idx, Model model) {
		
		ClubDTO club = clubService.clubDetail(club_idx);
		
		model.addAttribute("club", club);
		return "/club/clubDetail";
	}


}
