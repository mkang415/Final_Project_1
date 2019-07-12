package notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Notice;
import notice.service.face.NoticeService;

@Controller
public class NoticeController {
	public static Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired NoticeService noticeService;
	
	@RequestMapping(value = "/notice/test", method = RequestMethod.GET)
	public void noticeTest() {
		Notice test = noticeService.test();
		
		logger.info(test.toString());
	}
}
