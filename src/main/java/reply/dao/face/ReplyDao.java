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

	// 답글 입력 위한 step 조정
	public void updateStep(NoticeReply comment);

	public NoticeReply selectStep(int reply_idx);

	//답글 insert
	public void insertNoticeReplyTo(NoticeReply comment);

	void brdDelete(int board_idx);

	int getBrdidx(int reply_idx);

}
