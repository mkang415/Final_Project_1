package diary.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import diary.service.face.DiaryService;
import dto.Diary;

@Controller
public class DiaryController {
	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	
	@Autowired DiaryService diaryService;
	
	@RequestMapping(value = "/diary/test", method = RequestMethod.GET)
	public void diaryTest() {
		Diary test = diaryService.test();
		logger.info(test.toString());
	}
}
