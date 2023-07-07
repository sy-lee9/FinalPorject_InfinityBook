package kr.co.book.event.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.co.book.event.dao.EventDAO;
import kr.co.book.event.dto.EventDTO;

@Service
@MapperScan("kr.co.book.event.dao.EventDAO")
public class EventService {
	
	private static EventDAO dao;
	
	public EventService (EventDAO dao) {
		this.dao = dao;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public static HashMap<String, Object> eventList(int member_idx, String epage, String type, String searchText) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<EventDTO> list = null;
		int page = Integer.parseInt(String.valueOf(epage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		if(searchText.equals("")) {
			total = dao.totalEventList(member_idx,type);
			list = dao.eventList(member_idx,offset,type);
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("member_idx", member_idx);
			data.put("offset", offset);
			data.put("type", type);
			data.put("searchText", searchText);
			total = dao.totalEventSearchList(data);
			list = dao.eventSearchList(data);
		}
		
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		books.put("offset", offset);
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		return books;
	}

}
