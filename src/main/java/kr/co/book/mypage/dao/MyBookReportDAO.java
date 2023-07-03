package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;

import kr.co.book.mypage.dto.MyBookReportDTO;


@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public interface MyBookReportDAO {

	int totalMyBookrport(String member_idx);

	ArrayList<MyBookReportDTO> myBookreport(String member_idx, int offset);

	int totalMyBookrportSearch(HashMap<String, Object> data);

	ArrayList<MyBookReportDTO> myBookReportSearch(HashMap<String, Object> data);
	
	

	int totalMyLike(String member_idx);

	ArrayList<MyBookReportDTO> myLike(String member_idx, int offset);

	int totalMyLikeSearch(HashMap<String, Object> data);

	ArrayList<MyBookReportDTO> myLikeSearch(HashMap<String, Object> data);

	

}
