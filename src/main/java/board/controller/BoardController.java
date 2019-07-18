package board.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import board.service.face.BoardService;
import dto.Board;
import dto.Image;
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
		Boolean checkId = boardService.checkId(session, freeView);
		logger.info("로그인" + session.getAttribute("member_idx"));
		logger.info("보드 작성자 " + freeView.getMember_idx());
		logger.info("체크: "+checkId);
		
		model.addAttribute("checkId", checkId);
		
	}
	
	//	글쓰기 폼 띄우기
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public void boardWrite(
			int divide,
			Model model
			) {
		logger.info("글쓰기");
		
		model.addAttribute("selBoard", divide);
	}
	
	//	작성한 글 저장
	@RequestMapping(value = "board/write", method = RequestMethod.POST)
	public String boardWriteProc(
			Board board,
			HttpSession session
			) {
		
		boardService.write(board, session);
		
		if(board.getDivide()==1) {
			return "redirect: /board/freeview?brdidx="+board.getBoard_idx();
		} else if(board.getDivide()==2) {
			return "redirect: /board/epilview?brdidx="+board.getBoard_idx();
		} else if(board.getDivide()==3) {
			return "redirect: /board/photoview?brdidx="+board.getBoard_idx();
		}
		
		return "redirect: /board/freelist";
	}
	
}
