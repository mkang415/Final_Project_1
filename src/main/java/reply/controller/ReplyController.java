package reply.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.BoardReply;
import reply.service.face.ReplyService;

@Controller
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired ReplyService replyService;

	//	댓글 삽입
	@RequestMapping(value = "reply/insert", method=RequestMethod.POST)
	public @ResponseBody String insertReply(
			HttpSession session,
			BoardReply reply
			) {
		
		replyService.insert(session, reply);
		
		return "success";
	}
	
	//	댓글 리스트 불러오기
	@RequestMapping(value = "reply/list", method=RequestMethod.GET)
	public @ResponseBody List<HashMap<String, Object>> replyList(
			Model model,
			BoardReply reply
			) {
		List<HashMap<String, Object>> replyList = replyService.getReplyList(reply.getBoard_idx());
		
		return replyList;
	}
	
//	//	댓글 삭제
//	@RequestMapping(value = "reply/delete", method=RequestMethod.POST)
//	public String deleteReply(
//			int reply_idx ) {
//		logger.info("댓글 삭제");
//		logger.info("번호 : "+ reply_idx);
//		replyService.delete(reply_idx);
//		
//		return "redirect: /board/freeview?brdidx="+reply.getBoard_idx();
//	}
}
