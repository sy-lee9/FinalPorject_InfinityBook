package kr.co.book.mypage.controller;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.book.mypage.dto.BookSearchDTO;
import kr.co.book.mypage.dto.LibraryDTO;
import kr.co.book.mypage.dto.NaverResultDTO;
import kr.co.book.mypage.service.LibraryService;

@Controller
public class LibraryController {
	
	@Autowired LibraryService libraryService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping("/libraryList.get")
	public String libraryList(Model model) {
		
		ArrayList<LibraryDTO> books = libraryService.list();
		model.addAttribute("books",books);
		
		return "/Library/libraryList";
	}
	
	
	@RequestMapping("/bookSelectPop.go")
	public String list(String text, Model model) {
			
			if(text == "") {
				List<BookSearchDTO> books = null; 
		        model.addAttribute("books", books);
			}else {
				// 네이버 검색 API 요청
				String clientId = "o4MJHO8fSzaaQAg5t8If"; 		
		        String clientSecret = "Dth4K5OkPp";
		        
		        URI uri = UriComponentsBuilder
		        		  .fromUriString("https://openapi.naver.com")
		        		  .path("/v1/search/book.json")
		        		  .queryParam("query", text)
		        		  .queryParam("display", 100)
		        		  .queryParam("sort", "sim")
		        		  .encode()
		        		  .build()
		        		  .toUri();
		        		  
		        // Spring 요청 제공 클래스 
		        RequestEntity<Void> req = RequestEntity
		        						 .get(uri)
		        						 .header("X-Naver-Client-Id", clientId)
		        						 .header("X-Naver-Client-Secret", clientSecret)
		        						 .build();
		        
		        // Spring 제공 restTemplate
		        RestTemplate restTemplate = new RestTemplate();
		        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
		        
		        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
		        ObjectMapper om = new ObjectMapper();
		        NaverResultDTO result = null;
		        
		        
		        try {
		        	result = om.readValue(resp.getBody(), NaverResultDTO.class);
		        	logger.info("result : "+ result);
		        	logger.info("result : "+ result.getItems().get(0).getTitle());
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
		        
		        List<BookSearchDTO> books =result.getItems(); 
		        model.addAttribute("books", books);
			}
			

			return "/Library/bookSelectPop";
		}
	
	@RequestMapping("/libraryWrite.go")
	  public String libraryWriteGo(@RequestParam HashMap<String, String> bookInfo, Model model) {
		logger.info("선택 책 정보 : " + bookInfo);
		int chk = libraryService.bookChk(bookInfo.get("MEMBER_IDX"),bookInfo.get("LIBRARY_ISBN"));
		logger.info("chk : " + chk );
		if (chk == 0) {
			model.addAttribute("book", bookInfo);
			return "/Library/libraryWrite";
		}else {
			model.addAttribute("msg","이미 등록된 책 입니다. ");
			return "/Library/bookSelectPop";
		}
		
	  }
	
	@RequestMapping("/libraryWrite.do")
	  public String libraryWrite(@RequestParam HashMap<String, String> bookData) {
		logger.info("작성 책 정보 : " + bookData);
		libraryService.write(bookData);
	    return "/Library/libraryDone";
	  }
	}
	
