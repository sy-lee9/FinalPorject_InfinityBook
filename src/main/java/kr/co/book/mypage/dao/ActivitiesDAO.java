package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ActivitiesDAO {

	//교환내역 리스트 불러오기
	ArrayList<HashMap<String, Object>> changeList(HashMap<String, Object> params);

	//검색한 교환내역 리스트 불러오기
	ArrayList<HashMap<String, Object>> changeListSearch(HashMap<String, Object> params);
	
	//대여내역 리스트 불러오기
	ArrayList<HashMap<String, Object>> rentList(HashMap<String, Object> params);

	//검색한 대여내역 리스트 불러오기
	ArrayList<HashMap<String, Object>> rentListSearch(HashMap<String, Object> params);


}
