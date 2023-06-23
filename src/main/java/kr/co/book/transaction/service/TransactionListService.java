package kr.co.book.transaction.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
public class TransactionListService {
	

	public HashMap<String, String> bookSearch(String search) {
		
		WebClient client = WebClient.create("http://localhost");
		
		return null;
	}

}
