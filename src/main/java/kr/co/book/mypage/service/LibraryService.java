package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.LibraryDAO;
import kr.co.book.mypage.dto.LibraryDTO;

@Service
public class LibraryService {
	
	
	 @Autowired LibraryDAO libraryDAO;
	 
	 Logger logger = LoggerFactory.getLogger(getClass());
	 
	 public ArrayList<LibraryDTO> list() { 
		 return libraryDAO.list(); 
	}

	public void write(HashMap<String, String> bookData) {
		libraryDAO.write(bookData);		
	}


	public int bookChk(String MEMBER_IDX, String LIBRARY_ISBN) {
		
		return libraryDAO.bookChk(MEMBER_IDX,LIBRARY_ISBN);
	}

	public LibraryDTO detail(String LIBRARY_IDX) {
		return libraryDAO.detail(LIBRARY_IDX);
	}

	public void libraryDelete(String LIBRARY_IDX) {
		libraryDAO.libraryDelete(LIBRARY_IDX);
	}

	public void update(HashMap<String, String> updateData) {
		libraryDAO.libraryUpdate(updateData);
	}
	 
}
