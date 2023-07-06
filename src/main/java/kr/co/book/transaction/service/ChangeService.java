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
import kr.co.book.transaction.dto.ChangeDTO;

@Service
@MapperScan(value={"kr.co.book.transaction.dao"})
public class ChangeService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChangeDAO dao;
	
	// 교환 신청 시
	@Transactional
	public void changeapply(String MEMBER_IDX,HashMap<String, String> params) {
			
		// 교환신청
		dao.changeapply(MEMBER_IDX,params.get("library_idx"),params.get("library_idx2"),params.get("change_date"));
		
		// 교환 IDX
		String idx = dao.findchange_idx(MEMBER_IDX,params.get("library_idx"),params.get("library_idx2"),params.get("change_date"));
		logger.info(idx);
		
		// 대화방(신청자) 만들기
		int code = 2;
		dao.createchatroom(code,MEMBER_IDX,idx);
		
		// 교환신청 책에 대한 정보(회원 idx, 책이름) 들고오기
		ChangeDTO dto = dao.findchbmidx(params);
		
		// 채팅방(신청받은자) 만들기		
		dao.createchatroom(code, dto.getMEMBER_IDX(),idx);
		
		// 신청내역 대화방에 뿌려주기
		dao.applychatcontent(code,idx,MEMBER_IDX, dto.getMEMBER_IDX(), dto.getLIBRARY_TITLE());
						
	}
	
	// 처음 교환 신청 정보
	public HashMap<String, Object> chgreservation(String idx) {
		
		// 교환 처음신청 정보 가져오기
		return dao.chgreservation(idx);
	}
	
	// 교환 약속 잡기
	@Transactional
	public void changereservation(HashMap<String, Object> params) {

		// 교환 약속 정보로 업데이트 후 
		dao.updatechange(params);
		
		// 교환 약속된 책정보 가져오기
		params.put("library", dao.message_librarydetail(params.get("LIBRARY_BOOK2").toString()));
		
		// 교환 약속정보 메세지 보내기
		dao.chatchangereservation(params);
		
	}
	
}
