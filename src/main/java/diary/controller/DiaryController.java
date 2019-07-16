package diary.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import diary.service.face.DiaryService;
import dto.Diary;

@Controller
public class DiaryController {
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired DiaryService diaryService;
	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, HttpSession session) {

		String id = (String)session.getAttribute("loginid");

		List<Diary> diaryList = diaryService.getDiaries(id);

		model.addAttribute("diaryList", diaryList);
		
		return "/diary/diary";
	}
}
