package kr.co.book.mypage.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("library")
public class LibraryDTO {
	/*
	 * LIBRARY_IDX,MEMBER_IDX,LIBRARY_ISBN,LIBRARY_TITLE,LIBRARY_COVER,
	 * LIBRARY_AUTHOR,
	 * LIBRARY_PRICE,LIBRARY_PUBLISHER,LIBRARY_DESCRIPTION,LIBRARY_PUBDATE,
	 * LIBRARY_INFO, LIBRARY_USE,LIBRARY_SHARESTATE,LIBRARY_BLIND,LIBRARY_REG_DATE
	 */
	
	private int LIBRARY_IDX;
	private int MEMBER_IDX;
	private long LIBRARY_ISBN;
	private String  LIBRARY_TITLE;
	private String  LIBRARY_COVER;
	private String LIBRARY_AUTHOR;
	private int LIBRARY_PRICE;
	private String LIBRARY_PUBLISHER;
	private String LIBRARY_DESCRIPTION;
	private Date LIBRARY_PUBDATE;
	private String LIBRARY_INFO;
	private String LIBRARY_USE;
	private boolean LIBRARY_SHARESTATE;
	private boolean LIBRARY_BLIND;
	private Date LIBRARY_REG_DATE;
	
	
	public int getLIBRARY_IDX() {
		return LIBRARY_IDX;
	}
	public void setLIBRARY_IDX(int lIBRARY_IDX) {
		LIBRARY_IDX = lIBRARY_IDX;
	}
	public int getMEMBER_IDX() {
		return MEMBER_IDX;
	}
	public void setMEMBER_IDX(int mEMBER_IDX) {
		MEMBER_IDX = mEMBER_IDX;
	}
	public long getLIBRARY_ISBN() {
		return LIBRARY_ISBN;
	}
	public void setLIBRARY_ISBN(long lIBRARY_ISBN) {
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
	public int getLIBRARY_PRICE() {
		return LIBRARY_PRICE;
	}
	public void setLIBRARY_PRICE(int lIBRARY_PRICE) {
		LIBRARY_PRICE = lIBRARY_PRICE;
	}
	public String getLIBRARY_PUBLISHER() {
		return LIBRARY_PUBLISHER;
	}
	public void setLIBRARY_PUBLISHER(String lIBRARY_PUBLISHER) {
		LIBRARY_PUBLISHER = lIBRARY_PUBLISHER;
	}
	public String getLIBRARY_DESCRIPTION() {
		return LIBRARY_DESCRIPTION;
	}
	public void setLIBRARY_DESCRIPTION(String lIBRARY_DESCRIPTION) {
		LIBRARY_DESCRIPTION = lIBRARY_DESCRIPTION;
	}
	public Date getLIBRARY_PUBDATE() {
		return LIBRARY_PUBDATE;
	}
	public void setLIBRARY_PUBDATE(Date lIBRARY_PUBDATE) {
		LIBRARY_PUBDATE = lIBRARY_PUBDATE;
	}
	public String getLIBRARY_INFO() {
		return LIBRARY_INFO;
	}
	public void setLIBRARY_INFO(String lIBRARY_INFO) {
		LIBRARY_INFO = lIBRARY_INFO;
	}
	public String getLIBRARY_USE() {
		return LIBRARY_USE;
	}
	public void setLIBRARY_USE(String lIBRARY_USE) {
		LIBRARY_USE = lIBRARY_USE;
	}
	public boolean isLIBRARY_SHARESTATE() {
		return LIBRARY_SHARESTATE;
	}
	public void setLIBRARY_SHARESTATE(boolean lIBRARY_SHARESTATE) {
		LIBRARY_SHARESTATE = lIBRARY_SHARESTATE;
	}
	public boolean isLIBRARY_BLIND() {
		return LIBRARY_BLIND;
	}
	public void setLIBRARY_BLIND(boolean lIBRARY_BLIND) {
		LIBRARY_BLIND = lIBRARY_BLIND;
	}
	public Date getLIBRARY_REG_DATE() {
		return LIBRARY_REG_DATE;
	}
	public void setLIBRARY_REG_DATE(Date lIBRARY_REG_DATE) {
		LIBRARY_REG_DATE = lIBRARY_REG_DATE;
	}
	
	
	
	
}
