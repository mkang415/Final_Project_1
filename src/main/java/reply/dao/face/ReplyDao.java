package reply.dao.face;


import java.util.HashMap;
import java.util.List;

import dto.BoardReply;
import dto.Notice;
import dto.NoticeReply;

	




public interface ReplyDao {

	List<HashMap<String, Object>> getReplyList(int board_idx);

	void insert(BoardReply reply);

	void delete(int reply_idx);

	public List<NoticeReply> selectComment(Notice notice);

	public void insertNoticeReply(NoticeReply comment);

	public void deleteComment(NoticeReply noticeReply);

	public int countComment(NoticeReply noticeReply);

}
