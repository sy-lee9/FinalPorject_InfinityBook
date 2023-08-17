package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.book.mypage.dao.ActivitiesDAO;

/*
 * ActivitiesService : 대여/교환 활동내역 서비스
 * @author 이수연
 */
@Service
public class ActivitiesService {
	
	@Autowired  ActivitiesDAO ActivitiesDAO;

	Logger logger = LoggerFactory.getLogger(getClass());

	//대여내역 리스트 불러오기
	public HashMap<String, Object> getChangeList(HashMap<String, Object> params) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		
		//페이징 처리		
		//선택한 페이지 수
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		//해당 페이지에서 몇번째 게시물부터 보여줄건지
		int offset = 5*(page-1);
		params.put("offset", offset);
		//총 페이지 수
		int total = 0;
		
		//입력된 검색어
		String searchText = (String) params.get("searchText");
		
		//입력된 검색어가 없으면
		if (searchText.equals("")) {
			//교환내역 리스트
			list = ActivitiesDAO.changeList(params);
			//총 페이지 수
			total = list.size();
		}else { //입력된 검색어가 있으면
			//교환내역 리스트
			list = ActivitiesDAO.changeListSearch(params); 
			//총 페이지 수
			total = list.size();
		}
			
		//페이징 수 계산
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;

		map.put("list", list);
		map.put("offset", offset);
		map.put("currPage", page);
		map.put("pages", range);
		return map;
	}

	//교환내역 리스트 불러오기
	public HashMap<String, Object> getActivitiesRentList(HashMap<String, Object> params) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		
		//페이징 처리		
		//선택한 페이지 수
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		//해당 페이지에서 몇번째 게시물부터 보여줄건지
		int offset = 5*(page-1);
		params.put("offset", offset);
		//총 페이지 수
		int total = 0;
		
		//입력된 검색어
		String searchText = (String) params.get("searchText");
		
		//입력된 검색어가 없으면
		if (searchText.equals("")) {
			//대여내역 리스트
			list = ActivitiesDAO.rentList(params);
			//총 페이지 수
			total = list.size();
		}else { //입력된 검색어가 있으면
			//대여내역 리스트
			list = ActivitiesDAO.rentListSearch(params); 
			//총 페이지 수
			total = list.size();
		}

		//페이징 수 계산
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;

		map.put("list", list);
		map.put("offset", offset);
		map.put("currPage", page);
		map.put("pages", range);
		return map;
	}


}
