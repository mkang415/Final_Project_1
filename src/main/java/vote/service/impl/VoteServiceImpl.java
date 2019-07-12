package vote.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Vote;
import vote.dao.face.VoteDao;
import vote.service.face.VoteService;

@Service
public class VoteServiceImpl implements VoteService{

	@Autowired VoteDao voteDao;
	
	@Override
	public Vote test() {
		
		return voteDao.test();
	}

}
