package kr.co.book.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginCheck implements HandlerInterceptor {

	//preHandler : Controller 전에 이곳을 지나친다.
	// true : 컨트롤러를 접근 허용 / false : 컨트롤러 접근 불가
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean pass = true;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginIdx") == null) {
			response.sendRedirect("/login.go");
			pass = false;
		}
		
		return pass;
	}
}
