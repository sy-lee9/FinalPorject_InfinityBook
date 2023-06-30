package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.mypage.dto.DepositDTO;

@Mapper
public interface DepositDAO {

	int totalListCnt(String member_idx);

	ArrayList<DepositDTO>depositUseList(String member_idx, int offset);

	int depositNow(String member_idx);

	int depositPwChk(String member_idx, String member_pw);

	ArrayList<HashMap<String, String>> bankList();

	void depositWithdrawReq(HashMap<String, String> data);

	void depositUse(HashMap<String, String> data);

	void depositChargedrawReq(HashMap<String, String> data);

}
