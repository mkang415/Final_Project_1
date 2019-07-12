package vote.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dto.Vote;
import vote.service.face.VoteService;

@Controller
public class VoteController {
	public static Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@Autowired VoteService voteService;
	
	@RequestMapping(value = "/vote/test", method = RequestMethod.GET)
	public void voteTest() {
		Vote test = voteService.test();
		
		logger.info(test.toString());
	}
}
