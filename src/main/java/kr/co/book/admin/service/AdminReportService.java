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
import kr.co.book.chat.service.ChatService;
import kr.co.book.club.service.ClubService;

/*
 * AdminReportService : 신고관리 서비스
 * @author 이수연
 */
@Service
@MapperScan(value = {"kr.co.book.admin.dao"}) 
public class AdminReportService {
	
	@Autowired AdminReportDAO adminReportDAO;
	@Autowired ChatService chatservice;

	Logger logger = LoggerFactory.getLogger(getClass());

	//신고 제출
	public HashMap<String, Object> reportSend(HashMap<String, Object> params) {
		
		int row = adminReportDAO.reportSend(params);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		
		return map;
	}

	//신고 내역 리스트
	public HashMap<String, Object> reportList(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		
		//페이징
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int total = 0;
		int offset = 10*(page-1);
		params.put("offset", offset);
		
		list = adminReportDAO.reportList(params);
		total = list.size();
			
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		return map;
	}

	//신고내용 및 신고 게시물 정보
	public ModelAndView getReportInfor(HashMap<String, Object> params) {
		ModelAndView mav = new ModelAndView("/admin/adminReportDetail");
		
		HashMap<String, Object> map = adminReportDAO.getReportInfor(params);
		mav.addObject("info", map);
		
		return mav;
	}

	//신고 처리 내역
	public HashMap<String, Object> reportRecordList(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		
		//페이징
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int total = 0;
		int offset = 5*(page-1);
		params.put("offset", offset);
		
		list = adminReportDAO.reportRecordList(params);
		total = list.size();
			
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		
		return map;
	}

	//신고처리
	public HashMap<String, Object> reportHandling(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int blind = Integer.parseInt((String) params.get("blind"));
		String memberState = (String) params.get("memberState");
		int code_idx = Integer.parseInt((String) params.get("code_idx"));
		String target = (String) params.get("target");
		String alarmContent = "";
		String result = "";

		//블라인드 처리
		if(blind == 1) {
			
			if(adminReportDAO.blind(params) == 1) {
				switch (code_idx) {
				case 69:
					alarmContent = "신고처리로 ["+target+"] 감상문이 삭제되었습니다.";
					break;
				case 70:
					alarmContent = "신고처리로 ["+target+"] 모임이 삭제되었습니다.";
					chatservice.clubchatDelete((String) params.get("idx"));
					break;
				case 71:
					alarmContent = "신고처리로 ["+target+"] 댓글이 삭제되었습니다.";
					break;
				case 72:
					alarmContent = "신고처리로 ["+target+"] 리뷰가 삭제되었습니다.";
					break;
				case 73:
					alarmContent = "신고처리로 ["+target+"] 도서가 삭제되었습니다.";
					break;
				}
				params.put("alarmContent", alarmContent);
				adminReportDAO.blindAlarm(params);
				result += "블라인드 처리";		
				
				//회원 이용제한
				adminReportDAO.updateMemberState(params);
				result += " / "+memberState;
			}			
			
		} else{ //블라인드 미처리 or 게시물 재공개
			adminReportDAO.blind(params);
			result += "	공개";

			//회원 이용제한
			adminReportDAO.updateMemberState(params);
			result += " / "+ memberState;
		}
		
		params.put("result", result);
		int row = 0;
		
		//신고처리 및 신고처리내역 저장
		if(adminReportDAO.reportHandlingCompleted(params) == 1) {
			row = adminReportDAO.reportHandlingRecord(params);
		}
		map.put("success", row);
		
		return map;
	}

	
	
	
	
	
	
	
	
	
}
