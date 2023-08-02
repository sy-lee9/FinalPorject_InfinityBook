package kr.co.book.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface AdminReportDAO {

	//신고 제출
	int reportSend(HashMap<String, Object> params);

	//신고 내역 리스트
	ArrayList<HashMap<String, Object>> reportList(HashMap<String, Object> params);

	//신고 정보 가져오기
	HashMap<String, Object> getReportInfor(HashMap<String, Object> params);

	//신고처리 기록
	ArrayList<HashMap<String, Object>> reportRecordList(HashMap<String, Object> params);

	//블라인드 처리
	int blind(HashMap<String, Object> params);

	//블라인드 알림 내용 저장
	void blindAlarm(HashMap<String, Object> params);

	//회원 이용상태 변경
	int updateMemberState(HashMap<String, Object> params);

	//신고처리 기록
	int reportHandlingRecord(HashMap<String, Object> params);

	//신고처리 완료일 등록
	int reportHandlingCompleted(HashMap<String, Object> params);

}
