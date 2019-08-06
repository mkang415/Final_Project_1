package reply.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.BoardReply;
import reply.dao.face.ReplyDao;
import reply.service.face.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired ReplyDao replyDao;
	
	//	댓글 리스트 불러오기
	@Override
	public List<HashMap<String, Object>> getReplyList(int brdidx) {
		
		return replyDao.getReplyList(brdidx);
	}

	//	작성한 댓글 삽입
	@Override
	public void insert(HttpSession session, BoardReply reply) {
		reply.setMember_idx((int) session.getAttribute("member_idx"));
		replyDao.insert(reply);
		
	}

	//	댓글 삭제
	@Override
	public int delete(int reply_idx) {
		
		int brdidx = replyDao.getBrdidx(reply_idx);
		replyDao.delete(reply_idx);
		
		return brdidx;
		
	}

	//	게시글 삭제시 댓글도 삭제
	@Override
	public void brdDelete(int board_idx) {
		replyDao.brdDelete(board_idx);
		
	}

}
