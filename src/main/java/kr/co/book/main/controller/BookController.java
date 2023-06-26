package kr.co.book.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/")
	public String main() {
		logger.info("main으로 이동");
		return "index";
	}
	
	@GetMapping(value="/login.go")
	public String login() {
		logger.info("login으로 이동");
		return "/member/login";
	}
	
	@GetMapping(value = "/id_pwSearch.go")
	public String id_pwSearch() {
		logger.info("id_pwSearch으로 이동");
		return "/member/id_pwSearch";
	}
	
	@GetMapping(value = "/join.go")
	public String joinForm() {
		logger.info("joinForm으로 이동");
		return "/member/joinForm";
	}
	
}
