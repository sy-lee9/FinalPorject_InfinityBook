package kr.co.book.mypage.service;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.util.URLEncoder;
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
import reactor.core.publisher.Mono;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"})
public class TrackerService {
	
	@Autowired TrackerDAO TrackerDAO;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String KEY = "ttbxmfhxmtm0939001";
    private static final String URL = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
   
    public ModelAndView trackerBookSearch(String searchType, String searchValue) {
    	
    	ModelAndView mav = new ModelAndView("tracker/trackerSearch");
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
    		
    		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(URL);
    		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
    		
    		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(URL).build();
    		
    		Mono<HashMap> mono = client.get()
    				.uri("?ttbkey="+KEY+"&Start="+Start+"&MaxResults="+MaxResults+"&QueryType="+searchType+"&Query="+replaceValue+
    						"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output+"&Version="+Version)
    				.retrieve().bodyToMono(HashMap.class);
    		
    		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
    		logger.info("resp : "+resp);
    		
    		mav.addObject("list", resp);
    		}    		
		return mav;
	}
    

}
