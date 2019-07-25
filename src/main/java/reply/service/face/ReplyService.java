package reply.service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.BoardReply;

public interface ReplyService {

	List<HashMap<String, Object>> getReplyList(int brdidx);

	void insert(HttpSession session, BoardReply reply);

	void delete(int reply_idx);

}
