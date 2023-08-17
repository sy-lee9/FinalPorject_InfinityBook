package kr.co.book.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.mypage.service.MemberInfoService;

/*
 * MemberController : 회원정보 관리 컨트롤러
 * @author 이수연
 */
@Controller
public class MemberInfoController {
	
	@Autowired MemberInfoService memberInfoService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	//회원정보 페이지 이동
	@RequestMapping(value = "/mypage/memberInfo.go")
	public ModelAndView memberInfoGo(HttpSession session) throws Exception {
		int loginIdx = (int) session.getAttribute("loginIdx");
		return memberInfoService.getMemberInfo(loginIdx,"info");
	}
	   
    //회원정보 수정 페이지 이동
    @RequestMapping(value = "/mypage/memberInfoUpdate.go")
    public ModelAndView memberInfoUpdateGo(HttpSession session) throws Exception {
    	int loginIdx = (int) session.getAttribute("loginIdx");
    	return memberInfoService.getMemberInfo(loginIdx,"updateInfo");
	}
	   
	//회원정보 수정
	@PostMapping(value="/mypage/memberInfoUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> memberInfoUpdate(HttpSession session, @RequestParam HashMap<String, Object> params) throws Exception {
	   
		int loginIdx = (int) session.getAttribute("loginIdx");
		params.put("loginIdx", loginIdx);
	   
		return memberInfoService.memberInfoUpdate(session,params);      
	}
	   
	//비밀번호 변경 팝업
	@RequestMapping(value = "/mypage/pwUpdate.go")
	public String pwUpdateGo() throws Exception {
		return "/member/pwUpdate";
	}
	   
	//현재 비밀번호 확인
	@PostMapping(value="/mypage/pwChk.ajax")
	@ResponseBody
	public HashMap<String, Object> pwChk(HttpSession session, @RequestParam String exPw) throws Exception {		   
		int loginIdx = (int) session.getAttribute("loginIdx");		   
		return memberInfoService.pwChk(exPw,loginIdx);      
	}
	   
	//비밀번호 변경
	@PostMapping(value="/mypage/pwUpdate.ajax")
	@ResponseBody
	public HashMap<String, Object> pwUpdate(HttpSession session, @RequestParam String newPw) throws Exception {		   
		int loginIdx = (int) session.getAttribute("loginIdx");		   
		return memberInfoService.pwUpdate(newPw,loginIdx);      
	}
	   
	//회원탈퇴 페이지 이동
	@RequestMapping(value = "/mypage/leave.go")
	public String leaveGo() throws Exception {
		return "/member/leave";
	}
	   
	//회원탈퇴 처리
	@PostMapping(value="/mypage/leave.ajax")
	@ResponseBody
	public HashMap<String, Object> leave(HttpSession session, @RequestParam String pw) throws Exception {
		int loginIdx = (int) session.getAttribute("loginIdx");		   
		return memberInfoService.leave(pw,loginIdx,session);      
	}
		   

}
