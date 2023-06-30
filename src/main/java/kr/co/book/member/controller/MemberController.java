package kr.co.book.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.member.dto.MemberDTO;
import kr.co.book.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final MemberService service;
	
	public MemberController(MemberService service) {

		this.service = service;
	}
	
	@RequestMapping(value = "/login.go")
	public String loginForm() {
		return "member/login";
	}
	
	@PostMapping(value = "/login.do")
	public String login(Model model, HttpSession session, @RequestParam HashMap<String, String > params) {
		
		logger.info("로그인시도");
		
		String page = "login";
		
		String member_email = params.get("member_email") + params.get("userEmail2");
		String member_pw = params.get("member_pw");
		
		logger.info("id : " + member_email, "pw : " + member_pw);
		
		MemberDTO dto = service.login(member_email,member_pw);
		
		if (dto != null) {
			page = "redirect:/";
			session.setAttribute("loginIdx", dto.getMember_idx());
			session.setAttribute("loginNickname", dto.getMember_nickname());			
		}else {
			model.addAttribute("msg","로그인에 실패했습니다.");
		}
		
		return page;
	}
	
	@RequestMapping(value = "/join.go")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping(value="/join.ajax")
    @ResponseBody
    public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
	   logger.info("params: {}"+params);
	   
	return service.join(params);		   
    }
	
	@RequestMapping(value = "/id_Search.go")
	public String id_Search() {
		return "member/id_Search";
	}
	
	@RequestMapping(value = "/pw_Search.go")
	public String pw_Search() {
		return "member/pw_Search";
	}
	
	/*
	 * @GetMapping("/mailCheck")
	 * 
	 * @ResponseBody public String mailCheck(String email) {
	 * System.out.println("이메일 인증 요청이 들어옴!"); System.out.println("이메일 인증 이메일 : " +
	 * email); return ""; }
	 */
	
	
	
	@RequestMapping(value="/member_email_check.ajax")	
	@ResponseBody
	public HashMap<String, Object> findmemberpw(@RequestParam String member_email, HttpSession session){
		   		   		  
		   logger.info(member_email+"/"+" 이메일");		   
		   // 맵에 넣기
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   // 서비스에서 받아온 임시 비번을 변수에 전달
			/*
			 * String email_check =(String) service.randomCheck(member_email);
			 * logger.info("인증번호: "+email_check); // 멥에 저장 map.put("email_check",
			 * email_check);
			 */
		   		   		   		   		  
		return  map;
	}
}
