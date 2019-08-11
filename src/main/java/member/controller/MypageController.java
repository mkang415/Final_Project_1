package member.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Diary;
import dto.Member;
import member.service.face.MemberService;
import member.service.face.MypageService;
import memo.service.face.MemoService;
import schedule.controller.CalendarController;


@Controller
public class MypageController {

	@Autowired MypageService mypageService;
	@Autowired MemberService memberService;
	public static Logger logger = LoggerFactory.getLogger(MypageController.class);
	//마이페이지
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String myview(
			Diary viewDiary,
			Model model,
			HttpSession session,
			Member member_idx
			) {
		
		member_idx = memberService.getMemberInfo(session);
		
		viewDiary = mypageService.diaryView(viewDiary);
		model.addAttribute("view", viewDiary);
		return "/member/mypage";
	}


	//회원 수정
	@RequestMapping(value = "/member/upinfo", method= RequestMethod.GET)
	public String upinfo (
			Model model,
			HttpSession session,
			Member member_idx
			) {
		
		member_idx = memberService.getMemberInfo(session);
		
		mypageService.upinfo(member_idx);
		
		model.addAttribute("upinfo", member_idx);
		
		
	return "/member/upinfo";
	}
	
	
	
	
	@RequestMapping(value = "/member/upinfo", method=RequestMethod.POST)
	public String upinfoproc (
			Member dto,
			HttpSession session
			) {
		
		logger.info(dto.toString());
		
		dto.setMember_idx((int)session.getAttribute("member_idx"));
		
		mypageService.upinfo(dto);
		
	return "redirect:/member/mypage";
	}
	
	
	
	
	
	
	
	//회원 탈퇴
	@RequestMapping(value = "/member/delete", method=RequestMethod.GET)
	public String delete (
			HttpSession session,
			Model model
			) {
		
		
		Member member_idx = new Member();
		member_idx.setMember_idx((int)session.getAttribute("member_idx"));
		logger.info("idx" + member_idx);
		session.invalidate();
		
		mypageService.delete(member_idx);
		
		model.addAttribute("del", member_idx);
		
		return "redirect:/main";
				
		
	}
	//회원 탈퇴
		@RequestMapping(value = "/member/viewdelete", method=RequestMethod.GET)
		public void viewdelete (
				) {
		
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}









