package kr.co.book.bookReport.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.bookReport.dto.BookReportDTO;
import kr.co.book.mypage.dto.TrackerDTO;

@Mapper
public interface BookReportDAO {

	int bookInfoChk(String isbn);

	int saveBook(BookReportDTO dto);

	int bookReportWrite(HashMap<String, Object> params);

	BookReportDTO reportDetail(String book_report_idx);

	HashMap<String, Object> getBookInfo(String isbn);

	ArrayList<BookReportDTO> bookReportList();

	int totalReplyList(String book_idx);

	ArrayList<BookReportDTO> bookReplyList(String book_idx, int offset);

	void bookReplyWrite(String member_idx, String reply_content, String book_idx);

	void bookReplyDelete(String reply_idx);

	void bookReplyUpdate(String reply_idx, String reply_content);

	void bookReReply(String member_idx, String reply_idx, String reply_content);

	ArrayList<BookReportDTO> reReplyList(String reply_idx);

}
