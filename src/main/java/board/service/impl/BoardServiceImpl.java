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
import util.BoardPaging;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDao boardDao;
	@Autowired RecommendDao recommendDao;

	//	자유게시판 페이징 처리
	@Override
	public BoardPaging getFreePage(int curPage) {
		
		//	자유게시판 전체 게시글 개수
		int totalCnt = boardDao.freeCntAll();
		
		// 페이징 객체 생성
		BoardPaging paging = new BoardPaging(totalCnt, curPage);
		
		return paging;
	}

		//	자유게시판 리스트 불러오기
	@Override
	public List<HashMap<String, Object>> getFreeList(BoardPaging boardPaging) {
		
		return boardDao.getFreeList(boardPaging);
	}

		//	자유게시판 게시글 불러오기
	@Override
	public Board freeview(int brdidx, HttpSession session) {
		
		long update_time = 0;
		
		//	세션에 저장된 조회시간 검색
		//	최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행x
		if(session.getAttribute("update_time"+brdidx) != null) {
			//	세션에서 읽어오기
			update_time = (long)session.getAttribute("update_time"+brdidx);
		}
		
		//	시스템의 현재 시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		System.out.println(current_time - update_time);
		//	일정시간이 경과 후 조회수 증가 처리
		//	시스템 현재시간 - 열람시간 > 일정시간
		if(current_time - update_time > 10 * 60 * 1000) {
			boardDao.hitPlus(brdidx);
			session.setAttribute("update_time"+brdidx, current_time);
		}
		
		//	조회수 증가
		
		return boardDao.freeView(brdidx);
	}

	//	작성자와 로그인 유저 비교
	@Override
	public Boolean checkId(HttpSession session, Board freeView) {
		
		String id = (String)session.getAttribute("loginEmail");
		if (id != null && !"".equals(id)) {
			int memIdx = (int)session.getAttribute("member_idx");
			if(memIdx == freeView.getMember_idx()) {
				return true;
			}
		}
		return false;
	}

	//	작성글 데이터 dao로 전달
	@Override
	public void write(Board board, HttpSession session) {
		
		board.setMember_idx((int) session.getAttribute("member_idx"));
		
		boardDao.write(board);
		
	}

	//	업로드한 이미지 저장 후 저장경로 반환
	@Override
	public String imgSave(MultipartFile file, ServletContext context) {

			//	파일이 저장될 경로
			String storedPath = context.getRealPath("resources/boardimg");
			System.out.println(storedPath);
			
			//	UUID
			String uId = UUID.randomUUID().toString().split("-")[4];
			
			//	저장될 파일의 이름 (원본이름 + UUID)
			String name = uId+"_"+file.getOriginalFilename();
			
			//	저장될 파일 객체
			File dest = new File(storedPath, name);
			
			//	파일 저장
			try {
				file.transferTo(dest);	//	실제 저장
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Image image = new Image();
			image.setOriginname(file.getOriginalFilename());
			image.setStorename(name);
			boardDao.imgSave(image);
			
			return "\\resources\\boardimg\\"+image.getStorename();
	}

	//	수정할 게시글 불러오기
	@Override
	public Board getUpdate(int brdidx) {
		
		return boardDao.getUpdate(brdidx);
	}

	//	게시글 수정
	@Override
	public void setUpdate(Board board) {
		boardDao.setUpdate(board);
	}

	//	게시글 삭제
	@Override
	public void delete(int brdidx) {
		boardDao.delete(brdidx);
		
	}

	//	추천
	@Override
	public boolean recommend(Board board) {
		if(recommendDao.selectCountRecommend(board)>0) {
			recommendDao.deleteRecommend(board);
			return false;
		} else {
			recommendDao.insertRecommend(board);
			return true;
		}
	}

	//	추천 수 가져오기
	@Override
	public int getRecommend(Board board) {
		int recommend = recommendDao.selectTotalRecommend(board);
		board.setRecommend(recommend);
		boardDao.setRecommend(board);
		return recommend;
	}

}
