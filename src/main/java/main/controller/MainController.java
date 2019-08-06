package main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Notice;
import notice.service.face.NoticeService;
import util.NoticePaging;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired NoticeService noticeService;

	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model
			) {
		

		List<Notice> list = noticeService.mainNoticeList();

		model.addAttribute("list",list);
	}
	
	

	
}
