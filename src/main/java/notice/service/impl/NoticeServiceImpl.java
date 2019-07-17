package notice.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dto.Member;
import dto.Notice;
import dto.NoticeFile;
import notice.dao.face.NoticeDao;
import notice.service.face.NoticeService;
import util.NoticePaging;


@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired NoticeDao noticeDao;
	@Autowired NoticeService noticeService;
	@Autowired ServletContext context;
	
	@Override
	public List<Notice> list(NoticePaging paging) {
		List<Notice> list = noticeDao.selectAll(paging);
		
		return list;
	}

	@Override
	public NoticePaging getCurPage(HttpServletRequest req) {
		
		// 전달파라미터 curPage 파싱
		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		// 전체 게시글 수
		int totalCount = noticeDao.selectCntAll();
				
		// 페이징 객체 생성
		NoticePaging paging = new NoticePaging(totalCount, curPage);

		return paging;
		
	}

	@Override
	public Notice getNoticeno(HttpServletRequest req) {
		// 전달파라미터 boardno 파싱
		String param = req.getParameter("notice_idx");
		int boardno = 0;
		if( param!=null && !"".equals(param) ) {
			boardno = Integer.parseInt(param);
		}
		
		//Board 객체 생성
		Notice board = new Notice();
		board.setNotice_idx(boardno);
		
		return board;
	}

	
	@Override
	public Notice view(Notice board) {

		//게시글 조회수 +1
		noticeDao.updateHit(board);
		
		//게시글 조회 반환
		return noticeDao.selectNoticeByNoticeno(board);
	}

	@Override
	public void writeNotice(Notice board, HttpSession session,MultipartFile fileupload) {

		String email = (String)session.getAttribute("loginEmail");
		
		Member member= new Member();
		
		member = noticeDao.selectMemberbyMemberEmail(email);
		
		board.setWriter_email(member.getEmail());
		board.setWriter_nick(member.getNickname());		
	
		noticeDao.insertNotice(board);

		
		//첨부파일 저장
		noticeService.filesave(fileupload, context, board.getNotice_idx());
		

	}

	@Override
	public void updateNotice(Notice board) {
	
		noticeDao.update(board);
	}

	@Override
	public void deleteNotice(Notice board) {
		noticeDao.delete(board);
		
	}

	@Override
	public void filesave(MultipartFile file, ServletContext context, int notice_no) {
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");

		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		String name = file.getOriginalFilename()+"_" +uId;
		
		File dest = new File(storedPath, name);
		try {
			file.transferTo(dest); //실제저장			
		}
		catch (IllegalStateException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
			
		}
		
		//DB에 저장 (업로드 정보 기록)
		NoticeFile filetest = new NoticeFile();
		filetest.setOrigin_name(file.getOriginalFilename());
		filetest.setStored_name(name);
//		int boardno = boardDao.selectBoardno(); // 다음 저장될 다음 게시판 번호를 받는다.
		filetest.setNotice_idx(notice_no); 
		
		noticeDao.insertFile(filetest);
				
	}


	@Override
	public NoticeFile viewFile(Notice board) {
		NoticeFile viewFile = noticeDao.selectFilebyNoticeno(board);
		
		return viewFile;
	}

	@Override
	public NoticeFile getFile(int fileno) {
		NoticeFile boardFile = noticeDao.getFilebyFileNo(fileno);
		return boardFile;	
	}
	



	
	
}
