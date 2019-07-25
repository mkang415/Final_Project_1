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
import dto.NoticeReply;
import freemarker.core.Comment;
import member.dao.face.MemberDao;
import member.service.face.MemberService;
import notice.dao.face.NoticeDao;
import notice.service.face.NoticeService;
import reply.dao.face.ReplyDao;
import util.NoticePaging;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired NoticeService noticeService;
	@Autowired NoticeDao noticeDao;
	@Autowired MemberDao memberDao;
	@Autowired ServletContext context;
	@Autowired MemberService memberService;
	@Autowired ReplyDao replyDao;

	
	
	@Override
	public NoticePaging getCurpage(HttpServletRequest req) {

		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		//전체 게시글 수 
		int totalCount = noticeDao.selectCntAll();
				
		//전체 게시글 수와 현재 페이지 값을 넣고 보여질 페이지 객체에 넣기
		NoticePaging paging = new NoticePaging(totalCount, curPage);

		return paging;
	}

	
	
	@Override
	public List<Notice> list(NoticePaging paging) {
	
		List<Notice> list = noticeDao.selectAll(paging);
		
		return list;

	}



	@Override
	public Notice getBoardno(int notice_idx) {
		
		Notice notice = new Notice();

		notice.setNotice_idx(notice_idx);
		
		return notice;
	}



	@Override
	public Notice view(Notice notice) {
		
		noticeDao.updateHit(notice);
		
		
		return noticeDao.selectNoticeByNoticeno(notice);
	}



	@Override
	public void writeBoard(Notice notice, HttpSession session, MultipartFile fileupload) {

		Member member = (memberService.getMemberInfo(session));
		
		//외래키인 member_idx 입력
		notice.setMember_idx(member.getMember_idx());
		//닉네임 입력
		notice.setWriter(member.getNickname());
		
		
		System.out.println("notice : "+notice);
		
		//글쓰기
		noticeDao.insertBoard(notice);

		
		//파일 업로드
		noticeService.filesave(fileupload, context, notice.getNotice_idx());
		
	}



	@Override
	public void filesave(MultipartFile file, ServletContext context, int notice_idx) {
		String storedPath = context.getRealPath("upload");

		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		String name = file.getOriginalFilename()+"_" +uId;
		
		File dest = new File(storedPath, name);
		try {
			file.transferTo(dest); 		
		}
		catch (IllegalStateException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
			
		}
		
		
		NoticeFile filetest = new NoticeFile();
		filetest.setOrigin_name(file.getOriginalFilename());
		filetest.setStored_name(name);
//		int boardno = boardDao.selectBoardno(); 게시판번호 넣기
		filetest.setNotice_idx(notice_idx); 
		
		noticeDao.insertFile(filetest);
		
	}


//	@Override
//	public FileTest viewFile(Board board) {
//		FileTest viewFile = boardDao.selectFilebyBoardno(board);
//		
//		return viewFile;
//	}

	

	@Override
	public NoticeFile getFile(int fileno) {
		NoticeFile noticeFile = noticeDao.getFilebyFileNo(fileno);
		return noticeFile;	
	}



	
	@Override
	public NoticeFile viewFile(Notice notice) {
		NoticeFile noticeFile = noticeDao.selectFilebynotice_idx(notice);
		
		return noticeFile;

	}



	@Override
	public List<NoticeReply> getCommentList(Notice notice) {
		List<NoticeReply> commentList = replyDao.selectComment(notice);
		
		return commentList;
	
	}



	
	@Override
	public void insertComment(NoticeReply comment) {

		replyDao.insertNoticeReply(comment);
		
	}



	@Override
	public boolean deleteComment(NoticeReply noticeReply) {
		replyDao.deleteComment(noticeReply); 
		
		if( replyDao.countComment(noticeReply) > 0 ) {
			return false;
		} else {
			return true;
		}
	}

	
	
}
