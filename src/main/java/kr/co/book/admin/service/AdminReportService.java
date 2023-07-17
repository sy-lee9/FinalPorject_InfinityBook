package kr.co.book.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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

	public ModelAndView getReportInfor(HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("/admin/adminReportDetail");
		
		HashMap<String, Object> map = adminReportDAO.getReportInfor(params);
		mav.addObject("info", map);
		
		return mav;
	}

	public HashMap<String, Object> reportRecordList(HashMap<String, Object> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int offset = 5*(page-1);
		params.put("offset", offset);
		int total = 0;
		
		list = adminReportDAO.reportRecordList(params);
		logger.info("list : "+list);
		total = list.size();
		logger.info("total : "+total);		
			
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		
		return map;
	}

	public HashMap<String, Object> reportHandling(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int blind = Integer.parseInt((String) params.get("blind"));
		String memberState = (String) params.get("memberState");
		String result = "";

		if(blind == 1) {
			
			if(adminReportDAO.blind(params) == 1) {
				result += "블라인드 처리";		
				
				if(!memberState.equals("정상")) {
					adminReportDAO.updateMemberState(params);
					result += " / "+memberState;
				}					
			}			
			
		} else{
			if(!memberState.equals("정상")) {
				adminReportDAO.updateMemberState(params);
				result += memberState;
			} else {
				result += "조치 내용 없음";
			}
		}
		
		params.put("result", result);
		
		int row = adminReportDAO.reportHandlingRecord(params);
		map.put("success", row);
		
		return map;
	}

	
	
	
	
	
	
	
	
	
	
	
}
