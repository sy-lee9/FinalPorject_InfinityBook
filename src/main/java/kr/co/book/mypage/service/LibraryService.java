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
	
	public HashMap<String, Object> libraryList(String member_idx,String sPage) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<LibraryDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		total = libraryDAO.totalLibraryList(member_idx);
		list = libraryDAO.libraryList(member_idx,offset);
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		books.put("offset", offset);
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		return books;
	}

	public HashMap<String, Object> libraryRentList(String member_idx,String sPage) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<LibraryDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		total = libraryDAO.totalLibraryRentList(member_idx);
		list = libraryDAO.libraryRentList(member_idx,offset);
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		books.put("offset", offset);
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		return books;
	} 
	
	public HashMap<String, Object> libraryChangeList(String member_idx,String sPage) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<LibraryDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		total = libraryDAO.totalLibraryChangeList(member_idx);
		list = libraryDAO.libraryChangeList(member_idx,offset);
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		books.put("offset", offset);
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		return books;
	} 
	
	public HashMap<String, Object> libraryOwnList(String member_idx,String sPage) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<LibraryDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		total = libraryDAO.totalLibraryOwnList(member_idx);
		list = libraryDAO.libraryOwnList(member_idx,offset);
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		books.put("offset", offset);
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		return books;
	} 
	
	public HashMap<String, Object> libraryWishList(String member_idx,String sPage) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<LibraryDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		total = libraryDAO.totalLibraryWishList(member_idx);
		list = libraryDAO.libraryWishList(member_idx,offset);
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		books.put("offset", offset);
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		return books;
	} 
	
	
	
	
	
	
	public void write(HashMap<String, String> bookData) {
		libraryDAO.write(bookData);		
	}


	public int bookChk(String library_isbn, String member_idx) {
		
		return libraryDAO.bookChk(library_isbn,member_idx);
	}
	
	public int wishChk( String library_isbn, String member_idx) {
		return libraryDAO.wishChk(library_isbn,member_idx);
	}
	
	public void wishRegist(HashMap<String, String> bookInfo) {
		libraryDAO.wishRegist(bookInfo);
	}

	public LibraryDTO detail(String library_idx) {
		return libraryDAO.detail(library_idx);
	}

	public void libraryDelete(String library_idx) {
		libraryDAO.libraryDelete(library_idx);
	}

	public void update(HashMap<String, String> updateData) {
		libraryDAO.libraryUpdate(updateData);
	}

	public void libraryWishDelete(String library_isbn, String member_idx) {
		libraryDAO.libraryWishDelete(library_isbn,member_idx);
		
	}

	public HashMap<String, Object> deleteLibrary(ArrayList<String> delList,String member_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int delSize = delList.size();
		int successCnt = 0;
		for (String library_idx : delList) {
			successCnt += libraryDAO.deleteLibrary(library_idx,member_idx);
		}		
		map.put("msg", delSize+" 요청중 "+successCnt+" 개 삭제 했습니다.");		
		map.put("success", true);
		return map;
		
	}



	

	

	

	
	
	 
}
