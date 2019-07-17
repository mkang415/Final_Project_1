package notice.service.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.Notice;
import dto.NoticeFile;
import util.NoticePaging;


public interface NoticeService {

	public List<Notice> list(NoticePaging paging);

	public NoticePaging getCurPage(HttpServletRequest req);

	public Notice getNoticeno(HttpServletRequest req);

	public Notice view(Notice notice);

	public void writeNotice(Notice notice, HttpSession session, MultipartFile fileupload);

	public void updateNotice(Notice notice);

	public void deleteNotice(Notice notice);


	public void filesave(MultipartFile fileupload, ServletContext context, int notice_no);

	public NoticeFile viewFile(Notice notice);

	public NoticeFile getFile(int fileno);
}
