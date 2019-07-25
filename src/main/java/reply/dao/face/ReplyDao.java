package reply.dao.face;

import java.util.HashMap;
import java.util.List;

import dto.BoardReply;

public interface ReplyDao {

	List<HashMap<String, Object>> getReplyList(int board_idx);

	void insert(BoardReply reply);

	void delete(int reply_idx);

}
