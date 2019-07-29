package notice.service.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.Notice;
import dto.NoticeFile;
import dto.NoticeReply;
import util.NoticePaging;

public interface NoticeService {

	public NoticePaging getCurpage(HttpServletRequest req);

	public List<Notice> list(NoticePaging paging);

	public Notice getBoardno(int notice_idx);

	public Notice view(Notice notice);

	public void writeBoard(Notice notice, HttpSession session, MultipartFile fileupload);


	
	public void filesave(MultipartFile fileupload, ServletContext context, int notice_idx);

	public NoticeFile getFile(int fileno);

	public NoticeFile viewFile(Notice notice);

	public List<NoticeReply> getCommentList(Notice notice);



	public void insertComment(NoticeReply comment);

	public boolean deleteComment(NoticeReply noticeReply);

	public void updateNotice(Notice notice);

	public void deleteNotice(Notice notice);



}
