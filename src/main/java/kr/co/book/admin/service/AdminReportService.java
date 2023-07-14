package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.admin.dao.AdminReportDAO;

@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminReportService {
	
	@Autowired AdminReportDAO adminReportDAO;

	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> reportSend(HashMap<String, Object> params) {
		
		int row = adminReportDAO.reportSend(params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		
		return map;
	}

	public HashMap<String, Object> reportList(HashMap<String, Object> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int offset = 10*(page-1);
		params.put("offset", offset);
		int total = 0;
		
		list = adminReportDAO.reportList(params);
		logger.info("list : "+list);
		total = list.size();
		logger.info("total : "+total);		
			
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		return map;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
