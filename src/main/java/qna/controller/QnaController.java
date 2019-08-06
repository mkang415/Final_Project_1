package qna.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
			HttpSession session,
			Model model) {

		logger.info("QnA 보기");
		
		//	qna 데이터 인덱스로 불러오기
		Qna qna = qnaService.qnaView(qnaidx);
		
		//	model로 qna 보내기
		model.addAttribute("qna", qna);
		logger.info(qna.toString());
		
		//	아이디 체크
		Boolean checkId = qnaService.checkId(session, qna);
		logger.info("확인: "+checkId);
		model.addAttribute("checkId", checkId);

		//	관리자인지 체크해서 전달
		Boolean admin = qnaService.checkAdmin(session);
		model.addAttribute("admin", admin);
	}
	
	//	QnA 질문글 작성 폼 띄우기
	@RequestMapping(value = "/qna/write", method = RequestMethod.GET)
	public void QnaWrite() {

		logger.info("질문 글 폼");
		
	}
	
	//	QnA 질문글 저장
	@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
	public String QnaWriteProc(
			HttpSession session,
			Qna qna
			) {

		logger.info("질문 글 저장");
		logger.info(qna.toString());
		
		qnaService.write(session, qna);
		
		logger.info(qna.toString());
		
		return "redirect: /qna/view?qnaidx="+qna.getQna_idx();
	}
	
	//	수정할 qna 페이지 가져오기
	@RequestMapping(value = "/qna/update", method = RequestMethod.GET)
	public void QnaUpdate(
			int qnaidx,
			Model model
			) {
		
		logger.info("qna 수정 페이지");
		model.addAttribute("qna", qnaService.getUpdate(qnaidx));
		
	}
	
	//	QnA 데이터 수정
	@RequestMapping(value = "/qna/update", method = RequestMethod.POST)
	public String QnaUpdateProc(
			Qna qna
			) {
		
		logger.info("수정 qna 저장");
		logger.info(qna.toString());
		qnaService.setUpdate(qna);
		return "redirect: /qna/view?qnaidx="+qna.getQna_idx();
	}
	
	//	QnA 데이터 삭제
	@RequestMapping(value="/qna/delete", method = RequestMethod.GET)
	public String QnaDelete(
			int qnaidx
			) {
		
		logger.info("qna 삭제");
		qnaService.delete(qnaidx);
		return "redirect: /qna/newlist";
	}
	
	//	QnA 답변 호출
	@RequestMapping(value = "/qna/answer", method = RequestMethod.GET)
	public String QnaAnswer(
			int qna_idx,
			HttpSession session,
			Model model
			) {
		
		logger.info("qna 답변");
		Qna answer = qnaService.getAnswer(qna_idx);
		model.addAttribute("answer", answer);
		
		//		관리자인지 체크해서 전달
		Boolean admin = qnaService.checkAdmin(session);
		model.addAttribute("admin", admin);
		
		return "qna/setanswer";
	}
	
	//	qna 답변 저장
	@RequestMapping(value = "/qna/answer", method = RequestMethod.POST)
	public void QnaAnswerProc(
			Qna qna
			) {
		
		logger.info("답변 저장");
		qnaService.setAnswer(qna);
	}
	
}
