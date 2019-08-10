package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger
	= LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request,
							HttpServletResponse response, 
							Object handler)
							throws Exception{
		
		logger.info("+ + + 인터셉터 시작 + + + ");
		logger.info("Request URI: "+request.getRequestURI());
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginEmail").equals("admin")) {
			logger.info(" 관리자 로그인 성공");
			
			
			return true;
		}  else {
			logger.info(" 관리자 외 접근 제한");
		
			response.sendRedirect("/interceptor/adminFail");
			
			return false; // 컨트롤러 접근 금지 처리
			
			
		}
			
	}

	@Override	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView)
	 throws Exception{
		logger.info("+ + + 인터셉터 종료 + + +");
		

		super.postHandle(request, response, handler, modelAndView);
	}


}
