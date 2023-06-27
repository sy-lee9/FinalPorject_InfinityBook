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
	
	public HashMap<String, Object> libraryList(String sPage) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<LibraryDTO> list = null;
		
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		
		total = libraryDAO.totalLibraryList();
		list = libraryDAO.libraryList(offset);
		
		
		
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		
		books.put("offset", offset);
		
		
		
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		logger.info("list size : "+ total);
		logger.info("range : "+ range);
		return books;
	}
	 
	public void write(HashMap<String, String> bookData) {
		libraryDAO.write(bookData);		
	}


	public int bookChk(String LIBRARY_ISBN) {
		
		return libraryDAO.bookChk(LIBRARY_ISBN);
	}
	
	public int wishChk( String LIBRARY_ISBN) {
		return libraryDAO.wishChk(LIBRARY_ISBN);
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
