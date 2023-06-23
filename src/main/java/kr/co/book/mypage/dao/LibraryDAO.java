package kr.co.book.mypage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.mypage.dto.LibraryDTO;

@Mapper
public interface LibraryDAO {
	/*
	 * LIBRARY_IDX,MEMBER_IDX,LIBRARY_ISBN,LIBRARY_TITLE,LIBRARY_COVER,
	 * LIBRARY_AUTHOR,
	 * LIBRARY_PRICE,LIBRARY_PUBLISHER,LIBRARY_DESCRIPTION,LIBRARY_PUBDATE,
	 * LIBRARY_INFO, LIBRARY_USE,LIBRARY_SHARESTATE,LIBRARY_BLIND,LIBRARY_REG_DATE
	 */
	
	ArrayList<LibraryDTO> list();

}
