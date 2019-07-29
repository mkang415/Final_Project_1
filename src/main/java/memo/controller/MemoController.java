package memo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.velocity.tools.view.WebappUberspector.GetAttributeExecutor;
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
			HttpSession session,
			Model model) {
		
		logger.info("메모 리스트");
		
		//	메모 리스트 페이징
		MemoPaging memoPaging = memoService.getMemoPage(curPage, session);
		memoPaging.setMember_idx((int)session.getAttribute("member_idx"));
		List<HashMap<String, Object>> memoList = memoService.getMemoList(memoPaging);
		
		model.addAttribute("memoList", memoList);
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
}
