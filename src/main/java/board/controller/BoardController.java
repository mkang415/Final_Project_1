package board.controller;

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

import board.service.face.BoardService;
import dto.Board;
import util.BoardPaging;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired BoardService boardService;
	
	//	자유 게시판 게시글 리스트
	@RequestMapping(value = "/board/freelist", method = RequestMethod.GET)
	public void freeList (
			@RequestParam(defaultValue = "1")
			int curPage,
			Model model) {
		logger.info("자유 게시판");
		BoardPaging boardPaging = boardService.getFreePage(curPage);
		List<HashMap<String, Object>> freeBoardList = boardService.getFreeList(boardPaging);
		
		model.addAttribute("paging", boardPaging);
		model.addAttribute("freeList", freeBoardList);
	
	}
	
	//	자유 게시판 게시글
	@RequestMapping(value = "/board/freeview", method = RequestMethod.GET)
	public void freeView (
			int brdidx,
			HttpSession session,
			Model model) {
		
		logger.info("게시글 : "+brdidx);
		
		Board freeView = boardService.freeview(brdidx, session);
		
		model.addAttribute("freeView", freeView);
		
	}
	
}
