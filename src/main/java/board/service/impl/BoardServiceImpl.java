package board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.face.BoardDao;
import board.service.face.BoardService;
import dto.BoardReply;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDao boardDao;

	@Override
	public BoardReply test() {
		
		return boardDao.test();
	}
}
