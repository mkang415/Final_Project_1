package memo.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import dto.Memo;
import memo.service.face.MemoService;
import util.ImpMemoPaging;
import util.MemoPaging;

@Controller
public class MemoController {
	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);
	
	@Autowired MemoService memoService;
	
	//	메모 리스트 페이지
	@RequestMapping(value = "/memo/list")
	public void memoList(
			@RequestParam(defaultValue = "1")
			int curPage,
			@RequestParam(defaultValue = "1")
			int impCurPage,
			HttpSession session,
			Model model) {
		
		logger.info("메모 리스트");
		
		//	메모 리스트 페이징
		MemoPaging memoPaging = memoService.getMemoPage(curPage, session);
		memoPaging.setMember_idx((int)session.getAttribute("member_idx"));
		
		//	메모 리스트 불러오기
		List<HashMap<String, Object>> memoList = memoService.getMemoList(memoPaging);
		model.addAttribute("memoPaging", memoPaging);
		model.addAttribute("memoList", memoList);
		
		//	중요 메모 페이징
		ImpMemoPaging impMemoPaging = memoService.impGetMemoPage(impCurPage, session);
		impMemoPaging.setMember_idx((int)session.getAttribute("member_idx"));
		
		//	메모 리스트 불러오기
		List<HashMap<String, Object>> impMemoList = memoService.getImpMemoList(impMemoPaging);
		model.addAttribute("impMemoPaging", impMemoPaging);
		model.addAttribute("impMemoList", impMemoList);
	}
	
	//	메모 작성
	@RequestMapping(value = "/memo/write", method = RequestMethod.GET)
	public void memoWrite() {
		logger.info("메모 작성 페이지");
	}
	
	//	작성한 메모 입력
	@RequestMapping(value = "/memo/write", method = RequestMethod.POST)
	public String memoWriteProc(
			Memo memo,
			HttpSession session
			) {
		
		memoService.write(memo, session);
		
		return "redirect: /memo/list";
	}
	
	//	메모 상세보기
	@RequestMapping(value = "/memo/view", method = RequestMethod.GET)
	public void memoView(
			int memoidx,
			Model model
			) {
		
		Memo memo = memoService.view(memoidx);
		model.addAttribute("memo", memo);
	}
	
	//	메모 수정 페이지
	@RequestMapping(value = "/memo/update", method = RequestMethod.GET)
	public void update(
			int memoidx,
			Model model
			) {
		
		Memo memo = memoService.getUpdate(memoidx);
		model.addAttribute("memo", memo);
	}
	
	//	메모 수정 데이터 입력
	@RequestMapping(value = "/memo/update", method = RequestMethod.POST)
	public String updateProc(
			Memo memo
			) {
		
		logger.info("==========================");
		logger.info(memo.toString());
		memoService.setUpdate(memo);
		return "redirect: /memo/list";
	}
	
	//	메모 삭제
	@RequestMapping(value = "/memo/delete", method = RequestMethod.GET)
	public String delete(
			int memoidx
			) {
		
		memoService.delete(memoidx);
		return "redirect: /memo/list";
	}
	
	//	중요 메모 설정
	@RequestMapping(value = "memo/mark", method = RequestMethod.GET)
	public String mark(
			int memoidx
			) {
		
		memoService.mark(memoidx);
		return "redirect: /memo/list";
	}
	
	//	중요 메모 해제
	@RequestMapping(value = "memo/unmark", method = RequestMethod.GET)
	public String unmark(
			int memoidx
			) {
		
		memoService.unmark(memoidx);
		return "redirect: /memo/list";
	}
}
