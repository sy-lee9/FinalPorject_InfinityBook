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

	//신고내역 저장
	public HashMap<String, Object> reportSend(HashMap<String, Object> params) throws Exception {
		
		int row = adminReportDAO.reportSend(params);
		
		//저장되었을 겨우 success 리턴
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		
		return map;
	}

	//신고 내역 리스트 불러오기
	public HashMap<String, Object> reportList(HashMap<String, Object> params) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		
		//페이징 처리
		
		//선택한 페이지 번호
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		//총 페이지 수
		int total = 0;
		//해당 페이지에서 몇번째 게시물부터 보여줄건지
		int offset = 10*(page-1);
		params.put("offset", offset);
		
		//신고 내역 받아오기
		list = adminReportDAO.reportList(params);
		//총 페이지 수 저장
		total = list.size();
			
		//페이징 수
		int range = total%10  == 0 ? total/10 : total/10+1;
		page = page>range ? range:page;

		map.put("list", list);
		map.put("offset", offset);
		map.put("currPage", page);
		map.put("pages", range);
		return map;
	}

	//신고내용 및 신고 게시물 정보 불러오기
	public ModelAndView getReportInfor(HashMap<String, Object> params) throws Exception {
		ModelAndView mav = new ModelAndView("/admin/adminReportDetail");
		
		HashMap<String, Object> map = adminReportDAO.getReportInfor(params);
		mav.addObject("info", map);
		
		return mav;
	}

	//신고처리 내역 불러오기
	public HashMap<String, Object> reportRecordList(HashMap<String, Object> params) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		
		//페이징
		
		//선택한 페이지 수
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		//총 페이지 수
		int total = 0;
		//해당 페이지에서 몇번째 게시물부터 보여줄건지
		int offset = 5*(page-1);
		params.put("offset", offset);
		
		//신고처리 내역 리스트
		list = adminReportDAO.reportRecordList(params);
		//총페이지 수 저장
		total = list.size();
			
		//페이징 수 계산
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;

		map.put("list", list);
		map.put("offset", offset);
		map.put("currPage", page);
		map.put("pages", range);
		
		return map;
	}

	//신고처리
	public HashMap<String, Object> reportHandling(HashMap<String, Object> params) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//입력된 블라인드 처리 여부
		int blind = Integer.parseInt((String) params.get("blind"));
		//입력된 회원 이용상태 처리 여부
		String memberState = (String) params.get("memberState");
		//신고된 게시물 idx
		int code_idx = Integer.parseInt((String) params.get("code_idx"));
		//신고 대상자 idx
		String target = (String) params.get("target");
		//알림 내용
		String alarmContent = "";
		//처리 결과
		String result = "";

		//블라인드 처리 시
		if(blind == 1) {
			//회원 이용제한 처리 시
			if(adminReportDAO.blind(params) == 1) { //블라인드 처리가 완료되면 알림 내용 저장
				switch (code_idx) {
				case 69: //감상문
					alarmContent = "신고처리로 ["+target+"] 감상문이 삭제되었습니다.";
					break;
				case 70: //모임
					alarmContent = "신고처리로 ["+target+"] 모임이 삭제되었습니다.";
					chatservice.clubchatDelete((String) params.get("idx"));
					break;
				case 71: //댓글
					alarmContent = "신고처리로 ["+target+"] 댓글이 삭제되었습니다.";
					break;
				case 72: //리뷰
					alarmContent = "신고처리로 ["+target+"] 리뷰가 삭제되었습니다.";
					break;
				case 73: //도서
					alarmContent = "신고처리로 ["+target+"] 도서가 삭제되었습니다.";
					break;
				} 
				//알림 내용 alarm 테이블에 저장
				params.put("alarmContent", alarmContent);
				adminReportDAO.blindAlarm(params);
				result += "블라인드 처리";		
				
				//회원 이용상태 변경
				adminReportDAO.updateMemberState(params);
				result += " / "+memberState;
			}			
			
		} else{ //블라인드 미처리 or 게시물 재공개 시
			//게시물 정상 처리
			adminReportDAO.blind(params);
			result += "	공개";

			//회원 이용상태 변경
			adminReportDAO.updateMemberState(params);
			result += " / "+ memberState;
		}
		
		params.put("result", result);
		int row = 0;
		
		//신고처리 및 신고처리내역 저장
		if(adminReportDAO.reportHandlingCompleted(params) == 1) { //신고처리 완료상태로 저장되면
			row = adminReportDAO.reportHandlingRecord(params); //신고 처리 기록 저장 
		}
		map.put("success", row);
		
		return map;
	}
	
	
}
