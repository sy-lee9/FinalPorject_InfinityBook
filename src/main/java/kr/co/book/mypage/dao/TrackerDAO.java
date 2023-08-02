package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.mypage.dto.TrackerDTO;

public interface TrackerDAO {

	//BOOK 테이블의 책 정보 저장여부 확인
	int bookInfoChk(String isbn);

	//BOOK 테이블에 책 정보 저장
	int saveBook(TrackerDTO dto);

	//트래커에 저장
	int saveTracker(HashMap<String, Object> params);

	//총 페이지 수 가져오기
	int getTotalPage(String isbn);

	//트래커 리스트 불러오기
	ArrayList<HashMap<String, Object>> getTrackerList(int loginIdx);

	//트래커 상세정보 불러오기 
	HashMap<String, Object> trackerDetail(String trackerIdx);

	//트래커 책정보 수정
	int trackerUpdateBook(HashMap<String, Object> params);

	//독서 종료일 저장
	void saveEndDate(int loginIdx, String isbn);

	//트래커 기록 삭제
	int trackerDeleteBook(String isbn, int loginIdx);

	//메모 저장
	int trackerAddMemo(HashMap<String, Object> params);

	//메모 리스트 불러오기
	List<HashMap<String, Object>> getMemoList(String trackerIdx);

	//메모 삭제
	int memoDelete(HashMap<String, Object> params);

	//기존 메모 내용 불러오기
	String getContent(HashMap<String, Object> params);

	//메모 내용 수정
	int memoUpdate(HashMap<String, Object> params);

}
