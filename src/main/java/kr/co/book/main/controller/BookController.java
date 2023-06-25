package kr.co.book.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/")
	public String main() {
		logger.info("main으로 이동");
		return "index";
	}
	
	
}
