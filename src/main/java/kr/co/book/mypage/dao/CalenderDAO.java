package kr.co.book.mypage.dao;

import java.util.ArrayList;

import kr.co.book.mypage.dto.CalenderDTO;

public interface CalenderDAO {

	//대여 일정 불러오기
	ArrayList<CalenderDTO> rentEvents(int loginIdx);

	//대출 일정 불러오기
	ArrayList<CalenderDTO> borrowEvents(int loginIdx);

	//교환 일정 불러오기
	ArrayList<CalenderDTO> changeEvents(int loginIdx);

	//모임 일정 불러오기
	ArrayList<CalenderDTO> clubEvents(int loginIdx);

}
