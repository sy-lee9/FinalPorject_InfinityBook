package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.book.mypage.dao.TrackerDAO;
import kr.co.book.mypage.dto.TrackerDTO;
import reactor.core.publisher.Mono;

/*
 * TrackerController : 트래커 서비스
 * @author 이수연
 */
@Service
@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public class TrackerService {
	
	@Autowired TrackerDAO TrackerDAO;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	//알라딘 API KEY
	@Value("${aladin.key}") private String KEY;
   
	//트래커에 저장할 책 검색 
    public ModelAndView trackerBookSearch(String searchType, String searchValue) {
    	
    	//알라딘 API URI
    	String uri = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    	
    	//이동할 페이지
    	ModelAndView mav = new ModelAndView("/tracker/trackerSearch");
    	//공백 제거
    	String replaceValue = searchValue.replaceAll("\\s", "");
    	
    	//검색어 없을 경우 false 반환
    	if(replaceValue == "") {
    		mav.addObject("search",false);
    	}else {	//검색어 있을 경우    		
    		
    		//받아올 정보 설정
    		String MaxResults = "100";
    		String Start = "1";
    		String Cover = "Big";
    		String SearchTarget = "Book";
    		String output = "JS";
    		String Version = "20131101";
    		
    		//URI 생성
    		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
    		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
    		
    		//WebClient 생성
    		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();
    		
    		//요청 및 응답값 받아오기
    		Mono<HashMap> mono = client.get()
    				.uri("?ttbkey="+KEY+"&Start="+Start+"&MaxResults="+MaxResults+"&QueryType="+searchType+"&Query="+replaceValue+
    						"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output+"&Version="+Version)
    				.retrieve().bodyToMono(HashMap.class);
    		
    		//응답값을 Map<String, Object> 형태로 변환
    		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
    		
    		//검색정보 내려보내기
    		mav.addObject("list", resp);
    		}    		
		return mav;
	}
  
    //트래커에 책 추가
	public boolean trackerAddBook(HashMap<String, Object> params) {
		boolean success = false;
		
		String isbn = (String) params.get("isbn");
		
		//BOOK 테이블에 책 정보가 있는지 확인
		int count = TrackerDAO.bookInfoChk(isbn);
		
		//책 정보가 저장되어 있을 경우
		if(count > 0) {
			if(saveTracker(params) == 1) { //트래커에 저장하는 메서드
				success = true;
			}
		}else { //책 정보가 없을 경우
			//책정보를 저장하는 메서드
			int row = saveBookInfo(params);
			
			//트래커에 저장
			if(row == 1) {
				if(saveTracker(params) == 1) { //트래커에 저장하는 메서드
					success = true;
				}   
			}
    					
		}		
		return success;
	}
	
	//책정보를 저장하는 메서드
	public int saveBookInfo(HashMap<String, Object> params) {
		int row = 0;
		
    	//알라딘 API URI(총페이지 수 포함) 및 검색결과 설정
		String uri = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";			
		String output = "JS";
		String Version = "20131101";

		//URI 생성
		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
		fac.setEncodingMode(EncodingMode.VALUES_ONLY);

		//WebClient 생성
		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();

		//요청 및 응답값 받아오기
		Mono<HashMap> mono = client.get()
				.uri("?ttbkey="+KEY+"&itemIdType="+"ISBN"+"&ItemId="+params.get("isbn")+"&output="+output+"&Version="+Version)
				.retrieve().bodyToMono(HashMap.class);
		
		//받아온 응답
		Map<String, Object> resp = mono.flux().toStream().findFirst().get();

		//리스트로 원하는 정보 담기
		List<Map<String, Object>> bookInfo = (List<Map<String, Object>>) resp.get("item");
		
		TrackerDTO dto = new TrackerDTO();
		
		dto.setCover((String) params.get("cover"));
		
		//원하는 정보 꺼내서 DTO에 저장
		if (bookInfo != null) {
		    for (Map<String, Object> detail : bookInfo) {
		    	dto.setIsbn((String) detail.get("isbn13"));
		    	dto.setTitle((String) detail.get("title"));
		    	dto.setAuthor((String) detail.get("author"));
		    	dto.setPublisher((String) detail.get("publisher"));
		    	dto.setDescription((String) detail.get("description"));
		    	dto.setPubdate((String) detail.get("pubDate"));    
		    	
		    	Map<String, Object> subInfo = (Map<String, Object>) detail.get("subInfo");

		    	dto.setTotalPage((int) subInfo.get("itemPage"));
		    }
		    
		    dto.setLoginIdx((int) params.get("loginIdx"));
		    dto.setJsp(String.valueOf(params.get("jsp")));
		    
		    //BOOK 테이블에 책정보 저장
		    row = TrackerDAO.saveBook(dto);
		}    				
		return row;
	}
	
	//트래커에 저장하는 메서드
	public int saveTracker(HashMap<String, Object> params) {
		int row = TrackerDAO.saveTracker(params);
		return row;
	}

	//총 페이지 수 가져오는 메서드
	public int getTotalPage(HashMap<String, Object> params) {
		int totalPage = 0;
		String isbn = String.valueOf(params.get("isbn"));
		
		if(TrackerDAO.bookInfoChk(isbn) == 1) { //BOOK 테이블에 책정보가 있을 경우
			//총페이지 수 가져오기
			totalPage = TrackerDAO.getTotalPage(isbn);
		}else { //BOOK 테이블에 책정보가 없을 경우
			//책 정보를 저장하는 메서드
			int row = saveBookInfo(params);
			if(row == 1) { //책 정보 저장 후
				//총페이지 수 가져오기
				totalPage = TrackerDAO.getTotalPage(isbn);
			}
		}		
		return totalPage;
	}

	//트래커 리스트 가져오기
	public ModelAndView trackerList(int loginIdx) {
		
		ModelAndView mav = new ModelAndView("/tracker/trackerList");		
		ArrayList<HashMap<String, Object>> trackerList = null;
		
		if(String.valueOf(loginIdx) != null) {
			trackerList = TrackerDAO.getTrackerList(loginIdx);
			if(trackerList != null) {
				mav.addObject("trackerList",trackerList);
			}
		}
		
		return mav;
	}

	//트래커 책 상세보기 페이지
	public ModelAndView trackerDetail(String trackerIdx) {
		ModelAndView mav = new ModelAndView("/tracker/trackerDetail");
		
		//책 상세정보 가져와서 내려보내기
		HashMap<String, Object> map = TrackerDAO.trackerDetail(trackerIdx);
		mav.addObject("book",map);
		
		return mav;
	}
	
	//트래커 읽은 기록 수정
	public HashMap<String, Object> trackerUpdateBook(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//읽은 기록 수정
		int row = TrackerDAO.trackerUpdateBook(params);
		if(row == 1) {
			map.put("success", "수정완료");
		}
		
		//해당 책 총 페이지 수 가져오기
		int totalPage = TrackerDAO.getTotalPage((String) params.get("isbn"));
		
		//읽은 페이지와 총페이지가 같을 경우 종료일 저장
		int readPage = Integer.parseInt((String) params.get("readPage"));
		int loginIdx = (int) params.get("loginIdx");
		String isbn = (String) params.get("isbn");
		
	    if (readPage == totalPage) {
	        TrackerDAO.saveEndDate(loginIdx,isbn);
	    }
		
		return map;
	}

	//트래커 기록 삭제
	public int trackerDeleteBook(String isbn, int loginIdx) {
		return TrackerDAO.trackerDeleteBook(isbn,loginIdx);
	}

	//메모 저장
	public HashMap<String, Object> trackerAddMemo(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = TrackerDAO.trackerAddMemo(params);
		if(row == 1) {
			map.put("success",1);
		}
		return map;
	}

	//메모 리스트 가져오기
	public HashMap<String, Object> getMemoList(String trackerIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<HashMap<String, Object>> list = TrackerDAO.getMemoList(trackerIdx);
		map.put("list", list);
		
		return map;
	}

	//메모 삭제
	public HashMap<String, Object> memoDelete(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = TrackerDAO.memoDelete(params);
		
		if(row == 1) {
			map.put("success", 1);
		}
		
		return map;
	}

	//수정할 메모 내용 가져오기
	public String getContent(HashMap<String, Object> params) {
		return TrackerDAO.getContent(params);
	}

	//메모 내용 수정
	public HashMap<String, Object> memoUpdate(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = TrackerDAO.memoUpdate(params);
		
		if(row == 1) {
			map.put("success", 1);
		}
		
		return map;
	}
	
	
	
	/*모임에서 사용하는 메서드*/
	  
	//모임에서 사용할 책 검색 
	public ModelAndView clubBookSearch(String searchType, String searchValue) {

    	//알라딘 API URI
		String uri = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    	
    	ModelAndView mav = new ModelAndView("/club/clubBookPop");
    	String replaceValue = searchValue.replaceAll("\\s", "");

    	//검색어 없을 경우 false 반환
    	if(replaceValue == "") {
    		mav.addObject("search",false);
    	}else {  //검색어 있을 경우  	
    		//받아올 정보 설정
    		String MaxResults = "100";
    		String Start = "1";
    		String Cover = "Big";
    		String SearchTarget = "Book";
    		String output = "JS";
    		String Version = "20131101";

    		//URI 생성
    		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
    		fac.setEncodingMode(EncodingMode.VALUES_ONLY);

    		//WebClient 생성
    		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();

    		//요청 및 응답값 받아오기
    		Mono<HashMap> mono = client.get()
    				.uri("?ttbkey="+KEY+"&Start="+Start+"&MaxResults="+MaxResults+"&QueryType="+searchType+"&Query="+replaceValue+
    						"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output+"&Version="+Version)
    				.retrieve().bodyToMono(HashMap.class);

    		//응답값을 Map<String, Object> 형태로 변환
    		Map<String, Object> resp = mono.flux().toStream().findFirst().get();

    		//검색정보 내려보내기
    		mav.addObject("list", resp);
    		}    		
		return mav;
	}


}
