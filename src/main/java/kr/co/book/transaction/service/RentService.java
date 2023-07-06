package kr.co.book.transaction.service;



import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.book.transaction.dao.ChangeDAO;
import kr.co.book.transaction.dao.RentDAO;
import kr.co.book.transaction.dto.RentDTO;

@Service
@MapperScan(value={"kr.co.book.transaction.dao"})
public class RentService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RentDAO dao;
	@Autowired ChangeDAO cdao;
	
	// 대여 신청
	@Transactional
	public void rentapply(HashMap<String, String> params) {
		
		// 대여 신청
		dao.rentapply(params);
		
		// 대여 IDX
		String IDX = dao.findrent_idx(params);
		
		// 대화방 만들기
		int code = 3;		
		dao.createchatroom(code,params.get("MEMBER_IDX"),IDX);
		
		// 대여신청한 책에 대한 정보(회원 idx, 책 이름) 들고오기
		RentDTO dto = dao.findchbmidx(params);
		
		// 대화방 만들기
		dao.createchatroom(code, dto.getMEMBER_IDX(),IDX);
		
		// 신청내역 대화방에 뿌려주기
		dao.applychatcontent(code, IDX, params.get("MEMBER_IDX"), dto.getMEMBER_IDX(), dto.getLIBRARY_TITLE());
		
	}
	
	// 처음 대여 신청 정보
	public HashMap<String, Object> rentreservation(String idx) {

		// 처음 대여 신청정보
		return dao.rentreservation(idx);
	}
	
	// 대여 약속 잡기 
	@Transactional
	public void rentreservation(@RequestParam HashMap<String, Object> params) {
		
		// 대여 약속 잡기
		dao.updaterent(params);
		// 대여 약속 정보 채팅으로 뿌려주기
		dao.chatrentreservation(params);
		
	}

	
}
