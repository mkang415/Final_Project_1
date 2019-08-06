package qna.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.FreQna;
import qna.service.face.FreQnaService;
import qna.service.face.QnaService;

@Controller
public class FreQnacontroller {
	private static final Logger logger = LoggerFactory.getLogger(FreQnacontroller.class);
	
	@Autowired FreQnaService freQnaService;
	@Autowired QnaService qnaService;
	
	//	qna 자주 묻는 질문 리스트
	@RequestMapping(value = "/freqna/list", method = RequestMethod.GET)
	public void freList(
			Model model,
			HttpSession session
			) {
		
		logger.info("자주 묻는 질문 페이지");
		//	자주 묻는 질문 리스트 가져와서 model로 전달
		List<HashMap<String, Object>> freList = freQnaService.getfreList();
		model.addAttribute("frelist", freList);
		
		//	관리자인지 확인
		Boolean admin = qnaService.checkAdmin(session);
		 model.addAttribute("admin", admin);
	}
	
	//	자주 묻는 질문 작성 페이지
	@RequestMapping(value = "/freqna/write", method = RequestMethod.GET)
	public void freWrite() {
		logger.info("자주 묻는 질문 작성 페이지");
	}
	
	//	작성한 자주 묻는 질문 저장
	@RequestMapping(value = "/freqna/write", method = RequestMethod.POST)
	public String freWriteProc(
			FreQna freqna
			) {
		
		logger.info("작성한 자주 묻는 질문 저장");
		freQnaService.write(freqna);
		
		return "redirect: /freqna/list";
	}
	
	//	자주 묻는 질문 수정 페이지
	@RequestMapping(value = "/freqna/update", method = RequestMethod.GET)
	public void freUpdate(
			int index,
			Model model
			) {
		
		logger.info("자주 묻는 질문 수정 페이지");
		
		FreQna freqna = freQnaService.getUpdate(index);
		model.addAttribute("freqna", freqna);
	}
	
	//	자주 묻는 질문 수정한 데이터 저장
	@RequestMapping(value = "/freqna/update", method = RequestMethod.POST)
	public String freUpdateProc(
			FreQna freqna
			) {
		
		logger.info("수정한 자주 묻는 질문 저장");
		
		freQnaService.setUpdate(freqna);
		
		return "redirect: /freqna/list";
	}
	
	//	자주 묻는 질문 데이터 삭제
	@RequestMapping(value = "/freqna/delete", method = RequestMethod.GET)
	public String freDelete(
			int index
			) {
		
		logger.info("자주 묻는 질문 삭제");
		freQnaService.delete(index);
		return "redirect: /freqna/list";
	}
}
