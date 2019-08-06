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
	
	@Override
	public List<HashMap<String, Object>> getReplyList(int brdidx) {
		
		return replyDao.getReplyList(brdidx);
	}

	@Override
	public void insert(HttpSession session, BoardReply reply) {
		reply.setMember_idx((int) session.getAttribute("member_idx"));
		replyDao.insert(reply);
		
	}

	@Override
	public void delete(int reply_idx) {
		replyDao.delete(reply_idx);
		
	}

}
