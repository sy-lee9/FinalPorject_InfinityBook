package kr.co.book.club.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.book.chat.service.ChatService;
import kr.co.book.club.dto.ClubDTO;
import kr.co.book.club.service.ClubService;
import kr.co.book.mypage.service.TrackerService;

@Controller
public class ClubController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubService clubService;
	@Autowired TrackerService TrackerService;
	@Autowired ChatService chatservice;
	
	@RequestMapping("/clubList.go")
	public String clubListGo() {
		return "/club/clubList";
	}
	
	@RequestMapping("/myClubList.go")
	public String myClubListGo() {
		return "/club/myClubList";
	}
	
	@RequestMapping("/clubList.ajax") 
	@ResponseBody
	public HashMap<String, Object> clubListAjax(@RequestParam String page,@RequestParam String searchText) {
		HashMap<String, Object> clubs = clubService.clubList(page,searchText);
		return clubs; 
	}
	
	@RequestMapping("/clubDetail.go")
	public String clubDetail(@RequestParam String club_idx, Model model, HttpSession session) {
		
		ClubDTO club = clubService.clubDetail(club_idx);
		ArrayList<ClubDTO> member = clubService.clubMember(club_idx);
		ArrayList<ClubDTO> apply = clubService.applyMember(club_idx);
		model.addAttribute("club", club);
		model.addAttribute("member", member);
		model.addAttribute("apply", apply);
		model.addAttribute("loginIdx", session.getAttribute("loginIdx"));
		return "/club/clubDetail";
	}
	
	// 신청
	@RequestMapping("/clubApply.do")
	public String clubApply(@RequestParam String club_idx, HttpSession session){
		
		String member_idx = session.getAttribute("loginIdx").toString(); 
		clubService.clubApply(club_idx, member_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	// 수락 -> 업데이트
	@RequestMapping("/applyAccept.do")
	public String applyAccept(@RequestParam String club_idx, @RequestParam String member_idx){
		
		clubService.applyAccept(club_idx, member_idx);
		
		// 채팅방 입장후 채팅생성
		chatservice.clubchatjoin(club_idx, Integer.parseInt(member_idx));
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	// 거절 -> 딜리트
	@RequestMapping("/applyReject.do")
	public String applyReject(@RequestParam String club_idx, @RequestParam String member_idx){
		
		clubService.applyReject(club_idx, member_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	@RequestMapping("/clubWrite.go")
	public String clubWriteGo(Model model) {
		
		ArrayList<ClubDTO> locList = clubService.locationCode();
		model.addAttribute("location", locList);
		
		return "/club/clubWrite";
	}
	
	@RequestMapping("/clubBookPop.go")
	public String clubBookPop() {
		return "/club/clubBookPop";
	}
	
	@RequestMapping("/clubWrite.do")
	public String clubWrite(@RequestParam HashMap<String, Object> params, HttpSession session) {
		logger.info("글쓰기 정보" + params);
		int member_idx = (int)session.getAttribute("loginIdx"); 
		params.put("loginIdx", member_idx);
		int totalPage = TrackerService.getTotalPage(params);
		params.put("totalPage",totalPage);
		params.put("member_idx", String.valueOf(member_idx));
		logger.info("글쓰기 정보" + params);
		
		ClubDTO dto = new ClubDTO();
		
		dto.setMember_idx((String)params.get("member_idx"));
		dto.setIsbn((String)params.get("isbn"));
		dto.setClub_name((String)params.get("club_name"));
		dto.setClub_content((String)params.get("club_content"));
		dto.setClub_meetdate((String)params.get("club_meetdate"));
		dto.setCode_idx((String)params.get("code_idx"));
		dto.setClub_onoff((String)params.get("club_onoff"));
		dto.setClub_num((String)params.get("club_num"));
		
		
		// 글쓰기
		clubService.clubWrite(dto);
		
		String club_idx = dto.getClub_idx();
		
		// 글쓴이 참가 리스트 넣기
		clubService.clubJoin(club_idx,member_idx);
		
		// 채팅방 생성 후 채팅생성
		chatservice.createchatroom(club_idx,member_idx);
		
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	@RequestMapping("/clubDelete.do")
	public String clubDelete(@RequestParam String club_idx) {
		
		ArrayList<ClubDTO> applyMember = clubService.applyMember(club_idx);
		
		// 신청자삭제 
		for (ClubDTO clubDTO : applyMember) {
			clubService.applyReject(club_idx, clubDTO.getMember_idx());			
		}
		
		// 글 지우기
		clubService.clubDelete(club_idx);
				
		return "/club/clubList";
	}
	
	
	// 모집 종료 
	@RequestMapping("clubUpdate.do")
	public String clubUpdate(@RequestParam String club_idx) {
		ArrayList<ClubDTO> applyMember = clubService.applyMember(club_idx);
		
		for (ClubDTO clubDTO : applyMember) {
			clubService.applyReject(club_idx, clubDTO.getMember_idx());			
		}
		
		clubService.clubUpdate(club_idx);
		
		return "redirect:/clubDetail.go?club_idx="+club_idx;
	}
	
	// 채팅방을 나가면
	// 신청테이블에서 삭제 clubService.applyReject(club_idx, clubDTO.getMember_idx());			
}
