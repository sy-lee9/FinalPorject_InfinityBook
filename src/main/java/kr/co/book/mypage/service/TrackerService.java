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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.book.mypage.dao.TrackerDAO;
import kr.co.book.mypage.dto.TrackerDTO;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"})
public class TrackerService {
	
	@Autowired TrackerDAO TrackerDAO;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String API_KEY = "ttbxmfhxmtm0939001";
    private static final String BASE_URL = "http://www.aladdin.co.kr/ttb/api/ItemSearch.aspx?";


	public ModelAndView search(String title) {
		ModelAndView mav = new ModelAndView("tracker/trackerSearch");

		
		Map<String,String> hm = new HashMap<String,String>();
		hm.put("ttbkey", API_KEY);
		try {
			hm.put("Query", URLEncoder.encode(title, "UTF-8"));
			hm.put("QueryType", "Title");
			hm.put("MaxResults", "10");
			hm.put("start", "1");
			hm.put("SearchTarget", "Book");
			hm.put("output", "js");
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

		String req = BASE_URL + sb.toString();
		
		
		 // Spring 제공 restTemplate
        //RestTemplate restTemplate = new RestTemplate();
        //ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
		return mav;
	}
	
	

}
