package kr.co.book.member.dao;

import java.util.HashMap;

import kr.co.book.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String member_email);

	int join(HashMap<String, String> params);

	int emailOverCheck(String member_email);

	Object overlaynickname(String member_nickname);

	int findLocationCode(String location);

	int findmemberpw(String member_email, String member_nickname);

	void RandomPassword(String member_email, String member_nickname, String encodedPassword);

}
