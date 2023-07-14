package kr.co.book.alarm.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.book.alarm.dao.AlarmDAO;
import kr.co.book.alarm.dto.AlarmDTO;

@Service
@MapperScan(value={"kr.co.book.alarm.dao"})
public class AlarmService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmDAO dao;

	public HashMap<String, Object> alarmlist(String member_idx) {
		
		ArrayList<AlarmDTO> list = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		list = dao.alarmList(member_idx);

		map.put("list", list);

		return map;
	}

	public String alarmdetail(int code_idx, int idx) {
		
		String page = "";
		
		if(code_idx == 2) {
			// 교환			
			page = "/chat/message_list";
		}else if(code_idx == 3) {
			// 대여	
			page = "/chat/message_list";	
		}else if(code_idx == 4) {
			// 모임	
			page = "/chat/message_list";
		}else if(code_idx == 1) {
			// 감상문
			page = "redirect:/";
		}else if(code_idx == 64 || code_idx == 65 || code_idx == 66 || code_idx == 67) {
			// 	문의
			page = "redirect:/myinquirydetail.go?"+idx;
		}else if(code_idx == 80) {
			//위시
		}
		
		
		return page;
	}


}
