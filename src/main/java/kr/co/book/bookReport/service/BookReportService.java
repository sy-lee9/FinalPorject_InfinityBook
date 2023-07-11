package kr.co.book.bookReport.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.book.bookReport.dao.BookReportDAO;
import kr.co.book.bookReport.dto.BookReportDTO;
import reactor.core.publisher.Mono;

@Service
@MapperScan(value= {"kr.co.book.bookReport.dao"})
public class BookReportService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired BookReportDAO dao;
	
	private static final String KEY = "ttbxmfhxmtm0939001";
	
	BookReportDTO dto = new BookReportDTO();
	
	public int write(HashMap<String, Object> params) {
		
		String val = (String) params.get("reportOpen");
		if(val.equals("1")) {
			params.replace("reportOpen", 1);
		}else {
			params.replace("reportOpen", 0);
		}
		
		
	int idx = 	dao.bookReportWrite(params);
	
	return idx;
		
	}
	
	//트래커에 책 추가
		public String report(HashMap<String, Object> params) {
			logger.info("params : {}",params);

			
			String isbn = (String) params.get("isbn");
			int idx = 0;
			
			//BOOK 테이블에 책 정보가 있는지 확인
			int count = dao.bookInfoChk(isbn);
			logger.info("count : "+count);
			
			//책 정보가 저장되어 있을 경우
			if(count > 0) {
				 idx = write(params);
				
			}else { //책 정보가 없을 경우
				//api로 책정보 검색해서 가져와서 book에 저장 후 트래커에 저장
				int row = saveBookInfo(params);
				
				if(row == 1) {
					idx = write(params);
					}   
				}
			String val = String.valueOf(params.get("book_report_idx"));
			int book_report_idx = Integer.parseInt(val);
			
			return "redirect:/BookReportDetail?book_report_idx="+book_report_idx;
		}
		
		public int saveBookInfo(HashMap<String, Object> params) {
			int row = 0;
			
			String uri = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";			
			String output = "JS";
			String Version = "20131101";
			
			DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
			fac.setEncodingMode(EncodingMode.VALUES_ONLY);
			
			WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();

			Mono<HashMap> mono = client.get()
					.uri("?ttbkey="+KEY+"&itemIdType="+"ISBN"+"&ItemId="+params.get("isbn")+"&output="+output+"&Version="+Version)
					.retrieve().bodyToMono(HashMap.class);
			
			//받아온 응답
			Map<String, Object> resp = mono.flux().toStream().findFirst().get();
			logger.info("resp : "+resp);

			List<Map<String, Object>> bookInfo = (List<Map<String, Object>>) resp.get("item");
			logger.info("bookInfo : "+bookInfo);
			
			BookReportDTO dto = new BookReportDTO();
			
			dto.setCover((String) params.get("cover"));
			
			if (bookInfo != null) {
			    for (Map<String, Object> detail : bookInfo) {
			    	dto.setIsbn((String) detail.get("isbn13"));
			    	dto.setTitle((String) detail.get("title"));
			    	dto.setAuthor((String) detail.get("author"));
			    	dto.setPublisher((String) detail.get("publisher"));
			    	dto.setDescription((String) detail.get("description"));
			    	dto.setPubdate((String) detail.get("pubDate"));    
			    	logger.info("bookInfo getAuthor : "+dto.getAuthor()+dto.getTitle()+dto.getCover()+dto.getAuthor()+dto.getPublisher()+dto.getDescription()+dto.getPubdate());
			    	
			    	Map<String, Object> subInfo = (Map<String, Object>) detail.get("subInfo");

			    	dto.setTotalPage((int) subInfo.get("itemPage"));
			    	logger.info("bookInfo getTotalPage : "+dto.getTotalPage());
			    }
			    
			    dto.setLoginIdx(Integer.parseInt((String) params.get("member_idx")));
			    dto.setJsp("BookReportWrite.jsp");
			    
			    row = dao.saveBook(dto);
			    logger.info("row : "+row);
			}    				
			return row;
		}

		public BookReportDTO bookReportDetail(String book_report_idx) {
			
			logger.info("book_report_idx = "+book_report_idx);
			
			return dao.reportDetail(book_report_idx);
		}

		public HashMap<String, Object> getBookInfo(String isbn) {
			
			return dao.getBookInfo(isbn);
			
			
		}

}
