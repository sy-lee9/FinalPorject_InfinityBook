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

	@Transactional
	public HashMap<String, Object> alarmlist(int page, String member_idx) {
		
		ArrayList<AlarmDTO> list = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int offset = 0;
		int total = 0;
		int range = 0;
		offset = 10*(page - 1);		
		total =dao.totalAlarmCount(member_idx);
		range = total%10  == 0 ? total/10 : (total/10)+1;	
		page = page>range ? range:page;
		list = dao.alarmList(offset,member_idx);
		dao.alarmCheck(member_idx);
		
		map.put("offset", offset);
		map.put("list", list);
		// 현재 페이지
		map.put("currPage", page);
		// 총 페이지 수
		map.put("pages", range);
		
		
		return map;
	}

	public String alarmdetail(String code_idx, String idx) {
		
		return null;
	}

}
