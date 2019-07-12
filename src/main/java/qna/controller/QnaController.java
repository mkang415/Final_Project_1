package qna.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Qna;
import qna.service.face.QnaService;

@Controller
public class QnaController {
	public static Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired QnaService qnaService;
	
	@RequestMapping(value = "/qna/test", method = RequestMethod.GET)
	public void qnaTest() {
		Qna test = qnaService.test();
		logger.info(test.toString());
	}
}
