package kr.co.book.chat.dto;

import org.apache.ibatis.type.Alias;

@Alias("chat")
public class ChatDTO {
	
	private String no; 
	private int room;
	private String send_nick;
	private String recv_nick;
	private String send_time;
	private String read_time;
	private String content;
	private String read_chk;
	
	//CHAT
	private String 	CHAT_IDX;
	private String 	CODE_IDX;
	private String 	IDX;
	private String 	CHAT_SENDER;
	private String 	CHAT_RECIEVER;
	private String 	CHAT_CHAT;
	private String 	CHAT_CHECK;
	private String 	CHAT_DATE;
	
	//LIBRARY
	private String LIBRARY_TITLE;
	
	//MEMBER
	private String 	MEMBER_IDX;
	private String 	MEMBER_NICKNAME;
	
	
	
	// 현재 사용자의 메세지 상대 nick을 담는다.
	private String other_nick;
	
	// 현재 사용자의 메세지 상대 profile을 담는다.
	private String profile;
	
	// 현재 사용자 nick
	private String nick;
	
	// 안읽은 메세지 갯수 
	private int unread;
	

	
	public String getLIBRARY_TITLE() {
		return LIBRARY_TITLE;
	}

	public void setLIBRARY_TITLE(String lIBRARY_TITLE) {
		LIBRARY_TITLE = lIBRARY_TITLE;
	}

	public String getMEMBER_IDX() {
		return MEMBER_IDX;
	}

	public void setMEMBER_IDX(String mEMBER_IDX) {
		MEMBER_IDX = mEMBER_IDX;
	}

	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}

	public void setMEMBER_NICKNAME(String mEMBER_NICKNAME) {
		MEMBER_NICKNAME = mEMBER_NICKNAME;
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

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getSend_nick() {
		return send_nick;
	}

	public void setSend_nick(String send_nick) {
		this.send_nick = send_nick;
	}

	public String getRecv_nick() {
		return recv_nick;
	}

	public void setRecv_nick(String recv_nick) {
		this.recv_nick = recv_nick;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getRead_time() {
		return read_time;
	}

	public void setRead_time(String read_time) {
		this.read_time = read_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRead_chk() {
		return read_chk;
	}

	public void setRead_chk(String read_chk) {
		this.read_chk = read_chk;
	}

	public String getOther_nick() {
		return other_nick;
	}

	public void setOther_nick(String other_nick) {
		this.other_nick = other_nick;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}
	
	
}
