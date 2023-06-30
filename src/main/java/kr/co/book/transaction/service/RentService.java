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
import kr.co.book.transaction.dao.RentDAO;

@Service
@MapperScan(value={"kr.co.book.transaction.dao"})
public class RentService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RentDAO dao;
	@Autowired ChangeDAO cdao;
	
	
	@Transactional
	public void rentapply(HashMap<String, String> params) {
		
		// 대여신청
		dao.rentapply(params);
		
		// 대여신청 idx 들고오기
		String IDX = dao.findrent_idx(params);
		
		// 채팅방(대여신청자) 만들기
		int code = 3;		
		cdao.createchatroom(code,params.get("MEMBER_IDX"),IDX);
		
		// 대여신청한 책에 대한 정보(회원 idx, 책 이름) 들고오기
		ChatDTO dto = cdao.findchbmidx(params);
		
		// 채팅방(신청받은자) 만들기
		cdao.createchatroom(code,dto.getMEMBER_IDX(),IDX);
		
		// 신청내역 대화방에 뿌려주기
		cdao.applychatcontent(code,IDX,params.get("MEMBER_IDX"),dto.getMEMBER_IDX(),dto.getLIBRARY_TITLE());
		
	}
}
