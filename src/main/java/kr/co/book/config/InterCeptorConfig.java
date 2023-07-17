package kr.co.book.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.book.utils.GradeCheck;
import kr.co.book.utils.LoginCheck;

@Configuration
public class InterCeptorConfig implements WebMvcConfigurer {

	
	@Autowired LoginCheck check;
	@Autowired GradeCheck gCheck;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(check) // 1. 실행할 클래스
		.addPathPatterns("/admin/**")
		.addPathPatterns("/mypage/**")
		.addPathPatterns("/myClubList.go");
		
		registry.addInterceptor(gCheck) // 1. 실행할 클래스
		.addPathPatterns("/admin/**");
	}	
}
