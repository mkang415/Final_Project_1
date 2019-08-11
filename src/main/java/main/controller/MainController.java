package main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Notice;
import notice.service.face.NoticeService;
import qna.service.face.QnaService;
import util.NoticePaging;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired NoticeService noticeService;
	


	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model,
		HttpSession session
			) {
		

		List<Notice> list = noticeService.mainNoticeList();
		List<HashMap<String, Object>> newList = noticeService.mainqnaList();


		model.addAttribute("list",list);
		model.addAttribute("qnaList",newList);
			
	
	
	}
	
	

	
}
