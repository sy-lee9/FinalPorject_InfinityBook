package kr.co.book.club.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.book.club.dto.ClubDTO;
import kr.co.book.club.service.ClubService;

@Controller
public class ClubController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubService service;
	
	@RequestMapping(value="/clubInsert.go")
	public String club(Model model) {
		logger.info("club 등록 페이지로 이동");
		String MEMBER_IDX = "3"; //로그인 기능 완성 후 세션 저장된 값으로 바꿔줘야합니다
		model.addAttribute("clubList",MEMBER_IDX);
		
		
		return "club/club";
	}
	@PostMapping(value="/clubInsert.do")
	public String clubInsert(Model model, @RequestParam HashMap<String,
			 String>params, MultipartFile photo) throws IOException {
		String page ="club/clubList";
		service.clubApply(photo, params);
		logger.info("독서모임 등록 완료");
		logger.info("독서모임 등록 params에 담겨있는 것 : "+ params);
		model.addAttribute("clubList",params);
		
		ArrayList<ClubDTO> clubList = service.clubList();
		logger.info("clubList: " +clubList);
		model.addAttribute("clubList", clubList);

		
		return page;
	}
	
	@RequestMapping(value="/clubList.go")
	public String clubList(Model model, @RequestParam HashMap<String,
			 String>params, MultipartFile photo) throws IOException {
		String page ="club/clubList";

		ArrayList<ClubDTO> clubList = service.clubList();
		model.addAttribute("clubList", clubList);
		logger.info("clubList: " +clubList);
		
		return page;
	}
	
	@RequestMapping(value="/clubDetail.go")
	public String clubDetail(Model model, @RequestParam String CLUB_IDX) {
		logger.info("디테일로 이동할 CLUB_IDX : "+CLUB_IDX);
		
		String page = "club/clubList";
		ClubDTO clubDetail = service.clubDetail(CLUB_IDX);
		logger.info("clubDetail"+clubDetail);
		
		if(clubDetail != null) {
			
			ArrayList<String> clubDetailPhoto = service.clubDetailPhoto(CLUB_IDX);
			logger.info("clubDetailPhoto :"+clubDetailPhoto);
			
			page = "club/clubDetail";
			model.addAttribute("clubDetail", clubDetail);
			model.addAttribute("clubDetailPhoto", clubDetailPhoto);
		}
		
		return page;
	}
	
	@RequestMapping("/bookSelect.go")
	public String bookListPop() {
		return "/club/clubBookSelect";
	}
	
	@RequestMapping("/bookSelect.do")
	public String bookSelect(@RequestParam HashMap<String, String> bookInfo, Model model,HttpSession session) {

		logger.info("선택 책 정보 : " + bookInfo);
		model.addAttribute("bookInfo",bookInfo);
		//bookInfo에 있는 책 제목이 book테이블에 없다면
		service.saveBook(bookInfo);
		return "club/club";
		

	}
	
	//파일 가져올때
	//String user_id = (String) session.getAttribute("loginId"); 로그인 구현하면 넣을 것
//			String email = "user01@naver.com";
//			String new_photo_name = service.getPhotoName(email);
//			model.addAttribute("new_photo_name",new_photo_name);
//			session.setAttribute("new_photo_name", new_photo_name);

}
