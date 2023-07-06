package kr.co.book.transaction.dto;

import org.apache.ibatis.type.Alias;

@Alias("change")
public class ChangeDTO {
	
	// Library	
	private String LIBRARY_IDX;
	private String MEMBER_IDX;
	private String LIBRARY_ISBN;
	private String LIBRARY_TITLE;
	private String LIBRARY_COVER;
	private String LIBRARY_AUTHOR;
	private String LIBRARY_INFO;
	
	
	
	public String getLIBRARY_IDX() {
		return LIBRARY_IDX;
	}
	public void setLIBRARY_IDX(String lIBRARY_IDX) {
		LIBRARY_IDX = lIBRARY_IDX;
	}
	public String getMEMBER_IDX() {
		return MEMBER_IDX;
	}
	public void setMEMBER_IDX(String mEMBER_IDX) {
		MEMBER_IDX = mEMBER_IDX;
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
	
	
	
	
}
