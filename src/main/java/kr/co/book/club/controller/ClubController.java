package kr.co.book.club.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		ArrayList<ClubDTO> member = clubService.clubMember(club_idx);
		ArrayList<ClubDTO> apply = clubService.applyMember(club_idx);
		model.addAttribute("club", club);
		model.addAttribute("member", member);
		model.addAttribute("apply", apply);
		return "/club/clubDetail";
	}
	
	@RequestMapping("/clubApply.do")
	public String clubApply(@RequestParam String club_idx, HttpSession session){
		
		String member_idx = (String) session.getAttribute("loginIdx"); 
		clubService.clubApply(club_idx, member_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	@RequestMapping("/applyAccept.do")
	public String applyAccept(@RequestParam String club_idx, @RequestParam String member_idx){
		
		clubService.applyAccept(club_idx, member_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	@RequestMapping("/applyReject.do")
	public String applyReject(@RequestParam String club_idx, @RequestParam String member_idx){
		
		clubService.applyReject(club_idx, member_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}


}
