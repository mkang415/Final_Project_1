package board.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.dao.face.BoardDao;
import board.dao.face.RecommendDao;
import board.service.face.BoardService;
import dto.Board;
import dto.Image;
import dto.Recommend;
import util.BoardPaging;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	@Autowired
	RecommendDao recommendDao;

	// 자유게시판 페이징 처리
	@Override
	public BoardPaging getFreePage(int curPage, BoardPaging search) {

		// 자유게시판 전체 게시글 개수
		int totalCnt = boardDao.freeCnt(search);

		// 페이징 객체 생성
		BoardPaging paging = new BoardPaging(totalCnt, curPage);

		return paging;
	}

	// 자유게시판 리스트 불러오기
	@Override
	public List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging) {

		return boardDao.getFreeList(boardPaging);
	}

	// 자유게시판 게시글 불러오기
	@Override
	public Board freeview(int brdidx, HttpSession session) {

		long update_time = 0;

		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행x
		if (session.getAttribute("update_time" + brdidx) != null) {
			// 세션에서 읽어오기
			update_time = (long) session.getAttribute("update_time" + brdidx);
		}

		// 시스템의 현재 시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		System.out.println(current_time - update_time);
		// 일정시간이 경과 후 조회수 증가 처리
		// 시스템 현재시간 - 열람시간 > 일정시간
		if (current_time - update_time > 10 * 60 * 1000) {
			boardDao.hitPlus(brdidx);
			session.setAttribute("update_time" + brdidx, current_time);
		}

		// 조회수 증가

		return boardDao.freeView(brdidx);
	}

	// 작성자와 로그인 유저 비교
	@Override
	public Boolean checkId(HttpSession session, Board freeView) {

		String id = (String) session.getAttribute("loginEmail");
		if (id != null && !"".equals(id)) {
			int memIdx = (int) session.getAttribute("member_idx");
			if (memIdx == freeView.getMember_idx()) {
				return true;
			}
		}
		return false;
	}
	
	// 작성글 데이터 dao로 전달
	@Override
	public void write(HttpSession session, Board board) {

		board.setMember_idx((int) session.getAttribute("member_idx")); 
		
		boardDao.write(board);

	}

	// 업로드한 이미지 저장 후 저장경로 반환
	@Override
	public Image imgSave(MultipartFile file, ServletContext context, HttpSession session) {

		// 파일이 저장될 경로
		String storedPath = context.getRealPath("resources/boardimg");
		System.out.println(storedPath);

		// UUID
		String uId = UUID.randomUUID().toString().split("-")[4];

		// 저장될 파일의 이름 (원본이름 + UUID)
		String name = uId + "_" + file.getOriginalFilename();

		// 저장될 파일 객체
		File dest = new File(storedPath, name);

		// 파일 저장
		try {
			file.transferTo(dest); // 실제 저장
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Image image = new Image();
		image.setMember_idx((int)session.getAttribute("member_idx"));
		image.setOriginname(file.getOriginalFilename());
		image.setStorename(name);
		boardDao.imgSave(image);

		return image;
	}

	// 수정할 게시글 불러오기
	@Override
	public Board getUpdate(int brdidx) {

		return boardDao.getUpdate(brdidx);
	}

	// 게시글 수정
	@Override
	public void setUpdate(Board board) {
		boardDao.setUpdate(board);
	}

	// 게시글 삭제
	@Override
	public void delete(int brdidx) {
		boardDao.delete(brdidx);

	}

	// 후기 게시판 페이징
	@Override
	public BoardPaging getEpilPage(int curPage, BoardPaging search) {
		// 자유게시판 전체 게시글 개수
		int totalCnt = boardDao.epilCnt(search);

		// 페이징 객체 생성
		BoardPaging paging = new BoardPaging(totalCnt, curPage);

		return paging;
	}

	//	후기 게시판 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getEpilList(BoardPaging boardPaging) {
		
		return boardDao.getEpilList(boardPaging);
	}

	//	사진 게시판 페이징
	@Override
	public BoardPaging getPhotoPage(int curPage, BoardPaging search) {
		// 자유게시판 전체 게시글 개수
		int totalCnt = boardDao.photoCnt(search);

		// 페이징 객체 생성
		BoardPaging paging = new BoardPaging(totalCnt, curPage);

		return paging;
	}

	//	사진 게시판 리스트 가져오기
	@Override
	public List<HashMap<String, Object>> getPhotoList(BoardPaging boardPaging) {

		return boardDao.getPhotoList(boardPaging);
	}

	//	이미지 정보 가져오기
	@Override
	public Image getImage(String storename) {
		
		return boardDao.getImage(storename);
	}

	//	이미지에 board idx 저장
	@Override
	public void setBrdidx(Image setImage, Integer integer) {
		
		setImage.setImage_idx(integer);
		
		boardDao.setBrdidx(setImage);
		
	}

	//	게시글 삭제시 이미지도 삭제
	@Override
	public void deleteImg(int board_idx) {
		
		boardDao.deleteImg(board_idx);
	}

	//	글 작성 취소할 경우 업로드 이미지 삭제
	@Override
	public void delnullimg(HttpSession session) {
		
		int member_idx = (int)session.getAttribute("member_idx");
		
		boardDao.delnullimg(member_idx);
		
	}

	//	게시글 추천 개수
	@Override
	public int getRecoCnt(String board_idx) {
		
		int brdidx = Integer.parseInt(board_idx);
		
		return recommendDao.getRecoCnt(brdidx);
	}

	//	추천 여부 판단

	@Override
	public boolean checkReco(int board_idx, HttpSession session) {
		
		String id = (String) session.getAttribute("loginEmail");
		
		if (id != null && !"".equals(id)) {
			int memIdx = (int) session.getAttribute("member_idx");
			Recommend recommend = new Recommend();
			recommend.setBoard_idx(board_idx);
			recommend.setMember_idx(memIdx);
			if (recommendDao.checkReco(recommend) > 0) {
				return true;
			}
			else {
				return false;
			}
		} else {
			return false;
		}
		
	}

	//	추천 취소
	@Override
	public void unreco(Recommend recommend) {
		
		recommendDao.unreco(recommend);
		
	}
	
	//	추천
	@Override
	public void reco(Recommend recommend) {
		
		recommendDao.reco(recommend);
		
	}

	
	@Override
	public int getmemidx(int board_idx) {
		
		return boardDao.getmemidx(board_idx);
	}

	@Override
	public List<HashMap<String, Object>> getimgList(int board_idx) {
		
		return boardDao.getimgList(board_idx);
	}

}
