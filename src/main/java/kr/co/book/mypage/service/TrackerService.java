package kr.co.book.mypage.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.book.mypage.dao.TrackerDAO;
import kr.co.book.mypage.dto.AladinDTO;
import kr.co.book.mypage.dto.TrackerDTO;
import reactor.core.publisher.Mono;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"})
public class TrackerService {
	
	@Autowired TrackerDAO TrackerDAO;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String key = "ttbxmfhxmtm0939001";
    private static final String url = "http://www.aladdin.co.kr/ttb/api/ItemSearch.aspx";

/*
	public ModelAndView trackerBookSearch(String title) {

		logger.info("title : "+title);
		ModelAndView mav = new ModelAndView("tracker/trackerSearch");

		
		Map<String,String> hm = new HashMap<String,String>();
		try {
			hm.put("ttbkey", API_KEY);
			hm.put("Query", URLEncoder.encode(title, "UTF-8"));
			hm.put("QueryType", "Title");
			hm.put("MaxResults", "100");
			hm.put("start", "1");
			hm.put("SearchTarget", "Book");
			hm.put("output", "JS");
			hm.put("Cover", "Big");
			hm.put("Version", "20131101");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		

		StringBuffer sb = new StringBuffer();
		Iterator<String> iter = hm.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			String val  = hm.get(key);
			sb.append(key).append("=").append(val).append("&");
		}

		String uri = BASE_URL + sb.toString();
		
		 // Spring 요청 제공 클래스 
        RequestEntity<Void> req = RequestEntity
        						 .get(uri)
        						 .build();
		
		
		 // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        logger.info("resp : "+resp.getBody());
        
        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
        ObjectMapper om = new ObjectMapper();
        AladinDTO resultVO = null;
        
        try {
        	resultVO = om.readValue(resp.getBody(), AladinDTO.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
        
        logger.info("resultVO :"+resultVO);
        List<TrackerDTO> list = resultVO.getItem(); 
        mav.addObject("list", list);
        logger.info("list :"+list);
	
		return mav;
	}
*/	
   
    public ModelAndView trackerBookSearch(String title) {

		logger.info("title : "+title);
		ModelAndView mav = new ModelAndView("tracker/trackerSearch");

		String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
		
		String MaxResults = "100";
		String Start = "1";
		String Cover = "Mini";
		String SearchTarget = "Small";
		String output = "JS";
		String Version = "20131101";
		
		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(url);
		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(url).build();
		
		Mono<HashMap> mono = client.get()
				.uri("?ttbkey="+key+"&MaxResults="+MaxResults+"&Query="+title+"&QueryType="
		+"Title"+"&Start="+Start+"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output
		+"&Version="+Version)
				.retrieve().bodyToMono(HashMap.class);
		
		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
		logger.info("resp : "+resp);
				
        mav.addObject("list", resp);
        logger.info("list :"+resp);
	
		return mav;
	}
    

}
