package kr.co.book.club.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.club.dao.ClubDAO;
import kr.co.book.club.dto.ClubDTO;

@Service
@MapperScan(value= {"kr.co.book.club.dao"})
public class ClubService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ClubDAO clubDAO;
	
	
	public HashMap<String, Object> clubList(String sPage, String searchText) {
		HashMap<String, Object> clubs = new HashMap<String, Object>();	
		ArrayList<ClubDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 5*(page-1);
		int total = 0;
		
		if (searchText.equals("default")) {
			total = clubDAO.totalClubList();
			list = clubDAO.clubList(offset);
		}else {
			total = clubDAO.totalClubListSearch(searchText);
			list = clubDAO.clubListSearch(offset,searchText);
		}
		
		
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		clubs.put("offset", offset);
		clubs.put("list", list);
		clubs.put("currPage", page);
		clubs.put("pages", range);
		
		return clubs;
	}


	public ClubDTO clubDetail(String club_idx) {
		return clubDAO.clubDetail(club_idx);
	}
	


}
