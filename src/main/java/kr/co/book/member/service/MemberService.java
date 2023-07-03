package kr.co.book.member.service;

import java.security.SecureRandom;
import java.util.HashMap;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.book.member.dao.MemberDAO;
import kr.co.book.member.dto.MemberDTO;

@Service
@MapperScan(value = {"kr.co.book.member.dao"})
public class MemberService {
	
	private final MemberDAO dao;
	
	public MemberService(MemberDAO dao) {
		this.dao = dao;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> join(HashMap<String, String> params) {
	
	HashMap<String, Object> map = new HashMap<>();
	
	String password = params.get("member_pw"); 
	logger.info(password);
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(password);
	params.replace("member_pw", password, encodedPassword);
	map.put("success", dao.join(params));
	
	return map;
	
	}

	public MemberDTO login(String member_email) {
		
		return dao.login(member_email);
	}

	public String randomCheck(String member_email, String member_email2) {
		// 알파벳 전부
				
			    String NUMBER = "0123456789";
			    // 랜덤 임시비번
			    String EMAIL_ALLOW_BASE = NUMBER;
			    // 임시비번은 8자리
			    int EMAIL_LENGTH = 6;
			    // 랜덤 변수
			    SecureRandom random = new SecureRandom();
			    // 저장될 문자열
			    String sb = "";
			    // 임시비번8자리가 될떄까지 랜덤 돌림
			    for (int i = 0; i < EMAIL_LENGTH; i++) {
			        int randomIndex = random.nextInt(EMAIL_ALLOW_BASE.length());
			        char randomChar = EMAIL_ALLOW_BASE.charAt(randomIndex);
			        sb+=randomChar;
			    }
			    
			    logger.info("인증번호 : "+sb);			    
				// 드디어 메일
				String charSet = "UTF-8";
			    String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com / 구글 사용시 smtp.gmail.com
			    // 메일 아이디
			    String hostSMTPid = "vzoo8204@naver.com";
			    // 메일 비번
			    String hostSMTPpwd = "ckdgns1486";

			    // 보내는 사람 EMail, 제목, 내용
			    String fromEmail = "vzoo8204@naver.com";
			    String fromName = "B∞K";
			    String subject = "";
			    String msg = "";
			   // 메일에 추가할거
		       subject = "B∞K 이메일 인증번호를 확인해주세요.";
		       msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		       msg += "<h3 style='color: skyblue;'>";
		       msg += "홈페이지에 접속하여, 인증번호를 입력해 주세요. </h3>";
		       msg += "<p>인증번호 : ";
		       msg += sb + "</p></div>";

			      // 받는 사람 E-Mail 주소
			      String mail = member_email + member_email2;
			      try {
			    	 // 메일 객체화
			         HtmlEmail email = new HtmlEmail();
			         // 메일에 디버그를 성공
			         email.setDebug(true);
			         // 메일에 한글형식
			         email.setCharset(charSet);
			         // 권장하지 않고 곧 없어질건데 트루
			         email.setSSL(true);
			         // 보낼사람이 이용할 메일
			         email.setHostName(hostSMTP);
			         
			         email.setSmtpPort(587); //네이버 이용시 587 / 구글 이용시 465
			         // 보낼사람 정보
			         email.setAuthentication(hostSMTPid, hostSMTPpwd);	         
			         email.setTLS(true);
			         // 받을 사람 메일과 한글 타입
			         email.addTo(mail, charSet);
			         // 보내는 사람 타입
			         email.setFrom(fromEmail, fromName, charSet);
			         email.setSubject(subject);
			         email.setHtmlMsg(msg);
			         email.send();
			      } catch (Exception e) {
			         logger.info("메일발송 실패 : " + e);
			      }		
			      // 이렇게 메일로 임시 비번 보냄...
			    return sb;
	}

	public int emailOverCheck(String member_email) {
		
		return dao.emailOverCheck(member_email);
	}

	public String confirmNumCheck(String member_email) {
	   
       String NUMBER = "0123456789";
       String Email_ALLOW_BASE = NUMBER;
       int email_length = 6;
       SecureRandom random = new SecureRandom();             
       String sb = "";
       
       for (int i = 0; i < email_length; i++) {
           int randomIndex = random.nextInt(Email_ALLOW_BASE.length());
           char randomChar = Email_ALLOW_BASE.charAt(randomIndex);
           sb+=randomChar;
       }
		return sb;
	}

	public HashMap<String, Object> overlaynickname(String member_nickname) {
		
		HashMap<String, Object> map = new HashMap<>();
		// 같은 닉네임이 있는가? 있으면 1 없으면 0	
		map.put("overlaynickname", dao.overlaynickname(member_nickname));	
		
		return map;
	}

	public int findLocationCode(String location) {

		return dao.findLocationCode(location);
	}

}
