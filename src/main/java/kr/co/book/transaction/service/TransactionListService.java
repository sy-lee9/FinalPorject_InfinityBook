package kr.co.book.transaction.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import reactor.core.publisher.Mono;

@Service
public class TransactionListService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

	public Map<String, Object> bookSearch(String Query, String QueryType) {
		
		String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
		
		String ttbkey = "ttbtyhn00000921001";
		String MaxResults = "100";
		String Start = "1";
		String Cover = "Big";
		String SearchTarget = "Book";
		String output = "JS";
		String Version = "20131101";
		
		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(url);
		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(url).build();
		
		Mono<HashMap> mono = client.get()
				.uri("?ttbkey="+ttbkey+"&MaxResults="+MaxResults+"&Query="+Query+"&QueryType="
		+QueryType+"&Start="+Start+"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output
		+"&Version="+Version)
				.retrieve().bodyToMono(HashMap.class);
		
		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
		logger.info("resp : "+resp);
		
		
		return resp;
	}

}
