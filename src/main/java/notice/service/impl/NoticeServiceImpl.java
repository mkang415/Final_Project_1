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
		
		// �����Ķ���� curPage �Ľ�
		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		// ��ü �Խñ� ��
		int totalCount = noticeDao.selectCntAll();
				
		// ����¡ ��ü ����
		NoticePaging paging = new NoticePaging(totalCount, curPage);

		return paging;
		
	}

	@Override
	public Notice getNoticeno(HttpServletRequest req) {
		// �����Ķ���� boardno �Ľ�
		String param = req.getParameter("notice_idx");
		int boardno = 0;
		if( param!=null && !"".equals(param) ) {
			boardno = Integer.parseInt(param);
		}
		
		//Board ��ü ����
		Notice board = new Notice();
		board.setNotice_idx(boardno);
		
		return board;
	}

	
	@Override
	public Notice view(Notice board) {

		//�Խñ� ��ȸ�� +1
		noticeDao.updateHit(board);
		
		//�Խñ� ��ȸ ��ȯ
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

		
		//÷������ ����
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
		//������ ����� ���
		String storedPath = context.getRealPath("upload");

		//UUID
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		String name = file.getOriginalFilename()+"_" +uId;
		
		File dest = new File(storedPath, name);
		try {
			file.transferTo(dest); //��������			
		}
		catch (IllegalStateException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
			
		}
		
		//DB�� ���� (���ε� ���� ���)
		NoticeFile filetest = new NoticeFile();
		filetest.setOrigin_name(file.getOriginalFilename());
		filetest.setStored_name(name);
//		int boardno = boardDao.selectBoardno(); // ���� ����� ���� �Խ��� ��ȣ�� �޴´�.
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
