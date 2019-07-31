package qna.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Qna;
import qna.service.face.QnaService;
import util.QnaPaging;

@Controller
public class QnaController {
	public static Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired QnaService qnaService;
	
	@RequestMapping(value = "/qna/newlist", method = RequestMethod.GET)
	public void newQnaList(
			@RequestParam(defaultValue = "1")
			int curPage,
			QnaPaging search,
			Model model
			) {

		logger.info("QnA 리스트");
		//	Qna 리스트 페이징
		QnaPaging qnaPaging = qnaService.getqnaPage(curPage, search);
		
		//	검색어 추가
		qnaPaging.setSearch(search.getSearch());
		
		//	Qna 리스트 가져오기
		List<HashMap<String, Object>> newList = qnaService.getNewList(qnaPaging);
		
		model.addAttribute("qnaPaging", qnaPaging);
		model.addAttribute("newList", newList);

	}
	
	//	QnA 보기
	@RequestMapping(value = "/qna/view", method = RequestMethod.GET)
	public void QnaView(
			int qnaidx,
			Model model) {

		logger.info("QnA 보기");
		
		//	qna 데이터 인덱스로 불러오기
		Qna qna = qnaService.qnaView(qnaidx);
		
		//	model로 qna 보내기
		model.addAttribute("qna", qna);
	}
}
