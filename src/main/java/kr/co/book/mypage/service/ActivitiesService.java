package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.ActivitiesDAO;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public class ActivitiesService {
	
	@Autowired ActivitiesDAO ActivitiesDAO;

	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> getChangeList(HashMap<String, Object> params) {
		logger.info("params : "+params);
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<HashMap<String, Object>> list = null;
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int offset = 5*(page-1);
		params.put("offset", offset);
		int total = 0;
		
		String searchText = (String) params.get("searchText");
		logger.info("searchText : "+searchText);
		
		if (searchText.equals("")) {
			total = ActivitiesDAO.totalChangeList(params);
			logger.info("total size : "+total);
			list = ActivitiesDAO.changeList(params);
			logger.info("list : "+list);
		} /*
			 * else { total = ActivitiesDAO.totalChangeListSearch(searchText); list =
			 * ActivitiesDAO.changeListSearch(offset,searchText); }
			 */
		
		
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		return map;
	}

}
