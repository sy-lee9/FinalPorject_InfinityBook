package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.book.mypage.dao.TrackerDAO;
import kr.co.book.mypage.dto.TrackerDTO;
import reactor.core.publisher.Mono;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"})
public class TrackerService {
	
	@Autowired TrackerDAO TrackerDAO;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String KEY = "ttbxmfhxmtm0939001";
   
    public ModelAndView trackerBookSearch(String searchType, String searchValue) {
    	
    	String uri = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    	
    	ModelAndView mav = new ModelAndView("/tracker/trackerSearch");
    	String replaceValue = searchValue.replaceAll("\\s", "");
    	logger.info("replaceValue : "+replaceValue);
    	logger.info("searchType : {} / searchValue : {}",searchType,replaceValue);
    	
    	if(replaceValue == "") {
    		mav.addObject("search",false);
    	}else {    		
    		String MaxResults = "100";
    		String Start = "1";
    		String Cover = "Small";
    		String SearchTarget = "Book";
    		String output = "JS";
    		String Version = "20131101";
    		
    		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
    		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
    		
    		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();
    		
    		Mono<HashMap> mono = client.get()
    				.uri("?ttbkey="+KEY+"&Start="+Start+"&MaxResults="+MaxResults+"&QueryType="+searchType+"&Query="+replaceValue+
    						"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output+"&Version="+Version)
    				.retrieve().bodyToMono(HashMap.class);
    		
    		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
    		logger.info("resp : "+resp.size());
    		
    		mav.addObject("list", resp);
    		}    		
		return mav;
	}

    //트래커에 완독한 책 추가
	public boolean trackerAddReadBook(String isbn) {
		logger.info("isbn : "+isbn);
		boolean success = false;
		
		//BOOK 테이블에 책 정보가 있는지 확인
		int count = TrackerDAO.bookInfoChk(isbn);
		logger.info("count : "+count);
		
		//책 정보가 저장되어 있을 경우
		if(count > 0) {
			saveTracker(isbn);
		}else { //책 정보가 없을 경우
			//api로 책정보 검색해서 가져와서 book에 저장 후 트래커에 저장
			
			String uri = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
			
    		String output = "JS";
    		String Version = "20131101";
    		
    		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
    		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
    		
    		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();
    		
    		//ttbkey=[TTBKey]&itemIdType=ISBN&ItemId=[도서의ISBN]&output=xml&Version=20131101&OptResult=ebookList,usedList,reviewList

    		Mono<HashMap> mono = client.get()
    				.uri("?ttbkey="+KEY+"&itemIdType="+"ISBN"+"&ItemId="+isbn+"&output="+output+"&Version="+Version)
    				.retrieve().bodyToMono(HashMap.class);
    		
    		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
    		logger.info("resp : "+resp);
    		
    		
    		
    		
    		List<Map<String, Object>> bookInfo = (List<Map<String, Object>>) resp.get("item");
    		logger.info("bookInfo : "+bookInfo);
    		
    		TrackerDTO dto = new TrackerDTO();
    		
    		if (bookInfo != null) {
    		    for (Map<String, Object> detail : bookInfo) {
    		    	dto.setIsbn((String) detail.get("isbn13"));
    		    	dto.setTitle((String) detail.get("title"));
    		    	dto.setCover((String) detail.get("cover"));
    		    	dto.setAuthor((String) detail.get("author"));
    		    	dto.setPublisher((String) detail.get("publisher"));
    		    	dto.setDescription((String) detail.get("description"));
    		    	dto.setPubdate((String) detail.get("pubDate"));    
    		    	logger.info("bookInfo getAuthor : "+dto.getAuthor()+dto.getTitle()+dto.getCover()+dto.getAuthor()+dto.getPublisher()+dto.getDescription()+dto.getPubdate());
    		    	
    		    	Map<String, Object> subInfo = (Map<String, Object>) detail.get("subInfo");

    		    	dto.setTotalPage((int) subInfo.get("itemPage"));
    		    	logger.info("bookInfo getTotalPage : "+dto.getTotalPage());
    		    	
    		    	
    		    }
    		    
    		    
    		}
    		
    		
    		

    		
    		
/*
    		if (bookInfo != null) {
    		    for (int i = 0; i < bookInfo.size(); i++) {
    		        if (i == 2) {
    		            Map<String, Object> item = bookInfo.get(i);
    		            List<Map<String, Object>> bookList = (List<Map<String, Object>>) item.get("value");

    		            if (bookList != null) {
    		                for (Map<String, Object> book : bookList) {
    		                    String cover = (String) book.get("cover");
    		                    String isbn13 = (String) book.get("isbn13");
    		                    String title = (String) book.get("title");
    		                    String author = (String) book.get("author");

    		                    // 처리할 로직 작성
    		                    System.out.println("Cover: " + cover);
    		                    System.out.println("ISBN13: " + isbn13);
    		                    System.out.println("Title: " + title);
    		                    System.out.println("Author: " + author);
    		                }
    		            }
    		        }
    		    }
    		}
 */   		
    					
		}
		
		return success;
	}
	
	//트래커에 저장 
	public int saveTracker(String isbn) {
		int row = 0;
		
		
		return row;
	}
    

}
