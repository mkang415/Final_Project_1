package diary.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import diary.service.face.DiaryService;
import dto.Diary;
import util.DiaryPaging;

@Controller
public class DiaryController {
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired DiaryService diaryService;
	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, HttpSession session, @Parameter String curPage) {

		String id = (String)session.getAttribute("loginid");

		String param = curPage;
		
		DiaryPaging paging = diaryService.getCurPage(param);
		
		List<Diary> diaryList = diaryService.getDiaries(id, paging);

		model.addAttribute("diaryList", diaryList);
		model.addAttribute("paging", paging);
		
		return "/diary/diary";
	}
	
	@RequestMapping(value="/diary/write", method=RequestMethod.GET)
	public void write() {
		
	}
	
	@RequestMapping(value="/diary/write", method=RequestMethod.POST)
	public String writeSubmit() {
		
		return "/diary/diary";
	}	
}
