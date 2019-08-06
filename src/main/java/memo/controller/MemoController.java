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

import dto.Memo;
import memo.service.face.MemoService;

@Controller
public class MemoController {
	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);

	@Autowired
	MemoService memoService;

	@RequestMapping(value = "/memo/getview", method = RequestMethod.GET)
	public String memoView(
			HttpSession session, Model model) {

		logger.info("view");
		
		// 메모 리스트 불러오기
		List<HashMap<String, Object>> memoList = memoService.getMemoList(session, 1);
		model.addAttribute("memoList", memoList);

		// 중요 메모 리스트 불러오기
		List<HashMap<String, Object>> impMemoList = memoService.getMemoList(session, 2);
		model.addAttribute("impMemoList", impMemoList);

		return "memo/view";
	}

	// 메모 리스트 페이지
	@RequestMapping(value = "/memo/list", method = RequestMethod.GET)
	public void memoList() {

		logger.info("메모 리스트");

	}

	// 작성한 메모 입력
	@RequestMapping(value = "/memo/write", method = RequestMethod.POST)
	public String memoWriteProc(Memo memo, HttpSession session) {

		memoService.write(memo, session);

		return "redirect: /memo/list";
	}

	// 메모 수정 데이터 입력
	@RequestMapping(value = "/memo/update", method = RequestMethod.POST)
	public String updateProc(Memo memo) {

		logger.info("==========================");
		logger.info(memo.toString());
		memoService.setUpdate(memo);
		return "redirect: /memo/list";
	}

	// 메모 삭제
	@RequestMapping(value = "/memo/delete", method = RequestMethod.GET)
	public String delete(int memoidx) {

		memoService.delete(memoidx);
		return "redirect: /memo/list";
	}

	// 중요 메모 설정
	@RequestMapping(value = "memo/mark", method = RequestMethod.GET)
	public String mark(int memoidx) {
		logger.info("중요 메모 설정");
		memoService.mark(memoidx);
		return "redirect: /memo/list";
	}

	// 중요 메모 해제
	@RequestMapping(value = "memo/unmark", method = RequestMethod.GET)
	public String unmark(int memoidx) {
		logger.info("중요 메모 해제");
		logger.info("번호: " + memoidx);
		memoService.unmark(memoidx);
		return "redirect: /memo/list";
	}
}
