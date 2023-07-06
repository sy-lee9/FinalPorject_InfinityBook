package kr.co.book.chat.dto;

import org.apache.ibatis.type.Alias;

@Alias("chat")
public class ChatDTO {
	
	// Library	
	private String LIBRARY_IDX;
	private String LIBRARY_ISBN;
	private String LIBRARY_TITLE;
	private String LIBRARY_COVER;
	private String LIBRARY_AUTHOR;
	private String LIBRARY_INFO;
	
	// Chat
	private String CHAT_IDX;
	private String CODE_IDX;
	private String IDX;
	private String CHAT_SENDER;
	private String CHAT_RECIEVER;
	private String CHAT_CHAT;
	private String CHAT_CHECK;
	private String CHAT_DATE;
	
	// Member	
	private String MEMBER_IDX;
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_nick;
	
	// 안읽은 메세지 갯수 
	private int unread;
	
	// 신청한 사람
	private String applyuser;
	
	

	public String getOther_nick() {
		return other_nick;
	}

	public void setOther_nick(String other_nick) {
		this.other_nick = other_nick;
	}

	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}

	public String getApplyuser() {
		return applyuser;
	}

	public void setApplyuser(String applyuser) {
		this.applyuser = applyuser;
	}

	public String getLIBRARY_IDX() {
		return LIBRARY_IDX;
	}

	public void setLIBRARY_IDX(String lIBRARY_IDX) {
		LIBRARY_IDX = lIBRARY_IDX;
	}

	public String getLIBRARY_ISBN() {
		return LIBRARY_ISBN;
	}

	public void setLIBRARY_ISBN(String lIBRARY_ISBN) {
		LIBRARY_ISBN = lIBRARY_ISBN;
	}

	public String getLIBRARY_TITLE() {
		return LIBRARY_TITLE;
	}

	public void setLIBRARY_TITLE(String lIBRARY_TITLE) {
		LIBRARY_TITLE = lIBRARY_TITLE;
	}

	public String getLIBRARY_COVER() {
		return LIBRARY_COVER;
	}

	public void setLIBRARY_COVER(String lIBRARY_COVER) {
		LIBRARY_COVER = lIBRARY_COVER;
	}

	public String getLIBRARY_AUTHOR() {
		return LIBRARY_AUTHOR;
	}

	public void setLIBRARY_AUTHOR(String lIBRARY_AUTHOR) {
		LIBRARY_AUTHOR = lIBRARY_AUTHOR;
	}

	public String getLIBRARY_INFO() {
		return LIBRARY_INFO;
	}

	public void setLIBRARY_INFO(String lIBRARY_INFO) {
		LIBRARY_INFO = lIBRARY_INFO;
	}

	public String getCHAT_IDX() {
		return CHAT_IDX;
	}

	public void setCHAT_IDX(String cHAT_IDX) {
		CHAT_IDX = cHAT_IDX;
	}

	public String getCODE_IDX() {
		return CODE_IDX;
	}

	public void setCODE_IDX(String cODE_IDX) {
		CODE_IDX = cODE_IDX;
	}

	public String getIDX() {
		return IDX;
	}

	public void setIDX(String iDX) {
		IDX = iDX;
	}

	public String getCHAT_SENDER() {
		return CHAT_SENDER;
	}

	public void setCHAT_SENDER(String cHAT_SENDER) {
		CHAT_SENDER = cHAT_SENDER;
	}

	public String getCHAT_RECIEVER() {
		return CHAT_RECIEVER;
	}

	public void setCHAT_RECIEVER(String cHAT_RECIEVER) {
		CHAT_RECIEVER = cHAT_RECIEVER;
	}

	public String getCHAT_CHAT() {
		return CHAT_CHAT;
	}

	public void setCHAT_CHAT(String cHAT_CHAT) {
		CHAT_CHAT = cHAT_CHAT;
	}

	public String getCHAT_CHECK() {
		return CHAT_CHECK;
	}

	public void setCHAT_CHECK(String cHAT_CHECK) {
		CHAT_CHECK = cHAT_CHECK;
	}

	public String getCHAT_DATE() {
		return CHAT_DATE;
	}

	public void setCHAT_DATE(String cHAT_DATE) {
		CHAT_DATE = cHAT_DATE;
	}

	public String getMEMBER_IDX() {
		return MEMBER_IDX;
	}

	public void setMEMBER_IDX(String mEMBER_IDX) {
		MEMBER_IDX = mEMBER_IDX;
	}
	
	
}
