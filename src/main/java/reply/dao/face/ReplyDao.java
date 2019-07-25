package reply.dao.face;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;

import dto.BoardReply;

public interface ReplyDao {

	List<HashMap<String, Object>> getReplyList(int board_idx);

	void insert(BoardReply reply);

	void delete(int reply_idx);
=======
import java.util.List;

import dto.Notice;
import dto.NoticeReply;


public interface ReplyDao {

	public List<NoticeReply> selectComment(Notice notice);

	public void insertNoticeReply(NoticeReply comment);

	public void deleteComment(NoticeReply noticeReply);

	public int countComment(NoticeReply noticeReply);
>>>>>>> 6cdb5c7ff30cdd1964c9b3ae14556164ae477e13

}
