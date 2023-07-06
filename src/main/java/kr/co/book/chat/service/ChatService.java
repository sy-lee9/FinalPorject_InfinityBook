package kr.co.book.chat.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.book.chat.dao.ChatDAO;
import kr.co.book.chat.dto.ChatDTO;



@Service
@MapperScan(value={"kr.co.book.chat.dao"})
public class ChatService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChatDAO dao;
	
	@Value("${spring.servlet.multipart.location}") private String root;
	
	// 대화중인 대화 방
	public ArrayList<ChatDTO> messageList(ChatDTO dto) {
		String MEMBER_IDX = dto.getMEMBER_IDX();
		logger.info("서비스 시작");
		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 nick
		ArrayList<ChatDTO> list = dao.message_list(dto);
		
		for (ChatDTO cto : list) {	
			cto.setMEMBER_IDX(MEMBER_IDX);
			
			// 대화 방에 대한 안읽은 메세지의 갯수
			int unread = dao.count_unread(cto);

			// 안읽은 메세지 갯수를 mto에 set한다.
			cto.setUnread(unread);
			
			// 현재 채팅방의 책idx를 가져온다.
			String idx = cto.getIDX();
			int codeidx = Integer.parseInt(cto.getCODE_IDX());
			
			// 교환일 경우
			if(codeidx == 2) {
				// 교환 신청한 책 IDX
				cto.setLIBRARY_IDX(dao.chgbookidx(idx));
				
				// 교환 신청한 유저 IDX
				cto.setApplyuser(dao.chgapplyuser(idx));
				
			// 대여일 경우
			}else if (codeidx ==3) {
				// 대여 신청한 책 IDX
				cto.setLIBRARY_IDX(dao.rentbookidx(idx));
				
				// 대여 신청한 유저 IDX
				cto.setApplyuser(dao.rentapplyuser(idx));
			}

			// 메세지 상대 nick을 세팅한다. other_nick
			if (MEMBER_IDX.equals(cto.getCHAT_SENDER())) {
				cto.setOther_nick(cto.getCHAT_RECIEVER());
			} else {
				cto.setOther_nick(cto.getCHAT_SENDER());
			}
		}
		logger.info("서비스 종료");
		return list;
	}
	
	// 대화 내역
	@Transactional
	public ArrayList<ChatDTO> roomContentList(ChatDTO dto) {

		// 대화 내역
		ArrayList<ChatDTO> clist = dao.room_content_list(dto);
		
		// 대화 방의 메세지 읽음 처리
		int success = dao.message_read_chk(dto);
		
		return clist;
	}
	
	// 전송 메세지 저장
	public int messageSendInlist(ChatDTO dto) {
	
		int flag = dao.messageSendInlist(dto);
		return flag;
	}
	
	// 대화방 읽음 체크
	public int read_chk(ChatDTO dto) {
		
		return dao.message_read_chk(dto);
	}
	
	// 전송 사진 저장
	@Transactional
	public String chatphoto(HashMap<String, String> params, MultipartFile photo, HttpSession session) {
		
		String oriPhotoname = photo.getOriginalFilename();
		String ext = oriPhotoname.substring(oriPhotoname.lastIndexOf("."));
		String serPhotoname = System.currentTimeMillis()+ext;
		logger.info(oriPhotoname+"->"+serPhotoname);
		ChatDTO dto = new ChatDTO();
		dto.setCODE_IDX(params.get("CODE_IDX"));
		dto.setIDX(params.get("IDX"));
		dto.setCHAT_SENDER(session.getAttribute("loginIdx").toString());
		dto.setCHAT_RECIEVER(params.get("CHAT_RECIEVER"));
		dto.setCHAT_CHAT("/upload/"+serPhotoname);
		
		dao.messageSendInlist(dto);
				
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get(root+"/"+serPhotoname);
			Files.write(path, bytes);
			
			logger.info(serPhotoname+" save OK");
			dao.fileWrite(params.get("CODE_IDX"), params.get("IDX"),session.getAttribute("loginIdx").toString(),oriPhotoname, serPhotoname);
			logger.info("사진 저장 완료");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String photoroot = "/upload/"+serPhotoname;
		
		return photoroot;
	}
	
	// 대화 방의 책
	public HashMap<String, Object> message_librarydetail(String library) {
		
		return dao.message_librarydetail(library);
	}
	
	// 대화 방의 책 상태
	public HashMap<String, Object> total_stateajax(String CODE_IDX, String room, String other_nick, String member_idx, String library) {
		
		logger.info(room,other_nick,member_idx);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 대화 방의 책 상태
		map.put("librarystate", dao.librarystate(library));
		
		// 교환신청 or 대여신청 상태여부
		if(Integer.parseInt(CODE_IDX) == 2) {		
			
			// 다른사람과 교환 상태
			int chgck = dao.otherchangeck(room);
			map.put("chgck", chgck);
			
			// 나랑 교환상태
			map.put("changestate", dao.changestate(room, other_nick, member_idx));
			
		}else if(Integer.parseInt(CODE_IDX) == 3) {
			
			// 다른사람과 대여 상태
			int rentck = dao.otherrentck(room);
			map.put("rentck", rentck);
			
			// 나랑 대여상태
			map.put("rentstate", dao.rentstate(room, other_nick, member_idx));
			
		}
		
		
		return map;
	}
	
	// 약속 수락
	@Transactional
	public int reservationok_ajax(String CODE_IDX, String room, String other_nick, String library, String member_idx) {
		
		int success = 0;
		// 수락이 교환인지 대여인지
		// 교환일시				
		if(Integer.parseInt(CODE_IDX) == 2) {
			
			// 교환 예약 수락
			dao.finalchangeok(room,member_idx);
			success = 2;
						
		}else if(Integer.parseInt(CODE_IDX) == 3) {
						
			// 들고있는 보증금 들고오기
			int deposit = dao.userdeposit(member_idx);
						
			// 예약 걸린 보증금 들고오기
			int rentdeposit = dao.rentdeposit(room);			
			success = 1;
			// 내가 들고있는 보증금이 걸린 보증금보다 크다면
			if(deposit > rentdeposit) {
				
				// 대여 보증금 사용
				dao.usedeposit(member_idx, rentdeposit);
				
				// 대여 예약 수락
				dao.finalrentok(room,member_idx);
				
				// 대여 책 상태 변경
				dao.finalbookok(library);
				
				success = 2;
			}
		
		}
				
		return success;
	}
	
	// 약속 거절
	public int reservationno_ajax(String CODE_IDX, String room, String other_nick, String library, String member_idx) {
		
		int success = 0;
				
		if(Integer.parseInt(CODE_IDX) == 2) {
			// 교환 일시 들어옴
			// 교환 예약 취소
			success = dao.changereservationno(room,member_idx);
			
			
		}else if(Integer.parseInt(CODE_IDX) == 3) {
			// 대여 일시 들어옴
			// 대여 예약 취소
			success = dao.rentreservationno(room,member_idx);
			
			// 책 상태 되돌리기
			dao.finalbookno(library);
			
		}
		
		return success;
	}
	
	// 채팅 나가기
	public int chatout_ajax(String CODE_IDX, String room, String other_nick, String library, String member_idx) {

		int success = 0;
		int state = 0;
		
		// 나가기전 해당 대화방에서 예약중인지 대여중인지를 확인		
		if(Integer.parseInt(CODE_IDX) == 2) {
			// 현재 대화방이 교환이면
			// 현재 교환상태 확인
			 state = dao.chkchgroomstate(room);			
		}else if(Integer.parseInt(CODE_IDX) == 3) {
			// 현재 대화방이 대여이면
			// 현재 대여상태 확인
			state = dao.chkrentroomstate(room);			
		}
			// 현재 수락대기,예약중,대여중
			if(state == 1) {
				// 수락대기 상태라면
				success = 1;
			}else if(state == 2) {
				// 예약중이라면
				success = 2;
			}else if(state == 3) {
				// 대여중이라면
				success = 3;
			}else {
				// 대화방 나가기
				success = dao.chatout(CODE_IDX,room,member_idx);
				success = 4;
			}

		return success;
	}
	
	
	}
	
