package kr.co.book.bookReport.dao;

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

}
