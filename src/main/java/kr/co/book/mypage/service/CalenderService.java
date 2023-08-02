package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.CalenderDAO;
import kr.co.book.mypage.dto.CalenderDTO;

/*
 * CalenderService : 캘린더 서비스
 * @author 이수연
 */
@Service
@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public class CalenderService {
	
	@Autowired CalenderDAO CalenderDAO;

	Logger logger = LoggerFactory.getLogger(getClass());

	//대여/교환, 모임 일정 불러오기
	public HashMap<String, Object> calendarGetEvents(int loginIdx) {
		//뷰로 내려보낼 정보를 담을 map
		HashMap<String, Object> map = new HashMap<String, Object>();
		//모든 일정을 담을 list
		ArrayList<CalenderDTO> totalList = new ArrayList<CalenderDTO>();
		//일정 정보를 저장할 DTO
		CalenderDTO CalenderDTO = new CalenderDTO();
		
		//대여 일정 리스트
		ArrayList<CalenderDTO> rentList = CalenderDAO.rentEvents(loginIdx);
		
		for (int i = 0; i < rentList.size(); i++) {
			//책 제목
			String bookTitle = rentList.get(i).getBookTitle();
			//일정 제목
			String title = "대여("+bookTitle+")";			
			rentList.get(i).setTitle(title);
			//일정 배경색 지정
			rentList.get(i).setBackgroundColor("#c9cba3");
		}
		totalList.addAll(rentList);
		
		//대출 일정 리스트
		ArrayList<CalenderDTO> borrowList = CalenderDAO.borrowEvents(loginIdx);
		
		for (int i = 0; i < borrowList.size(); i++) {
			//책 제목
			String bookTitle = borrowList.get(i).getBookTitle();
			//일정 제목
			String title = "대출("+bookTitle+")";
			borrowList.get(i).setTitle(title);
			//일정 배경색 지정
			borrowList.get(i).setBackgroundColor("#ffaf87");
		}
		totalList.addAll(borrowList);
		
		//교환 일정 리스트
		ArrayList<CalenderDTO> changeList = CalenderDAO.changeEvents(loginIdx);
		
		for (int i = 0; i < changeList.size(); i++) {
			//책 제목
			String bookTitle = changeList.get(i).getBookTitle();
			//일정 제목
			String title = "교환("+bookTitle+")";
			changeList.get(i).setTitle(title);
			//일정 배경색 지정
			changeList.get(i).setBackgroundColor("#F7E6C4");
		}
		totalList.addAll(changeList);

		//모임 일정 리스트
		ArrayList<CalenderDTO> clubList = CalenderDAO.clubEvents(loginIdx);
		
		for (int i = 0; i < clubList.size(); i++) {
			//책 제목
			String bookTitle = clubList.get(i).getTitle();
			//일정 제목
			String title = "모임("+bookTitle+")";
			clubList.get(i).setTitle(title);
		}
		totalList.addAll(clubList);
				
		map.put("events", totalList);

		return map;
	}

}
