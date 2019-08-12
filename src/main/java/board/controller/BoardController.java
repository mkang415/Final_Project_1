package board.controller;

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
import dto.Recommend;
import reply.service.face.ReplyService;
import util.BoardPaging;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired ServletContext context;
	@Autowired BoardService boardService;
	@Autowired ReplyService replyService;
	
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
		
		String board_idx = "0";
		 for (int i = 0; i < freeBoardList.size(); i++) {
			logger.info("i: "+i);
			board_idx = freeBoardList.get(i).get("BOARD_IDX").toString();
	        freeBoardList.get(i).put("CNTREPLY", replyService.getCntReply(board_idx));
	        freeBoardList.get(i).put("RECOMMEND", boardService.getRecoCnt(board_idx));
		 }

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
		
		String board_idx = "0";
		 for (int i = 0; i < epilBoardList.size(); i++) {
			logger.info("i: "+i);
			board_idx = epilBoardList.get(i).get("BOARD_IDX").toString();
			epilBoardList.get(i).put("CNTREPLY", replyService.getCntReply(board_idx));
			epilBoardList.get(i).put("RECOMMEND", boardService.getRecoCnt(board_idx));
		 }
		
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
		
		String board_idx = "0";
		 for (int i = 0; i < photoBoardList.size(); i++) {
			logger.info("i: "+i);
			board_idx = photoBoardList.get(i).get("BOARD_IDX").toString();
			photoBoardList.get(i).put("CNTREPLY", replyService.getCntReply(board_idx));
			photoBoardList.get(i).put("RECOMMEND", boardService.getRecoCnt(board_idx));
		 }
		
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
		
	}
	
	//	글쓰기 폼 띄우기
	@RequestMapping(value = "/board/write", method = RequestMethod.GET)
	public void boardWrite(
			int divide,
			Model model
			) {
		logger.info("글쓰기");
		
		Board board = new Board();
		board.setDivide(divide);

		model.addAttribute("board", board);
	}
	
	//	작성한 글 저장
	@RequestMapping(value = "board/write", method = RequestMethod.POST)
	public String boardWriteProc(
			Board board,
			@RequestParam (value = "image", required=false) List<Integer> image,
			HttpSession session
			) {

		logger.info("작성 글 저장");
		logger.info(board.toString());
		
		boardService.write(session, board);
		Image setImage = new Image();
		setImage.setBoard_idx(board.getBoard_idx());
		
		
		if(image != null) {
			for(int i=0; i<image.size(); i++) {
				logger.info("인덱스: "+image.get(i));
				boardService.setBrdidx(setImage, image.get(i));
			}
		
		}
		
		return "redirect: /board/view?brdidx="+board.getBoard_idx();
	}
	
	//	이미지 업로드 처리
	@PostMapping(value="/upload/image", produces = "application/text; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<?> uploadImg(
    		@RequestParam("file") MultipartFile file,
    		HttpSession session) {
		Image image = new Image();
		logger.info("이미지 업로드");
        try {
        	image = boardService.imgSave(file, context, session);
        	logger.info(image.getStorename());
            String uploadPath = image.getStorename();
            return ResponseEntity.ok().body(uploadPath);
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
		
		//	업로드한 이미지 리스트
		List<HashMap<String, Object>> imageList = boardService.getimgList(brdidx);
		
		model.addAttribute("board", board);
		
		model.addAttribute("imglist", imageList);
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

		replyService.brdDelete(brdidx);
		boardService.delete(brdidx);
		
		//	해당 이미지 삭제
		boardService.deleteImg(brdidx);

		if(divide==1) {
			return "redirect: /board/freelist";
		} else if (divide==2) {
			return "redirect: /board/epillist";
		} else if (divide==3) {
			return "redirect: /board/photolist";
		}
		return "redirect: main";
		
	}
	
	//	이미지 데이터 보내기
	@RequestMapping(value="/board/getimg", method=RequestMethod.POST)
	public String getImage(
			Model model,
			String storename,
			String mainImg
			) {
		logger.info("getimage");
		logger.info(mainImg);
		Image image= boardService.getImage(storename);
		logger.info(image.toString());
		model.addAttribute("image", image);
		model.addAttribute("mainImage", mainImg);
		return "board/imagelist";
	}
	
	//	이미지 데이터 보내기
	@RequestMapping(value="/board/setimg", method=RequestMethod.POST)
	public  @ResponseBody String setImage(

			String mainImg
			) {
		
		return mainImg;
	}
	
	//	글 작성 취소시 업로드한 이미지 삭제.
	@RequestMapping(value = "/board/delimg", method=RequestMethod.GET)
	public String delnullimg(
			int divide,
			HttpSession session
			) {
		
		logger.info("글 작성 취소");
		boardService.delnullimg(session);

		if(divide==1) {
			return "redirect: /board/freelist";
		} else if (divide==2) {
			return "redirect: /board/epillist";
		} else if (divide==3) {
			return "redirect: /board/photolist";
		}
		return "redirect: main";
	}
	
	//	추천 영역 불러오기
	@RequestMapping(value = "/board/getreco", method = RequestMethod.POST)
	public String getreco(
			int board_idx,
			HttpSession session,
			Model model
			) {
		
		logger.info("추천영역");
		
		//	해당 게시글 추천 개수 구하기
		String brdidx = String.valueOf(board_idx);
		int recoCnt = boardService.getRecoCnt(brdidx);
		
		model.addAttribute("recocnt", recoCnt);
		
		//	추천 여부 확인하여 반환
		boolean result = boardService.checkReco(board_idx, session);
		int writer = boardService.getmemidx(board_idx);
		Board freeView = new Board();
		freeView.setMember_idx(writer);
		Boolean checkId = boardService.checkId(session, freeView);
		
		//	작성자인지 확인하여 전달.
		model.addAttribute("checkId", checkId);
		
		model.addAttribute("result", result);
		
		model.addAttribute("board_idx", board_idx);
		
		return "board/recommend";
	
	}
	
	// 추천 취소
	@RequestMapping(value = "/board/unreco", method = RequestMethod.POST)
	public String unreco(
			int board_idx,
			HttpSession session
			) {
		
		logger.info("추천취소");
		
		Recommend recommend = new Recommend();
		
		recommend.setBoard_idx(board_idx);
		recommend.setMember_idx((int)session.getAttribute("member_idx"));
		
		boardService.unreco(recommend);
		
		return "redirect: /board/view?brdidx="+board_idx;
	}
	
	//	추천
	@RequestMapping(value = "/board/reco", method = RequestMethod.POST)
	public String reco(
			int board_idx,
			HttpSession session
			) {
		
		logger.info("추천");
		
		Recommend recommend = new Recommend();
		
		recommend.setBoard_idx(board_idx);
		recommend.setMember_idx((int)session.getAttribute("member_idx"));
		
		boardService.reco(recommend);
		
		return "redirect: /board/view?brdidx="+board_idx;
	}
}
