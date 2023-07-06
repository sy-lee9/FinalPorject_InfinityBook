package kr.co.book.transaction.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.transaction.dto.ChangeDTO;

@Mapper
public interface ChangeDAO {

	// 교환 신청
	void changeapply(String mEMBER_IDX, String string, String string2, String string3);

	// 교환 IDX
	String findchange_idx(String mEMBER_IDX, String string, String string2, String string3);

	// 대화방 만들기
	void createchatroom(int code, String mEMBER_IDX, String idx);
	
	// 신청내역 대화방에 뿌려주기
	void applychatcontent(int code, String idx, String mEMBER_IDX, String member_IDX2, String library_TITLE);

	// 책에 대한 정보 들고오기
	ChangeDTO findchbmidx(HashMap<String, String> params);

	// 처음 교환 신청정보
	HashMap<String, Object> chgreservation(String idx);

	// 교환 약속 잡기
	void updatechange(HashMap<String, Object> params);

	// 교환 약속된 책정보 가져오기
	Object message_librarydetail(String string);

	// 교환 약속정보 메세지 보내기
	void chatchangereservation(HashMap<String, Object> params);


	
	
	
	



}
