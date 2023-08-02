package kr.co.book.mypage.dao;

import java.util.HashMap;

public interface MemberInfoDAO {

	//회원정보 가져오기
	HashMap<String, Object> getMemberInfo(int loginIdx);

	//지역구 이름 가져오기
	int findLocationCode(String location);
	
	//회원정보 변경
	int memberInfoUpdate(HashMap<String, Object> params);

	//해시화된 비밀번호 가져오기
	String getPw(int loginIdx);

	//비밀번호 변경
	int pwUpdate(String encodedPassword, int loginIdx);

	//회원 이용상태 탈퇴처리
	int leave(int loginIdx);
	
}
