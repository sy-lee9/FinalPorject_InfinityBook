package kr.co.book.member.dao;

import java.util.HashMap;

import kr.co.book.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String email, String pw);

	int join(HashMap<String, String> params);

	int emailOverCheck(String member_email);

}
