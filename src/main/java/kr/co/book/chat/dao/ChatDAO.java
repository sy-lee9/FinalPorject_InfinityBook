package kr.co.book.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.chat.dto.ChatDTO;


@Mapper
public interface ChatDAO {

	ArrayList<ChatDTO> message_list(ChatDTO to);

	int count_unread(ChatDTO mto);

	// String get_other_profile(MessageDTO mto);

	ArrayList<ChatDTO> room_content_list(ChatDTO to);

	int message_read_chk(ChatDTO to);

	int exist_chat(ChatDTO to);

	int max_room(ChatDTO to);

	String select_room(ChatDTO to);

	int messageSendInlist(ChatDTO to);

	HashMap<String, String> login(String id, String pw);
	
	void changeapply(String midx, String string, String string2, String string3);

	String findchange_idx(String midx, String string, String string2, String string3);

	void createchatroom(int code, String midx, String idx);

	ChatDTO findchbmidx(HashMap<String, String> params);

	void applychatcontent(int code, String idx, String midx, String member_IDX, String library_TITLE);

	void rentapply(HashMap<String, String> params);

	String findrent_idx(HashMap<String, String> params);

	void fileWrite(String CODE_IDX, String IDX, String MEMBER_IDX, String oriPhotoname, String serPhotoname);




}
