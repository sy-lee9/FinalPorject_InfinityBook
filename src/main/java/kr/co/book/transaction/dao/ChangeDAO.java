package kr.co.book.transaction.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.chat.dto.ChatDTO;

@Mapper
public interface ChangeDAO {

	void changeapply(String mEMBER_IDX, String string, String string2, String string3);

	String findchange_idx(String mEMBER_IDX, String string, String string2, String string3);

	void createchatroom(int code, String mEMBER_IDX, String idx);

	ChatDTO findchbmidx(HashMap<String, String> params);

	void applychatcontent(int code, String idx, String mEMBER_IDX, String member_IDX2, String library_TITLE);

}
