package kr.co.book.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.member.dto.MemberDTO;
import kr.co.book.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final MemberService service;
	
	//최초 컨트롤러 세팅 시 서비스 보관 - single tone
	public MemberController(MemberService service) {
		this.service = service;
	}
	
	//회원 프로필 팝업
	@RequestMapping(value = "/profilePop.go")
	public ModelAndView profilePopGo(Model model, int member_idx) {
		model.addAttribute("member_idx", member_idx);
		return service.getProfileInfo(member_idx);
	}
	   
	//받은 리뷰 불러오기
	@PostMapping(value="/getReview.ajax")
	@ResponseBody
	public HashMap<String, Object> getReview(@RequestParam HashMap<String, Object> params){
		return service.getReview(params);      
	}
	
	
	@RequestMapping(value = "/login.go")
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(@RequestParam String member_email, @RequestParam String member_pw, HttpSession session) {	    
		MemberDTO dto = service.login(member_email);
	    
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    
	    if (dto != null) {
	        String encodePassWord = dto.getMember_pw();
	        //pw hash 암호화 /복호화
	        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	        boolean isMatched = encoder.matches(member_pw, encodePassWord);
	        
	        //회원 정보가 일치한다면
	        if (isMatched) {
	        	map.put("success", 1);
	        	session.setAttribute("loginIdx", dto.getMember_idx());
        		session.setAttribute("loginEmail", dto.getMember_email());
        		session.setAttribute("loginNickname", dto.getMember_nickname());
        		session.setAttribute("loginGrade", dto.isMember_grade());	  
        		session.setAttribute("memberState", dto.getMember_state());
	        }
	    }	    
	    return map;
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginNickname");
		session.removeAttribute("loginIdx");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/join.go")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping(value="/join.ajax",method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
	   String location = params.get("location");
	   
	   int code = service.findLocationCode(location);
	   
	   params.put("code_idx", String.valueOf(code));
	   
	   return service.join(params);		   
    }
	
	@RequestMapping(value = "/pw_Search.go")
	public String pw_Search() {
		return "member/pw_Search";
	}
	
	@RequestMapping(value="/member_email_check.ajax")	
	@ResponseBody
	public HashMap<String, Object> member_email_check(@RequestParam String member_email, HttpSession session){		   		   		  
		HashMap<String, Object> map = new HashMap<String, Object>();
		   
		// 중복된 값 확인
		int success = service.emailOverCheck(member_email);
		// 중복아닐 시 인증번호 전송 
		if (success == 0) {
			String email_check =(String) service.confirmNumCheck(member_email);
			String charSet = "UTF-8";
			String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com / 구글 사용시 smtp.gmail.com
			String hostSMTPid = "vzoo8204@naver.com";
			String hostSMTPpwd = "?gtp6418";

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "vzoo8204@naver.com";
			String fromName = "Infinity BooK";
			String subject = "";
			String msg = "";
			         
			subject = "Infinity BooK 인증번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: skyblue;'>";
			msg += "이메일(아이디) : "+ member_email + " 의 인증번호 입니다.</h3>";
			msg += "<p>인증번호 : ";
			msg += email_check + "</p></div>";

			// 받는 사람 E-Mail 주소
			String mail = member_email;
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587); //네이버 이용시 587 / 구글 이용시 465

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg);
				email.send();
			} catch (Exception e) {
			            logger.info("메일발송 실패 : " + e);
			}   			         
			map.put("check", email_check);
		}	   		   		  
		return map;
	}	
	
	@RequestMapping(value="/overlaynickname.ajax")
	@ResponseBody
	public HashMap<String, Object> overlaynickname(@RequestParam String member_nickname){		   
		return service.overlaynickname(member_nickname);     
	}
	   
	@RequestMapping(value="/findmemberpw.ajax")	
	@ResponseBody
	public HashMap<String, Object> findmemberpw(@RequestParam String member_email, @RequestParam String member_nickname, HttpSession session){
		   		   		  
		HashMap<String, Object> map = new HashMap<String, Object>();
		int success = service.findmemberpw(member_email, member_nickname);
		   
		if(success == 1) {
			// 서비스에서 받아온 임시 비번을 변수에 전달
			String findpw =(String) service.RandomPassword(member_email, member_nickname);
			map.put("findpw", findpw);
		}		   		   		   		  
		return  map;
	   }	 
	
	   
}
