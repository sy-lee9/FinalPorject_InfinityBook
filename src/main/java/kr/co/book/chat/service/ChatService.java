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
	
	/*
	private final MessageDAO dao;
	
	public MessageService(MessageDAO dao) {
		this.dao = dao;
	}
	*/
		
	public ArrayList<ChatDTO> messageList(ChatDTO dto) {
		String MEMBER_IDX = dto.getMEMBER_IDX();
		logger.info("서비스 시작");
		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 nick
		ArrayList<ChatDTO> list = dao.message_list(dto);
		
		for (ChatDTO mto : list) {	
			mto.setMEMBER_IDX(MEMBER_IDX);
			// 현재 사용자가 해당 채팅방에서 안읽은 메세지의 갯수를 가져온다.
			int unread = dao.count_unread(mto);
			// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
//			String profile = dao.get_other_profile(mto);
			// 안읽은 메세지 갯수를 mto에 set한다.
			mto.setUnread(unread);
			// 메세지 상대의 프로필사진을 mto에 set한다.
//			mto.setProfile(profile);
			// 메세지 상대 nick을 세팅한다. other_nick
			if (MEMBER_IDX.equals(mto.getCHAT_SENDER())) {
				mto.setOther_nick(mto.getCHAT_RECIEVER());
			} else {
				mto.setOther_nick(mto.getCHAT_SENDER());
			}
		}
		logger.info("서비스 종료");
		return list;
	}
	@Transactional
	public ArrayList<ChatDTO> roomContentList(ChatDTO to) {

		// 메세지 내역을 가져온다
		ArrayList<ChatDTO> clist = dao.room_content_list(to);
		
		// 해당 방의 메세지들 중 받는 사람이 현재사용자인 메세지를 모두 읽음 처리한다
		int success = dao.message_read_chk(to);
		
		return clist;
	}

	public int messageSendInlist(ChatDTO to) {
		/*
		// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
					if(to.getRoom() == 0) {	// room이 0이라면 프로필에서 보낸거다
						int exist_chat = dao.exist_chat(to);
						// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될 경우를 구분하기 위함
						if(exist_chat == 0) {	// 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
							int max_room = dao.max_room(to);
							to.setRoom(max_room+1);
						}else {		// 메세지 내역이 있다면 해당 room 번호를 가져온다.
							int room = Integer.parseInt(dao.select_room(to));
							to.setRoom(room);
						}
					}
		*/		
					int flag = dao.messageSendInlist(to);
					return flag;
				}
/*
	public HashMap<String, String> login(String id, String pw) {
		return dao.login(id,pw);
	}
	*/
	
	
	public int read_chk(ChatDTO dto) {
		
		return dao.message_read_chk(dto);
	}
	
	
	
	@Transactional
	public String chatphoto(HashMap<String, String> params, MultipartFile photo, HttpSession session) {
		
		String oriPhotoname = photo.getOriginalFilename();
		String ext = oriPhotoname.substring(oriPhotoname.lastIndexOf("."));
		String serPhotoname = System.currentTimeMillis()+ext;
		logger.info(oriPhotoname+"->"+serPhotoname);
		ChatDTO to = new ChatDTO();
		to.setCODE_IDX(params.get("CODE_IDX"));
		to.setIDX(params.get("IDX"));
		to.setCHAT_SENDER(session.getAttribute("MEMBER_IDX").toString());
		to.setCHAT_RECIEVER(params.get("CHAT_RECIEVER"));
		to.setCHAT_CHAT("/upload/"+serPhotoname);
		
		dao.messageSendInlist(to);
				
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get(root+"/"+serPhotoname);
			Files.write(path, bytes);
			
			logger.info(serPhotoname+" save OK");
			dao.fileWrite(params.get("CODE_IDX"), params.get("IDX"),session.getAttribute("MEMBER_IDX").toString(),oriPhotoname, serPhotoname);
			logger.info("사진 저장 완료");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String photoroot = "/upload/"+serPhotoname;
		
		return photoroot;
	}
	
	}
	
