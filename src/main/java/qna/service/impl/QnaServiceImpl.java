package qna.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dto.Qna;
import qna.dao.face.QnaDao;
import qna.service.face.QnaService;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired QnaDao qnaDao;

	@Override
	public Qna test() {

		return qnaDao.test();
	}
}
