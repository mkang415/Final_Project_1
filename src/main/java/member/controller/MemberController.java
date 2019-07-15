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
		logger.info("�α���ȭ��");
	
	}

	@RequestMapping(value = "/interceptor/noLogin", method = RequestMethod.GET)
	public void loginFail() {
		logger.info("�α��ν���");
	
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String loginProc(Member member,
						  HttpSession session) {
		
		logger.info("�α���ó��");
		
	
		String redirectUrl = null;
		if(memberService.login(member)) {
			//�α��� ����
			
			//���� ��������
			session.setAttribute("login", true);
			session.setAttribute("loginid", member.getEmail());
			Member loginMember = memberService.getMemberInfo(session);
			session.setAttribute("nick", loginMember.getNickname());
			
			//�����̷�Ʈ URL ����
			redirectUrl = "/main";
			
		} else {
			//�α��� ����
			
			//�����̷�Ʈ URL ����
			redirectUrl = "/member/nologin";
		}
		
		return "redirect:" +redirectUrl;
	
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		logger.info("�α׾ƿ�");
		
		session.invalidate();
		
		String redirectUrl = "/main";
		
		return "redirect:"+redirectUrl;
		
		
	}
	

	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public void join() {
		logger.info("ȸ������ ��");
		
	}
	
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinProc( Member member, //jsp���� �÷����� �Ķ���͵�
						Model model) throws Exception {
		
				logger.info("ȸ������ó�� ��");
				
					
				memberService.insertMember(member);
				
				return "member/joinProc"; //controller ���� �ٷ� jsp �� �Ѿ
										  //view�� �ٷ� �Ѿ	
	}
	
	@RequestMapping(value="/member/joinConfirm", method=RequestMethod.GET)
	public void emailConfirm(Member member, Model model) throws Exception {
		logger.info(member.getEmail() + ": auth confirmed");
		memberService.updateAuth_status(member); //���� ������Ʈ
		
		model.addAttribute("auth_check", 1);
		
		
	}
	


	
	
}
