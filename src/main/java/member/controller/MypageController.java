package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Diary;
import member.service.face.MypageService;


@Controller
public class MypageController {

	@Autowired MypageService mypageService;
	
	//마이페이지
	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String myview(
			Diary viewDiary,
			Model model,
			HttpSession session
			) {
		
		viewDiary = mypageService.diaryView(viewDiary);
		model.addAttribute("view", viewDiary);
		return "/member/mypage";
	}
}





















