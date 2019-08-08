package reply.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
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
	@RequestMapping(value = "/reply/insert", method=RequestMethod.POST)
	public @ResponseBody String insertReply(
			HttpSession session,
			BoardReply reply
			) {
		
		replyService.insert(session, reply);
		
		return "success";
	}
	
	//	댓글 리스트 불러오기
	@RequestMapping(value = "/reply/list", method=RequestMethod.POST)
	public String replyList(
			Model model,
			int board_idx,
			HttpSession session
			) {
		logger.info("댓글 리스트 불러오기");
		List<HashMap<String, Object>> replyList = replyService.getReplyList(board_idx);
		model.addAttribute("replylist", replyList);
		
		return "reply/getreply";
	}
	
	//	댓글 삭제
	@RequestMapping(value = "/reply/delete", method=RequestMethod.GET)
	public String deleteReply(
			int reidx ) {
		logger.info("댓글 삭제");
		logger.info("번호 : "+ reidx);
		int board_idx = replyService.delete(reidx);
		
		
		return "redirect: /board/view?brdidx="+board_idx;
	}
	
	//	댓글 수정
	@RequestMapping(value = "reply/update", method = RequestMethod.POST)
	public @ResponseBody String update(
			BoardReply boardReply
			) {
	
		replyService.update(boardReply);
		return "success";
	}
}
