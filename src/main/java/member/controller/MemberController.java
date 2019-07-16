package member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.Member;
import member.service.face.MemberService;

@Controller
public class MemberController {
	public static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
		
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public void login() {
		logger.info("로그인화면");
	
	}

	@RequestMapping(value = "/interceptor/noLogin", method = RequestMethod.GET)
	public void loginFail() {
		logger.info("로그인실패");
	
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginProc(Member member,
						  HttpSession session) {
		
		logger.info("로그인처리");
		
	
		String redirectUrl = null;
		if(memberService.login(member)) {
			//로그인 성공
			
			//세션 정보저장
			session.setAttribute("login", true);
			session.setAttribute("loginid", member.getEmail());
			Member loginMember = memberService.getMemberInfo(session);
			session.setAttribute("nick", loginMember.getNickname());
			
			//리다이렉트 URL 지정
			redirectUrl = "/main";
			
		} else {
			//로그인 실패
			
			//리다이렉트 URL 지정
			redirectUrl = "/member/nologin";
		}
		
		return "redirect:" +redirectUrl;
	
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		logger.info("로그아웃");
		
		session.invalidate();
		
		String redirectUrl = "/main";
		
		return "redirect:"+redirectUrl;
		
		
	}
	

	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() {
		logger.info("회원가입 폼");
		
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc( Member member, //jsp에서 올려보낸 파라미터들
						Model model) throws Exception {
		
				logger.info("회원가입처리 폼");
				
					
				memberService.insertMember(member);
				
				return "member/joinProc"; //controller 없이 바로 jsp 로 넘어감
										  //view로 바로 넘어감	
	}
	
	@RequestMapping(value="/member/joinConfirm", method=RequestMethod.GET)
	public void emailConfirm(Member member, Model model) throws Exception {
		logger.info(member.getEmail() + ": auth confirmed");
		memberService.updateAuth_status(member); //권한 업데이트
		
		model.addAttribute("auth_check", 1);
		
		
	}
	


	
	
}
