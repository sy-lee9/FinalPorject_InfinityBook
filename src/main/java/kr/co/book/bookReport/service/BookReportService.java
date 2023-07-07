package kr.co.book.bookReport.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.bookReport.dao.BookReportDAO;

@Service
public class BookReportService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	//@Autowired BookReportDAO dao;

	public void write(String reportOpen, String reportTitle, String content) {
		
		
		
	}

	public void write(HashMap<String, String> params) {
		
		
		
		
	}

}
