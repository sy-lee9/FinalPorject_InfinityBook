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

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public class CalenderService {
	
	@Autowired CalenderDAO CalenderDAO;

	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> calendarGetEvents(int loginIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		CalenderDTO CalenderDTO = new CalenderDTO();
		ArrayList<ArrayList<CalenderDTO>> totalList = null;
		
		//대여 일정 리스트
		ArrayList<CalenderDTO> rentList = CalenderDAO.rentEvents(loginIdx);
		
		for (int i = 0; i < rentList.size(); i++) {
			String bookTitle = rentList.get(i).getBookTitle();
			String title = "대여("+bookTitle+")";
			rentList.get(i).setTitle(title);
			rentList.get(i).setBackgroundColor("#F7E6C4");
		}
		
		logger.info("rentList : "+rentList.size());
		
		
		//대출 일정 리스트
		ArrayList<CalenderDTO> borrowList = CalenderDAO.borrowEvents(loginIdx);
		
		for (int i = 0; i < borrowList.size(); i++) {
			String bookTitle = borrowList.get(i).getBookTitle();
			logger.info("bookTitle : "+bookTitle);
			String title = "대출("+bookTitle+")";
			logger.info("title : "+title);
			borrowList.get(i).setTitle(title);
			borrowList.get(i).setBackgroundColor("#B3C890");
		}
		
		logger.info("list : "+borrowList.size());
		rentList.addAll(borrowList);
		
		
		
		map.put("events", rentList);

		return map;
	}

}
