package kr.co.book.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
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
	public HashMap<String, Object> member_email_check(@RequestParam String member_email, HttpSession session){
		   		   		  
		   logger.info(member_email+"/"+" 이메일");
		   HashMap<String, Object> map = new HashMap<String, Object>();
		     // 중복된 값 확인
		     int success = service.emailOverCheck(member_email);
		     // 이메일 중복이 없을 떄 인증번호 전송 
		     if (success == 0) {
		    	 String email_check =(String) service.confirmNumCheck(member_email);
				 logger.info("이메일 인증번호: "+email_check); // 멥에 저장 map.put("email_check",
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
			 }else {
				
			}
			 
		     
			 
		   		   		   		   		  
		     return map;
	}
}
