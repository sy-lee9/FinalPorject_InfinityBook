package kr.co.book.transaction.dto;

import org.apache.ibatis.type.Alias;

@Alias("change")
public class ChangeDTO {

	//LIBRARY
	private String LIBRARY_TITLE;
	
	//MEMBER
	private String 	MEMBER_IDX;

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

	
	
	
	
}
