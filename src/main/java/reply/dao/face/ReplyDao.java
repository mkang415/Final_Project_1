package reply.dao.face;

import java.util.List;

import dto.Notice;
import dto.NoticeReply;


public interface ReplyDao {

	public List<NoticeReply> selectComment(Notice notice);

	public void insertNoticeReply(NoticeReply comment);

	public void deleteComment(NoticeReply noticeReply);

	public int countComment(NoticeReply noticeReply);

}
