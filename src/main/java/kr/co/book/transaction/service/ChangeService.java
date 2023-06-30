package kr.co.book.transaction.service;

import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.book.chat.dto.ChatDTO;
import kr.co.book.transaction.dao.ChangeDAO;

@Service
@MapperScan(value={"kr.co.book.transaction.dao"})
public class ChangeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChangeDAO dao;
	
	@Transactional
	public void changeapply(String MEMBER_IDX,HashMap<String, String> params) {
				
		// 교환신청
		dao.changeapply(MEMBER_IDX,params.get("LIBRARY_BOOK"),params.get("LIBRARY_BOOK2"),params.get("CHANGE_DATE"));
		
		// 교환신청 idx 들고오기
		String idx = dao.findchange_idx(MEMBER_IDX,params.get("LIBRARY_IDX"),params.get("LIBRARY_IDX2"),params.get("CHANGE_DATE"));
		
		// 채팅방(신청자) 만들기
		int code = 2;
		dao.createchatroom(code,MEMBER_IDX,idx);
		
		// 교환신청한 책에 대한 정보(회원 idx, 책이름) 들고오기
		ChatDTO dto = dao.findchbmidx(params);
		
		// 채팅방(신청받은자) 만들기		
		dao.createchatroom(code,dto.getMEMBER_IDX(),idx);
		
		// 신청내역 대화방에 뿌려주기
		dao.applychatcontent(code,idx,MEMBER_IDX,dto.getMEMBER_IDX(),dto.getLIBRARY_TITLE());
						
	}
}
