package kr.co.book.bookReport.dto;

import java.sql.Date;

public class BookReportDTO {

	private String isbn;
	private String title;
	private String cover;
	private String author;
	private String publisher;
	private String description;
	private String pubdate;
	private int totalPage;
	private String jsp;
	private int loginIdx;
	private int book_report_idx;
	private String book_report_title;
	private String book_report_content;
	private Date book_report_date;
	private int book_report_hit;
	private int book_report_open;
	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public String getJsp() {
		return jsp;
	}
	public void setJsp(String jsp) {
		this.jsp = jsp;
	}
	public int getLoginIdx() {
		return loginIdx;
	}
	public void setLoginIdx(int loginIdx) {
		this.loginIdx = loginIdx;
	}
	public int getBook_report_idx() {
		return book_report_idx;
	}
	public void setBook_report_idx(int book_report_idx) {
		this.book_report_idx = book_report_idx;
	}
	public String getBook_report_title() {
		return book_report_title;
	}
	public void setBook_report_title(String book_report_title) {
		this.book_report_title = book_report_title;
	}
	public String getBook_report_content() {
		return book_report_content;
	}
	public void setBook_report_content(String book_report_content) {
		this.book_report_content = book_report_content;
	}
	public Date getBook_report_date() {
		return book_report_date;
	}
	public void setBook_report_date(Date book_report_date) {
		this.book_report_date = book_report_date;
	}
	public int getBook_report_hit() {
		return book_report_hit;
	}
	public void setBook_report_hit(int book_report_hit) {
		this.book_report_hit = book_report_hit;
	}
	public int getBook_report_open() {
		return book_report_open;
	}
	public void setBook_report_open(int book_report_open) {
		this.book_report_open = book_report_open;
	}

}	
	

