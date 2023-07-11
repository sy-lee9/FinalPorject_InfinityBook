package kr.co.book.event.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.event.dao.EventDAO;
import kr.co.book.event.dto.EventDTO;

@Service
@MapperScan(value={"kr.co.book.event.dao"})
public class EventService {
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EventDAO dao;
	
	public HashMap<String, Object> eventPageList(int page, String search) {
		logger.info("서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 1page = offset : 0
		// 2page = offset : offset + 5
		// 3page = offset : 10
		
		int offset = (page - 1) * 10;
		
		// 만들 수 있는 총 페이지 수 
		// 전체 게시물 / 페이지 당 보여줄 수 
		int total = dao.totalCount();
		
		
		if (search.equals("default") || search.equals("")) {
	         total = dao.totalCount();
	         logger.info("서비스1");
	         
	      } else {
	         total = dao.etotalCountSearch(search);
	         logger.info("서비스2");
	      };	
		
		
		int range = total%10 == 0 ? total/10 : (total/10) + 1;
		
		
		page = page > range ? range : page;
		
		ArrayList<EventDTO> evlist = dao.evlist(10, offset);
		
		if (search.equals("default") || search.equals("")) {
			evlist = dao.evlist(10, offset);
			logger.info("서비스3");
	         
	      } else {
	    	  evlist = dao.eventSearch(search);
	    	  logger.info("서비스4");
	      }
		
		map.put("currPage", page);
		map.put("pages", range);		
		
		map.put("evlist", evlist);
		

		return map;
	}

	

}
