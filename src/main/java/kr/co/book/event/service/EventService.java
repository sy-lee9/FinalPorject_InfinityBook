package kr.co.book.event.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.book.event.dao.EventDAO;
import kr.co.book.event.dto.EventDTO;

@Service
@MapperScan(value={"kr.co.book.event.dao"})
public class EventService {
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired EventDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root;
	
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
	@Transactional
	public String eventWrite(MultipartFile photo, HashMap<String, String> params) {
		
		EventDTO dto = new EventDTO();
		
		
		logger.info("서비스 도착");
		dto.setEvent_title(params.get("setEvent_title"));
		dto.setEvent_content(params.get("event_content"));
		dto.setEvent_cnt(Integer.parseInt(params.get("event_cnt")));		
		String eventStartDateStr = params.get("event_startdate");
		String eventEndDateStr = params.get("event_enddate");

		SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
		    Date eventStartDate = new Date(inputDateFormat.parse(eventStartDateStr).getTime());
		    Date eventEndDate = new Date(inputDateFormat.parse(eventEndDateStr).getTime());

		    dto.setEvent_startdate(eventStartDate);
		    dto.setEvent_enddate(eventEndDate);
		} catch (Exception e) {
		    // 예외 처리
		}
		
		int success = dao.eventWrite(dto);
		
		logger.info("success: " + success);
		
		if (success > 0) {
			if (photo != null && !photo.getOriginalFilename().equals("")) {
				// 입력받은 파일 이름
	          String ori_photo_name = photo.getOriginalFilename();
	          
	          // 확장자를 추출하기 위한 과정
	          String ext = ori_photo_name.substring(ori_photo_name.lastIndexOf("."));
	          // 새로운 파일 이름은?
	          String new_photo_name = System.currentTimeMillis() + ext;
	          logger.info("파일 업로드 : " + ori_photo_name + "=>" + new_photo_name + "으로 변경될 예정");
	          String member_idx = params.get("member_idx");
	          try {
	             byte[] bytes = photo.getBytes();
	             Path path = Paths.get(root+"/"+new_photo_name);
	             Files.write(path, bytes);
	             dao.event_FileSave(83,ori_photo_name, new_photo_name,member_idx);
	          }catch (Exception e) {
	        	  e.printStackTrace();
	          }
	          
			}	
			
		}
		String photoroot = "/upload/";
		
		return photoroot;
		
		}

	

}
