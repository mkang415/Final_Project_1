package memo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Memo;
import memo.service.face.MemoService;

@Controller
public class MemoController {
	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);
	
	@Autowired MemoService memoService;
	
	@RequestMapping(value = "/memo/test", method = RequestMethod.GET)
	public void memoTest() {
		Memo test = memoService.test();
		
		logger.info(test.toString());
	}
}
