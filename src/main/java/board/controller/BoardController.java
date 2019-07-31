package board.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
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
	
	@Autowired ServletContext context;
	@Autowired BoardService boardService;
	
	//	자유 게시판 게시글 리스트
	@RequestMapping(value = "/board/freelist", method = RequestMethod.GET)
	public void freeList (
			@RequestParam(defaultValue = "1")
			int curPage,
			BoardPaging search,
			Model model) {
		
		//	게시판 리스트 페이징
		BoardPaging boardPaging = boardService.getFreePage(curPage, search);
		
		//	검색어 추가
		boardPaging.setSearch(search.getSearch());
		
		//	게시판 리스트 저장
		List<HashMap<String, Object>> freeBoardList = boardService.getFreeList(boardPaging);
		
		//	페이징 및 리스트 전달
		model.addAttribute("freePaging", boardPaging);
		model.addAttribute("freeList", freeBoardList);	
	}
	
	//	후기 게시판 게시글 리스트
	@RequestMapping(value = "/board/epillist", method = RequestMethod.GET)
	public void epilList (
			@RequestParam(defaultValue = "1")
			int curPage,
			BoardPaging search,
			Model model) {
		
		//	게시판 리스트 페이징
		BoardPaging boardPaging = boardService.getEpilPage(curPage, search);
		
		//	검색어 추가
		boardPaging.setSearch(search.getSearch());
		
		//	게시판 리스트 저장
		List<HashMap<String, Object>> epilBoardList = boardService.getEpilList(boardPaging);
		
		//	페이징 및 리스트 전달
		model.addAttribute("epilPaging", boardPaging);
		model.addAttribute("epilList", epilBoardList);	
	}
	
//	사진 게시판 게시글 리스트
	@RequestMapping(value = "/board/photolist", method = RequestMethod.GET)
	public void photoList (
			@RequestParam(defaultValue = "1")
			int curPage,
			BoardPaging search,
			Model model) {
		
		//	게시판 리스트 페이징
		BoardPaging boardPaging = boardService.getPhotoPage(curPage, search);
		
		//	검색어 추가
		boardPaging.setSearch(search.getSearch());
		
		//	게시판 리스트 저장
		List<HashMap<String, Object>> photoBoardList = boardService.getPhotoList(boardPaging);
		
		//	페이징 및 리스트 전달
		model.addAttribute("photoPaging", boardPaging);
		model.addAttribute("photoList", photoBoardList);	
	}
	
	//	게시판 게시글
	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public void view (
			int brdidx,
			HttpSession session,
			Model model) {
		
		logger.info("게시글 : "+brdidx);
		
		//	게시글 번호로 게시글 검색 후 저장
		Board freeView = boardService.freeview(brdidx, session);
		
		//	게시글 데이터 전달.
		model.addAttribute("freeView", freeView);
		Boolean checkId = boardService.checkId(session, freeView);
		logger.info("로그인" + session.getAttribute("member_idx"));
		logger.info("보드 작성자 " + freeView.getMember_idx());
		logger.info("체크: "+checkId);
		
		//	작성자인지 확인하여 전달.
		model.addAttribute("checkId", checkId);
		if(checkId) {
			Board board = new Board();
			board.setBoard_idx(brdidx);
			board.setMember_idx((int)session.getAttribute("member_idx"));
			// 추천 여부 판단
			boolean result = boardService.recommend(board);
		
			model.addAttribute("result", result);
		}
	}
	
	//	글쓰기 폼 띄우기
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public void boardWrite(
			int divide,
			HttpSession session,
			Model model
			) {
		logger.info("글쓰기");
		
		Board board = boardService.boardShape(session, divide);
		logger.info(board.toString());
		model.addAttribute("board", board);

	}
	
	//	작성한 글 저장
	@RequestMapping(value = "board/write", method = RequestMethod.POST)
	public String boardWriteProc(
			Board board
			) {
		logger.info("작성 글 저장");
		boardService.write(board);
		return "redirect: /board/view?brdidx="+board.getBoard_idx();
	}
	
	//	이미지 업로드 처리
	@PostMapping(value="/upload/image", produces = "application/text; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<?> uploadImg(
    		@RequestParam("file") MultipartFile file) {
		Image image = new Image();
		logger.info("이미지 업로드");
        try {
        	image = boardService.imgSave(file, context);
//            String uploadPath = image.getStorename();
            return ResponseEntity.ok().body(image);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().build();
        }
    }
	
	// 작성한 글 수정
	@RequestMapping(value = "board/update", method = RequestMethod.GET)
	public void boardUpdate(
			int brdidx,
			Model model) {
		logger.info("글 수정");
		
		Board board = boardService.getUpdate(brdidx);
		model.addAttribute("board", board);
	}

	//	수정한 내용 저장
	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	public String boardUpdateProc(Board board) {
		
		logger.info("글 수정 중");
		String title = "[수정]"+board.getTitle();
		logger.info(board.toString());
		board.setTitle(title);
		boardService.setUpdate(board);
		
		return "redirect: /board/view?brdidx="+board.getBoard_idx();
	}
	
	//	작성 글 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String boardDelete(
			int brdidx,
			int divide
			) {

		boardService.delete(brdidx);
		
		if(divide==1) {
			return "redirect: /board/freelist";
		} else if (divide==2) {
			return "redirect: /board/epillist";
		} else if (divide==3) {
			return "redirect: /board/photolist";
		}
		return "redirect: main";
		
	}
	
	//	게시글 추천
	@RequestMapping(value="/board/recommend", method=RequestMethod.GET)
	public void boardRecommend(Board board,
			Writer writer,
			HttpSession session) {
		
		// 추천 여부 판단
		boolean result = boardService.recommend(board);
		
		// 추천수
		int recommend = boardService.getRecommend(board);
		
		try {
			writer.write("{\"result\":"+result+", \"recommend\":"+recommend+"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
