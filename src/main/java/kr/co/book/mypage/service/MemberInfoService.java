package kr.co.book.mypage.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.dao.MemberInfoDAO;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public class MemberInfoService {
	
	@Autowired MemberInfoDAO memberInfoDAO;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	//회원 정보 불러오기
	public ModelAndView getMemberInfo(int loginIdx, String flag) throws Exception {
		ModelAndView mav = new ModelAndView();
			
		//flag 값에 따라
		if(flag.equals("info")) { //회원정보 페이지로 이동
			mav.setViewName("/member/memberInfo");
		}else { //회원정보 수정 페이지로 이동
			mav.setViewName("/member/memberInfoUpdate");
		}
		//회원정보 가져와서 map으로 내려보냄	
		HashMap<String, Object> map = memberInfoDAO.getMemberInfo(loginIdx);
		mav.addObject("info",map);
		return mav;
	}

	//회원정보 수정
	public HashMap<String, Object> memberInfoUpdate(HttpSession session, HashMap<String, Object> params) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
			
		//지역 코드 가져오기
		int code_idx = memberInfoDAO.findLocationCode((String) params.get("location"));
		params.put("code_idx", code_idx);
			
		//회원정보 변경
		int success = memberInfoDAO.memberInfoUpdate(params);
		if(success == 1) {
			map.put("success", success);
			//세션에 저장된 닉네임 변경
			session.setAttribute("loginNickname", (String)params.get("nickname"));			
		}
			
		return map;
	}

	//비밀번호 확인
	public HashMap<String, Object> pwChk(String exPw, int loginIdx) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
			
		//암호화된 비밀번호 가져와서 사용자가 입력한 비밀번호와 일치하는지 확인
		String encodePassWord = memberInfoDAO.getPw(loginIdx);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean isMatched = encoder.matches(exPw, encodePassWord);
	        
		//일치하면 true 내려보냄
		if(isMatched) {
			map.put("pwChk", true);
		}
			
		return map;
	}

	//비밀번호 변경
	public HashMap<String, Object> pwUpdate(String newPw, int loginIdx) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
			
		//비밀번호 해시화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(newPw);
			
		//해시화한 비밀번호 저장
		int success = memberInfoDAO.pwUpdate(encodedPassword,loginIdx);
			
		map.put("success", success);
		return map;
	}

	//회원탈퇴
	public HashMap<String, Object> leave(String pw, int loginIdx, HttpSession session) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();

		//암호화된 비밀번호 가져와서 사용자가 입력한 비밀번호와 일치하는지 확인
		String encodePassWord = memberInfoDAO.getPw(loginIdx);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean isMatched = encoder.matches(pw, encodePassWord);
	       
		//일치하면 해당 회원 이용상태 탈퇴로 변경
		if(isMatched) {
			int row = memberInfoDAO.leave(loginIdx);
	        	
			if(row == 1) {
				map.put("success", true);
				//세션값 초기화
				session.invalidate();
			}
		}			
		return map;
	}
	

}
