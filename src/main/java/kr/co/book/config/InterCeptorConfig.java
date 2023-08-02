package kr.co.book.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.book.utils.GradeCheck;
import kr.co.book.utils.LoginCheck;
import kr.co.book.utils.StateCheck;

@Configuration
public class InterCeptorConfig implements WebMvcConfigurer {

	
	@Autowired LoginCheck check; //로그인 확인
	@Autowired GradeCheck gCheck; //관리자 확인
	@Autowired StateCheck sCheck; //이용제한 확인
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(check) 
		.addPathPatterns("/admin/**")
		.addPathPatterns("/mypage/**")
		.addPathPatterns("/myClubList.go")
		.addPathPatterns("/message_list.go");
		
		registry.addInterceptor(gCheck) 
		.addPathPatterns("/admin/**");

		registry.addInterceptor(sCheck) 
		.addPathPatterns("/**")
        .excludePathPatterns("/logout.do");
	}	
}
