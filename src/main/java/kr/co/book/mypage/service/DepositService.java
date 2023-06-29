package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.DepositDAO;
import kr.co.book.mypage.dto.DepositDTO;

@Service

public class DepositService {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired DepositDAO depositDAO;
	
	public HashMap<String, Object> depositUseList(String member_idx,String sPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();	
		ArrayList<DepositDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		total = depositDAO.totalListCnt(member_idx);
		list = depositDAO.depositUseList(member_idx,offset);
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		
		return map;         
	}
}
