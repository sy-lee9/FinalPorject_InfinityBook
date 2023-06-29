package kr.co.book.mypage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.mypage.dto.DepositDTO;

@Mapper
public interface DepositDAO {

	int totalListCnt(String member_idx);

	ArrayList<DepositDTO>depositUseList(String member_idx, int offset);

}
