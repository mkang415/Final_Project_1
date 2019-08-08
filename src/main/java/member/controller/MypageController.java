package member.controller;

import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.json.JSONObject;
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









